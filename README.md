# Mint Crispr
Mint Crispr is a low-cost disease diagnosis tool for use in economically disadvanted hospitals. Built with my dad, a consultant haematologist for the NHS, for use in Malawi.

### About
Mint Crispr works by using CRISPR-Cas9 to find specific genetic markers of specific diseases such as types of Leukemia or viruses like Malaria.

Before the device is used, a molecule is made that uses CRISPR to match to a pre-programmed genetic sequence, and is combined with a flourescent marker covered in a sheath. This sheath blocks the light coming from the flourescent marker.

The user would combine the pre-made molecule with a blood sample on a credit-card-sized piece of paper and insert it into the device. When the target sequence is found by CRISPR, a genetic 'pair of scissors' (this is Cas part of the system) cuts the sheath allowing the a fluorescent marker to be detected under UV light. This indicates the presence of the targetted disease. The flouresence is sensed by the Mint Crispr device and sent to the user's phone as a positive reading. This has be performed at a raised temperature, so the whole device was placed into an incubation cabinet during use.

The previous solution for leukemia diagnosis in Malawi was to send blood smears to Newcastle University in the UK where an expensive device would detect the presence of cancerous diseases. This was a week long process from start to finish. Mint Crispr meant that doctors could get a diagnosis within half an hour and, until it was replaced, likely saved many lives.

### The Hardware
For the first iteration, I designed and 3D printed a case to hold a rechargable batter, a battery charger (the board at the top), a bluetooth module (board on the right) and a small microcontroller (board on the bottom). Poking out just above the battery, there is a high-gain light sensor mounted to the inside of the 3D print. This is used to pick up the luminating dot.

##### Closed up
<img src="https://github.com/user-attachments/assets/f8e811dc-cdd2-408f-99b2-d8c9d62c391c" alt="Device with the case fully on" width="500"/>

##### Open for development
<img src="https://github.com/user-attachments/assets/ea0d1e13-eb59-4907-b7cb-c7dff88ea5b0" alt="Device opened up for developent" width="500"/>

##### Powered up and working
<img src="https://github.com/user-attachments/assets/1e877638-79b3-4526-a2d2-83a24beeee7b" alt="Device powered up with internals showing" width="500"/>


### The Software Stack
The software was super simple (as you can see from the repo)! On the device, the microcontroller would wait for a bluetooth connection, poll the sensor, and then submit a positive or negative result to an iPhone app.
The iphone app would then display to the user if the test returned a positive or negative result, and stored that information in firebase.

Here are a couple of the design mock ups and what they looked like once implemented. I have learnt a lot more about UX and design since making this 7 years ago.

<p align="center">
  <img src="https://github.com/user-attachments/assets/11d8bc8d-7f5d-45b0-b698-c4ea055466d4" height="500"/>
  <img src="https://github.com/user-attachments/assets/5e32e139-dd92-4453-bf63-510c74155c0d" height="500"/>
</p>
<br/>
<p align="center">
  <img src="https://github.com/user-attachments/assets/8feb507d-2f13-41b9-b4a8-94cbdd2cd85f" height="500"/>
</p>
<br/>
<p align="center">
  <img src="https://github.com/user-attachments/assets/24d2edfc-74a9-4b84-b56d-cb8e0551da28" height="500"/>
  <img src="https://github.com/user-attachments/assets/e098adbd-6cd7-40d1-8d45-8752aa0fa99a" height="500"/>
</p>

### The Name
The name was inspired by Nestle's Peppermint Crisp chocolate bar, that my dad found while in Malawi, and the use of CRISPR-Cas9 within the device. Hence, Mint Crispr.
![peppermint_crisp](https://github.com/user-attachments/assets/5b60bd19-e1af-4899-bcc5-76787b74d174)
