Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795C11863
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 07:20:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nEA1SM27//8IP8Ln9TN13cwMYOWzdv1RsGhBhmMCRExbcLJMCt1ICQMnVGiV0eoTqU7sFT4SzL3Cu+XO717/ZD41sPHeXbNuDV9uGXJSCHhNdR7iNvuMDR3i1A31NNC8nhIGGVI93OpI/gVTJxNtaDeLzzzVd/q9sFAdG5BrDKOFnMwgoe+pG1skMDuSQt2lgP7yqCwfJCaJqe3K3Zyi6k8mKp3Q1XTtL8rRG1SVrfUJvWMq1Nk79w+JkjThvlPenNXL5bPcWcU7Ge0WcRrse7GlfUkz9yfUf/O168FRj39MxFatBn5jgzsZ68xvMDuqOEMPXK/PlyK0cujUDqvNyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CbgB2crEqmEz5KwaGjtQEHPz4A3ZpF2ixysco86Z+sY=;
 b=UD8Tr6+7aEkwOSDad6m7eweXxqyp5TzUfVJiIn6K8Bp+MmxqJRVlJFdIvRh4fdFsPofpUVFgXQJ/Yq0QEMeBHXN2XRzsEaAK/EJVQ0ipwjcde/r1jnav4398vejcVrsXEpY70lH2DWCrpMsqrqXTmQacqWYYboSnSlzfi4tiQxhUc2L1U5Sxd032wa2eZ6q/3jpJ0pyCJSZHeYVQlHHEET5KtLm/5L0Y7QpHmikQWIzE3n5vqkI5d9IViPb/DTIXQ8+Qp9qnwfXhxXLetIGiTZBiuahXZq8DTlNX+l8iysENnVsXshDvg/0vnL4jy8hSWiZpIybEQz+enKow+7YEOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CbgB2crEqmEz5KwaGjtQEHPz4A3ZpF2ixysco86Z+sY=;
 b=yUKTQdUuz3U/HghVC1hhOfiFLIjBWKL9NdwzEKw6AkfCcxd6tgPJ+JNkkpLdbXI+CiyMdqyV6rxQ2D5z08Q96nsnzDLM632482yQEt2Yo/J6eBfuAaEFWaE11W+uZOO5g/ep7vcN50/s6P2j+J5kbraZZe8jitc+8yEFRYJOmxk=
Received: from DM4PR12MB5133.namprd12.prod.outlook.com (2603:10b6:5:390::6) by
 SJ1PR12MB6313.namprd12.prod.outlook.com (2603:10b6:a03:458::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Thu, 2 Mar
 2023 07:20:54 +0000
Received: from DM4PR12MB5133.namprd12.prod.outlook.com
 ([fe80::f01f:e65a:6b32:3beb]) by DM4PR12MB5133.namprd12.prod.outlook.com
 ([fe80::f01f:e65a:6b32:3beb%2]) with mapi id 15.20.6156.018; Thu, 2 Mar 2023
 07:20:54 +0000
From: "Shih, Jude" <Jude.Shih@amd.com>
To: kernel test robot <lkp@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Kazlauskas, Nicholas"
	<Nicholas.Kazlauskas@amd.com>, "Deucher, Alexander"
	<Alexander.Deucher@amd.com>, Sasha Levin <sashal@kernel.org>, "Wang, Chao-kai
 (Stylon)" <Stylon.Wang@amd.com>, "Wang, Yu (Charlie)" <Yu.Wang4@amd.com>
Subject: RE: [stable:linux-5.15.y 4439/9999] htmldocs:
 ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:633: warning: expecting
 prototype for dmub_aux_setconfig_reply_callback(). Prototype was for
 dmub_aux_setconfig_callback() instead
Thread-Topic: [stable:linux-5.15.y 4439/9999] htmldocs:
 ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:633: warning: expecting
 prototype for dmub_aux_setconfig_reply_callback(). Prototype was for
 dmub_aux_setconfig_callback() instead
Thread-Index: AQHZSx1va5AbDTKT6EeBrH7BkaYika7nF77w
Date: Thu, 2 Mar 2023 07:20:54 +0000
Message-ID:
 <DM4PR12MB51334EE60D2103DA6ED699C5F7B29@DM4PR12MB5133.namprd12.prod.outlook.com>
References: <202302281017.9qcgLAZi-lkp@intel.com>
In-Reply-To: <202302281017.9qcgLAZi-lkp@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-03-02T07:20:50Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=f0249bac-225f-4bea-a2f0-f84e905fc5cb;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_enabled: true
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2023-03-02T07:20:50Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid:
 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid:
 e1911da2-92e3-43aa-8b7e-836e2f796d91
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5133:EE_|SJ1PR12MB6313:EE_
x-ms-office365-filtering-correlation-id: ee7ac1c9-6679-4798-782c-08db1aeea8ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 bRCvgFCbm+DpGBD7GuczB0NJYu/8tzVBqUBCZecdoR7cxhmlhBr5A+A9He2NCovMaVSuQtHY2qHhSKTVo7w3E5cKlyep2JbhFPfhDkSzeTKxh9fHmJVIx11A0U1lmk48c3FXhM5brFdNlTT2Lb+gUb7hwP7K0AcCBz8YgrxfGFC/R/AZioV44Gq5P8kOS8H4pj7y3O9Ly+we7v5/dhHdMBSrk0QVYGLdCBk5nAIlPo78gdNQOQEx9/WbA6WL14IKWnqncrav6t57cwAcnKx0RCFzh9pI7glF32qIjS/8VY0tRMoF94ZIX3Hu/JqsVK9bV/SiNEOgS6l4PkkZqSRz25GPsybRumy02kQCQb3iVJo4CT1n43sGJEwccQVyZf1DURxA+uPI0g06kUNgfvkxnxXOHBlQNGY/fdd/idCIJNFBwy5SdppUKWXXnuwMwHygvFMysfqY8QfvJB+h3NFLw08TBCUn1b1X0B1Ubxe3xnoDWmfhJYrZxKJwkrBord0c3Ny3OY3po+LI6UFGrEfufe9lxX6h81nDlwosmypzTO4q3+/Emcz4Dps7APDP5Gtj8RWDLfgoaEnDY0MOhDyO7PrQsPqjHU0SUFjcDm7COd2yB52EoJGSOQg56HYldyoqeNnUA/hOmCZ2ptIgJDEiBqaExF7V/OqkA2t9Ajo/bc311HEtd/j31Q8cE8ZmQuvIF/T6qMxyjYbC/h0gd3/JXhDDE4ttXaNAvEwdk3swBp8PxySg84utN9q5xiiGmJ8WlTWUszFTm7t18TBi4SHIcA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5133.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(136003)(346002)(39860400002)(376002)(451199018)(83380400001)(54906003)(33656002)(122000001)(4326008)(66446008)(55016003)(38100700002)(8676002)(64756008)(6916009)(26005)(186003)(9686003)(66556008)(6506007)(7696005)(478600001)(8936002)(966005)(316002)(71200400001)(53546011)(76116006)(41300700001)(66476007)(66946007)(5660300002)(2906002)(52536014)(38070700005)(86362001)(15866825006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?0mmDH94o/SjatwfzWT//hcHZJPL5n3Zg9AwRdZYJbdbCP+WLN9tBTH2z9rIF?=
 =?us-ascii?Q?FUYuoJQV+infrqMoCSeEU/jndHOCTKl65o6hbaMvh3vNVT9sNxytFTeXaDYJ?=
 =?us-ascii?Q?O422brfwdQbHE+V22YJRKHP9GYt/qTt76KW1vdPUNKIsyLZvY7qSuciHWANV?=
 =?us-ascii?Q?PlHR48lMzjKv5ieIhwLwCIlmakQqx4RvwAlnY897X/9Oz+cx93fgo1hXqBhA?=
 =?us-ascii?Q?2iLPOhB7SMVW9fj9zxu8BTCeNkMrv9EsyYGYL/RXN0LPPgGTuaECpSkeylhZ?=
 =?us-ascii?Q?i7CS71/0N7Tg+G7KszEY9OzSQ9yXV+Aru3DkszWGxWh7j1Lu/qbqYgbz1dQw?=
 =?us-ascii?Q?5YPeRMpr37JsUkQfbn9Ol/EZNYWzTjGnQz5ht7imdCl/HVgyQgg7CgvN20SF?=
 =?us-ascii?Q?MaCpBJIRHbgUunO3kXkQjYUaLdnAocQ5Vs9XMdAkmmwzQ0JRI4//XowpSK4v?=
 =?us-ascii?Q?p/SAX/4YaqyfEPfc9oWrI07R4RdysouzcBYJpvhOoMmHwMUOlRDvLqI3P9va?=
 =?us-ascii?Q?qNcKujOwaOLixzAI03MQaJx7NCbCB9/XxsaObqtaUnFQZj+fHBWZ6mcSL5Zr?=
 =?us-ascii?Q?067ugc6fTyyUJNkV8ehrF9oFmzMxF8MusEry2KMWQ+PFbh0NIW9tk7M0tZPR?=
 =?us-ascii?Q?xIay0hJdQui6AnnBjiXwO0X96GDssP45G6lr6UGZYPIcguXXrWXtNRr3NEEb?=
 =?us-ascii?Q?RwR/5VvF/t97h2r3v9HkNbyM+mCXlg5giqOW0AHTve408hlESLD1zvH+90oD?=
 =?us-ascii?Q?jzzh5FQx43DIHR8Su/BcjiJaIiBWaCIDbp4n24GLknpBwGNRVIhxM66t+own?=
 =?us-ascii?Q?znoyB04BW+3PcQ9983mbqdI61km1QuRKO/Pk+0tQbKeC3RW8zDIav5IWQOHp?=
 =?us-ascii?Q?eGgcVigxPZHVXpTVoO1/qfg4V+ncABwX9cf38l26TUIbjcsDy7tEKk4iqLAS?=
 =?us-ascii?Q?FLO9P7SKtJq+ynh4+hdW19pwJB6m+jLxBf24iP6ruHWQZwxmvHxp+asoy9rr?=
 =?us-ascii?Q?lq0ibog/aGzCUWdEhLkx87nLxs+6G/sF9W8zyBTYue8RQgw+8a0tRSQMYc/D?=
 =?us-ascii?Q?1NET3Dqm1h22Wq6XPjSecfac8PjSm6LG5wvGFWIo1pqvlODHke6hQvd48Pse?=
 =?us-ascii?Q?moL76eKzRr0NFS8WXZnwjm5DNhpC/Ch8EPz9KzDFSFS9eoVNOkCaGKAlsk0W?=
 =?us-ascii?Q?G+GngPbw1ofja6UoRct7SX2Iiy1FZOpa+p/IAet5okpPYupUivLwcQunQfxP?=
 =?us-ascii?Q?LRnj0MEsbvl/Pu37UFplKegD7ZY126NCXIXIVnel/wMEWrCfnWPySTeFlxru?=
 =?us-ascii?Q?GB18HGPzKCld6693HWR8VG8U2B+6B4ngwIeryaimu+Idql8WXkaMtgKNu23g?=
 =?us-ascii?Q?1GNKSDAVm+IYRjqH8lnYNZO76SUG+I4fXkTV0qGMOcFkiGSyXa8CgvbrEc0d?=
 =?us-ascii?Q?oNUh9Z+UNXUZNF+tERivA7HHZ9fC8m5Wz9ML4Yj0m7G5A3AJ+Epp/qaDKJUK?=
 =?us-ascii?Q?1PQUtAb3O49fj+Y/ZRR/fbq5wXcm4Uh9RhaF5HK4bXWqQh33Lpy8GtGYhzYw?=
 =?us-ascii?Q?xkmoDsBuiBUdJofnee+R3eDvdsyp2onSOXq5jLef?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee7ac1c9-6679-4798-782c-08db1aeea8ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2023 07:20:54.1221
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkTqjlKxx9Lf3geTXQORctnOfDPF05Yy6heDlqQjaDrVoxMZc2v7Zu6PbJjlN/56VOdgwFjNy/Y/LP1O1qFlxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6313

[AMD Official Use Only - General]

Hi

Here is the full information of the patch. Please let us know if need any h=
elp.

commit 03f2abb07e54b3e0da54c52a656d9765b7e141c5=20
Author: Yann Dirson <ydirson@free.fr>
Date:   Tue Dec 14 00:30:29 2021 +0100
=20
    amdgpu: fix some kernel-doc markup
=20
Best Regards,

Jude

-----Original Message-----
From: kernel test robot <lkp@intel.com>=20
Sent: Tuesday, February 28, 2023 10:35 AM
To: Shih, Jude <Jude.Shih@amd.com>
Cc: oe-kbuild-all@lists.linux.dev; Greg Kroah-Hartman <gregkh@linuxfoundati=
on.org>; Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>; Deucher, Alexa=
nder <Alexander.Deucher@amd.com>; Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 4439/9999] htmldocs: ./drivers/gpu/drm/amd/di=
splay/amdgpu_dm/amdgpu_dm.c:633: warning: expecting prototype for dmub_aux_=
setconfig_reply_callback(). Prototype was for dmub_aux_setconfig_callback()=
 instead

Hi Jude,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
.git linux-5.15.y
head:   d383d0f28ecac0f3375bdfb9a0c4bfac979f6f8f
commit: 734d5ce02cb069cccedc993d8f1dc0ea41cfa3dd [4439/9999] drm/amd/displa=
y: Support for DMUB HPD interrupt handling
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stab=
le.git/commit/?id=3D734d5ce02cb069cccedc993d8f1dc0ea41cfa3dd
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/g=
it/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout 734d5ce02cb069cccedc993d8f1dc0ea41cfa3dd
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG=
_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302281017.9qcgLAZi-lkp@int=
el.com/

All warnings (new ones prefixed by >>):

>> ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:633: warning: expect=
ing prototype for dmub_aux_setconfig_reply_callback(). Prototype was for dm=
ub_aux_setconfig_callback() instead

vim +633 ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c

   622=09
   623	/**
   624	 * dmub_aux_setconfig_reply_callback - Callback for AUX or SET_CONFI=
G command.
   625	 * @adev: amdgpu_device pointer
   626	 * @notify: dmub notification structure
   627	 *
   628	 * Dmub AUX or SET_CONFIG command completion processing callback
   629	 * Copies dmub notification to DM which is to be read by AUX command=
.
   630	 * issuing thread and also signals the event to wake up the thread.
   631	 */
   632	void dmub_aux_setconfig_callback(struct amdgpu_device *adev, struct =
dmub_notification *notify)
 > 633	{
   634		if (adev->dm.dmub_notify)
   635			memcpy(adev->dm.dmub_notify, notify, sizeof(struct dmub_notificati=
on));
   636		if (notify->type =3D=3D DMUB_NOTIFICATION_AUX_REPLY)
   637			complete(&adev->dm.dmub_aux_transfer_done);
   638	}
   639=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
