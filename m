Content-Type: multipart/mixed; boundary="===============5626536708746931109=="
MIME-Version: 1.0
From: Long Li <longli@microsoft.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 2/3] hv_netvsc: Wait for completion on request NVSP_MSG4_TYPE_SWITCH_DATA_PATH
Date: Thu, 07 Jan 2021 18:36:37 +0000
Message-ID: <
 <BN8PR21MB11553F84E846C4B5EFC72C14CEAF9@BN8PR21MB1155.namprd21.prod.outlook.com>>
In-Reply-To: <BN8PR21MB11558420E44B211793B308F9CED09@BN8PR21MB1155.namprd21.prod.outlook.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5626536708746931109==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Subject: RE: [PATCH 2/3] hv_netvsc: Wait for completion on request
> NVSP_MSG4_TYPE_SWITCH_DATA_PATH
> =

> > Subject: Re: [PATCH 2/3] hv_netvsc: Wait for completion on request
> > NVSP_MSG4_TYPE_SWITCH_DATA_PATH
> >
> > Hi Long,
> >
> > Thank you for the patch! Perhaps something to improve:
> >
> > [auto build test WARNING on linus/master] [also build test WARNING on
> > v5.11-rc2 next-20210104] [If your patch is applied to the wrong git
> > tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> >
> https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit-
> > scm.com%2Fdocs%2Fgit-format-
> >
> patch&amp;data=3D04%7C01%7Clongli%40microsoft.com%7C695cf3d454eb468
> >
> b85fb08d8b1fb3ddd%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C6
> >
> 37455042608743102%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD
> >
> AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D
> >
> 90AgH9HlZumRZ4UNC4uD2WIRpZ6ZEnvIdOKOfzYcXpI%3D&amp;reserved=3D0]
> >
> > url:
> >
> https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith
> > ub.com%2F0day-ci%2Flinux%2Fcommits%2FLong-Li%2Fhv_netvsc-Check-
> VF-
> > datapath-when-sending-traffic-to-VF%2F20210106-
> >
> 092237&amp;data=3D04%7C01%7Clongli%40microsoft.com%7C695cf3d454eb46
> >
> 8b85fb08d8b1fb3ddd%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C
> >
> 637455042608753098%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM
> >
> DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata
> >
> =3DvtVJ8pXIOxIYeKdaqT9pD1%2BEuOM3wz4yqsHh8uWsGP4%3D&amp;reserv
> > ed=3D0
> > base:
> > https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.
> > k
> ernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git&
> >
> amp;data=3D04%7C01%7Clongli%40microsoft.com%7C695cf3d454eb468b85fb0
> >
> 8d8b1fb3ddd%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C6374550
> >
> 42608753098%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQ
> >
> IjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DFXMG
> > CFODFoq3KLklxr17iVHiq%2FWmJ3c0fM7vIZRfNmc%3D&amp;reserved=3D0
> > e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62
> > config: i386-allyesconfig (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-15) 9.3.0 reproduce (this is a W=3D1
> > build):
> >         #
> >
> https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith
> > ub.com%2F0day-
> >
> ci%2Flinux%2Fcommit%2F8c92b5574da1b0c2aee3eab7da2c4dad8d92572c&a
> >
> mp;data=3D04%7C01%7Clongli%40microsoft.com%7C695cf3d454eb468b85fb08
> >
> d8b1fb3ddd%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C63745504
> >
> 2608753098%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj
> >
> oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DMMXkQ
> > KENGpyfW0NJs2khBSKTuBExFSZaWHgWyyIj6UU%3D&amp;reserved=3D0
> >         git remote add linux-review
> >
> https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith
> > ub.com%2F0day-
> >
> ci%2Flinux&amp;data=3D04%7C01%7Clongli%40microsoft.com%7C695cf3d454e
> >
> b468b85fb08d8b1fb3ddd%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0
> > %7C637455042608753098%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL
> jA
> >
> wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s
> >
> data=3Duge6PX2NyAe%2BjRtvgOhR5xzN2ltBctZXeZwn0hoYco0%3D&amp;reser
> > ved=3D0
> >         git fetch --no-tags linux-review
> > Long-Li/hv_netvsc-Check-VF-datapath-
> > when-sending-traffic-to-VF/20210106-092237
> >         git checkout 8c92b5574da1b0c2aee3eab7da2c4dad8d92572c
> >         # save the attached .config to linux build tree
> >         make W=3D1 ARCH=3Di386
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> >    drivers/net/hyperv/netvsc.c: In function 'netvsc_send_completion':
> > >> drivers/net/hyperv/netvsc.c:778:14: warning: cast to pointer from
> > >> integer of different size [-Wint-to-pointer-cast]
> >      778 |   pkt_rqst =3D (struct nvsp_message *)cmd_rqst;
> >          |              ^
> =

> I think this warning can be safely ignored.
> =

> When sending packets over vmbus, the address is passed as u64 and stored
> internally as u64 in vmbus_next_request_id(). Passing a 32 bit address wi=
ll
> not lose any data. Later the address is retrieved from vmbus_request_addr=
()
> as a u64. Again, it will not lose data when casting to a 32 bit address.
> =

> This method of storing and retrieving addresses are used throughout other
> hyper-v drivers. If we want to not to trigger this warning, I suggest mak=
ing a
> patch to convert all those usages in all hyper-v drivers.
> =

> Thanks,
> Long

Please discard this patch. I'm sending v2 to fix the warnings.

> =

> >
> >
> > vim +778 drivers/net/hyperv/netvsc.c
> >
> >    757
> >    758	static void netvsc_send_completion(struct net_device *ndev,
> >    759					   struct netvsc_device *net_device,
> >    760					   struct vmbus_channel
> > *incoming_channel,
> >    761					   const struct vmpacket_descriptor
> > *desc,
> >    762					   int budget)
> >    763	{
> >    764		const struct nvsp_message *nvsp_packet =3D
> > hv_pkt_data(desc);
> >    765		u32 msglen =3D hv_pkt_datalen(desc);
> >    766		struct nvsp_message *pkt_rqst;
> >    767		u64 cmd_rqst;
> >    768
> >    769		/* First check if this is a VMBUS completion without data
> > payload */
> >    770		if (!msglen) {
> >    771			cmd_rqst =3D
> > vmbus_request_addr(&incoming_channel->requestor,
> >    772						      (u64)desc->trans_id);
> >    773			if (cmd_rqst =3D=3D VMBUS_RQST_ERROR) {
> >    774				netdev_err(ndev, "Invalid transaction id\n");
> >    775				return;
> >    776			}
> >    777
> >  > 778			pkt_rqst =3D (struct nvsp_message *)cmd_rqst;
> >    779			switch (pkt_rqst->hdr.msg_type) {
> >    780			case NVSP_MSG4_TYPE_SWITCH_DATA_PATH:
> >    781				complete(&net_device->channel_init_wait);
> >    782				break;
> >    783
> >    784			default:
> >    785				netdev_err(ndev, "Unexpected VMBUS
> > completion!!\n");
> >    786			}
> >    787			return;
> >    788		}
> >    789
> >    790		/* Ensure packet is big enough to read header fields */
> >    791		if (msglen < sizeof(struct nvsp_message_header)) {
> >    792			netdev_err(ndev, "nvsp_message length too
> > small: %u\n", msglen);
> >    793			return;
> >    794		}
> >    795
> >    796		switch (nvsp_packet->hdr.msg_type) {
> >    797		case NVSP_MSG_TYPE_INIT_COMPLETE:
> >    798			if (msglen < sizeof(struct nvsp_message_header) +
> >    799					sizeof(struct
> > nvsp_message_init_complete)) {
> >    800				netdev_err(ndev, "nvsp_msg length too
> > small: %u\n",
> >    801					   msglen);
> >    802				return;
> >    803			}
> >    804			fallthrough;
> >    805
> >    806		case NVSP_MSG1_TYPE_SEND_RECV_BUF_COMPLETE:
> >    807			if (msglen < sizeof(struct nvsp_message_header) +
> >    808					sizeof(struct
> > nvsp_1_message_send_receive_buffer_complete)) {
> >    809				netdev_err(ndev, "nvsp_msg1 length too
> > small: %u\n",
> >    810					   msglen);
> >    811				return;
> >    812			}
> >    813			fallthrough;
> >    814
> >    815		case NVSP_MSG1_TYPE_SEND_SEND_BUF_COMPLETE:
> >    816			if (msglen < sizeof(struct nvsp_message_header) +
> >    817					sizeof(struct
> > nvsp_1_message_send_send_buffer_complete)) {
> >    818				netdev_err(ndev, "nvsp_msg1 length too
> > small: %u\n",
> >    819					   msglen);
> >    820				return;
> >    821			}
> >    822			fallthrough;
> >    823
> >    824		case NVSP_MSG5_TYPE_SUBCHANNEL:
> >    825			if (msglen < sizeof(struct nvsp_message_header) +
> >    826					sizeof(struct
> > nvsp_5_subchannel_complete)) {
> >    827				netdev_err(ndev, "nvsp_msg5 length too
> > small: %u\n",
> >    828					   msglen);
> >    829				return;
> >    830			}
> >    831			/* Copy the response back */
> >    832			memcpy(&net_device->channel_init_pkt,
> > nvsp_packet,
> >    833			       sizeof(struct nvsp_message));
> >    834			complete(&net_device->channel_init_wait);
> >    835			break;
> >    836
> >    837		case NVSP_MSG1_TYPE_SEND_RNDIS_PKT_COMPLETE:
> >    838			netvsc_send_tx_complete(ndev, net_device,
> > incoming_channel,
> >    839						desc, budget);
> >    840			break;
> >    841
> >    842		default:
> >    843			netdev_err(ndev,
> >    844				   "Unknown send completion type %d
> > received!!\n",
> >    845				   nvsp_packet->hdr.msg_type);
> >    846		}
> >    847	}
> >    848
> >
> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> >
> https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.
> > 01.org%2Fhyperkitty%2Flist%2Fkbuild-
> >
> all%40lists.01.org&amp;data=3D04%7C01%7Clongli%40microsoft.com%7C695cf3
> >
> d454eb468b85fb08d8b1fb3ddd%7C72f988bf86f141af91ab2d7cd011db47%7C1
> > %7C0%7C637455042608753098%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM
> C
> >
> 4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&
> >
> amp;sdata=3DAKWfmJrn1C%2BwaqX6wlu95HcPys9K0ju%2FlC%2Bu3O20jAg%3
> > D&amp;reserved=3D0
--===============5626536708746931109==--

