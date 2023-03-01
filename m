Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2065.outbound.protection.outlook.com [40.107.96.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432BC7F0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Mar 2023 01:53:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QzJSUxyo3xEToldWyMP9qlQabT/p6ujI5q8Fpk+XrpDejsitTD6/FMrroVT0/VUifoa5jS45VOtSK83y0i8d1RjjhwFWxmT8JJ13VqAgCZO0Oz9Rn1hxsYrC/JUDSvDcnjLclXYeHAKU4vEwc9oGIYHVbh+YF/C2fnK7+n1ex+Axp3FIc69/8/XEIDqaeC8YmFMwPBdH3jgzL8WweJMiVCvgFScBmDbFL52WWQYQXmypUSIAb5qOQYz7oy3h7oLddjzZl60H221WbxPUj0CMUY80xdXIV+6EefRKHM4MCFZWAjKi5zSV0jTxBW11w2VVuQdnNcKxokpcJKAqCPTwxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sEtCaZeNZxZ10jm1XmV3Bpp2RrYMTElts8K7p+UfOPA=;
 b=ZDkTXB/1lGIyXC0nCfirCLZ7btE0iDSVjJEHnvt85lhOc9fpYw1k+a9l62yTXdADDUuRF03zeiY7no3AhhhK4ZnRHbXhF3V2ResCk2+h942lbDYWT/TA7GigrHcF+Irv72W4pFyx9AVsiizWQQLJKl7p9ZiTMSdoiNVt7E7E7LCQulbDvMTFukk3X83AWiEtsUeREWfAJfJPFbrz6n87Tn8POQ77zXRR0P/6fidMvdrqhKg2HoFiGfpl3751ZJXg7B285AcalS8kHC9cTTSGwcOOLrqerawWfgEs8H/euFBclgWcYK1hStSQa4UFFshccsYg3r2f5AqexT0LwgKBdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEtCaZeNZxZ10jm1XmV3Bpp2RrYMTElts8K7p+UfOPA=;
 b=kk7p1v/Tg+0NAlonihfjXY8U6hxXVr5PwyN717jwvAfm+7IlvKXGZhskRA86fCy44qcV3R3MPz027zei4nRwOLfH3kMC4UOtoOuUuTEXOCxetJgLuge79wL+LYN/15/T1G4cZ6J1X6OoLryeWoRa6M35bghk50nbYxiavYJFr8o=
Received: from DM4PR12MB5133.namprd12.prod.outlook.com (2603:10b6:5:390::6) by
 PH7PR12MB7379.namprd12.prod.outlook.com (2603:10b6:510:20e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Wed, 1 Mar
 2023 01:53:07 +0000
Received: from DM4PR12MB5133.namprd12.prod.outlook.com
 ([fe80::f01f:e65a:6b32:3beb]) by DM4PR12MB5133.namprd12.prod.outlook.com
 ([fe80::f01f:e65a:6b32:3beb%2]) with mapi id 15.20.6134.029; Wed, 1 Mar 2023
 01:53:07 +0000
From: "Shih, Jude" <Jude.Shih@amd.com>
To: kernel test robot <lkp@intel.com>, "Wang, Yu (Charlie)" <Yu.Wang4@amd.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Kazlauskas, Nicholas"
	<Nicholas.Kazlauskas@amd.com>, "Deucher, Alexander"
	<Alexander.Deucher@amd.com>, Sasha Levin <sashal@kernel.org>
Subject: RE: [stable:linux-5.15.y 4439/9999] htmldocs:
 ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:633: warning: expecting
 prototype for dmub_aux_setconfig_reply_callback(). Prototype was for
 dmub_aux_setconfig_callback() instead
Thread-Topic: [stable:linux-5.15.y 4439/9999] htmldocs:
 ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:633: warning: expecting
 prototype for dmub_aux_setconfig_reply_callback(). Prototype was for
 dmub_aux_setconfig_callback() instead
Thread-Index: AQHZSx1va5AbDTKT6EeBrH7BkaYika7lKm2g
Date: Wed, 1 Mar 2023 01:53:07 +0000
Message-ID:
 <DM4PR12MB51337D88C715ED346056DB53F7AD9@DM4PR12MB5133.namprd12.prod.outlook.com>
References: <202302281017.9qcgLAZi-lkp@intel.com>
In-Reply-To: <202302281017.9qcgLAZi-lkp@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-03-01T01:53:04Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=cf70393e-ba0b-4005-837c-6c7128918e66;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_enabled: true
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2023-03-01T01:53:04Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid:
 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid:
 4328c1f8-a3a7-4fc0-9037-7ebd004e4faa
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5133:EE_|PH7PR12MB7379:EE_
x-ms-office365-filtering-correlation-id: c2239124-e820-4368-3a67-08db19f7b43e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 XL9Z+yPzo/7DHP1JqqweEt7rzl++SVX0+Iz0biDhWa3rVkcKqIRz4wH62EUZSAU/A299gJRbz6Ef0shtoOjDFm8vqYyVvSoSdgVeRuppsdK4rGaWcHwzueho8cgxv1q5WKJR6mKJo5rTeDtG2Zt1WTt5s0HAN9gqh6Z0e+bNt9epBl5MNbV8HkeCK6PCvlXHKz7HrpQhydG+QSnMBX8PPzX7UYDDIVe0fpX2My9/zLzRyWX48SIUpVb4+tg2Rh+p99EkyjhQXLSGtipDbl6i4L2Aai/ry2WgDTUtjGzz+Kh3p7EP6I9sbqJzTCj+V3L56lRIGnoZu8JAusksqSjaQyHRHMUsd+UBYB2B1MGnunqlOCuTbOfEjZr6YyFUp6MBPq3+/xnsSmXWW5yuQnLyNDBWmY5jnvZE3rJQtH1qOLTr6uBjKKaFBHiia22131EGFQmzTSpD6U+hn6AR8Jbt6s+ayZclIJWriu5zVsdxqiY3EUHpn1Om9ZxuJZ0O9Wj8lm6JkUCVAZc/TJHongxd1J3x5WHP09Hl0gvQgklBVa1fzHk6v+zhcsuurWX8HmLIIVhUFbDgIjJEMYCu/WUvuuccT5nwr7epkst8y03BaE6Ow03Z6ZEsra3ge9ZEsXndsDk0DPjybbphERUiG70HOjRir8nVlF3C+KDlTezVdFFnf1yvgK+Bp8B+u4Xlp9JFuJuAdss4Hw8VTsp+v2QSYaTQjd6iQFXVQz8wyu8e2b4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5133.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(451199018)(33656002)(54906003)(6636002)(110136005)(316002)(83380400001)(71200400001)(7696005)(6506007)(186003)(966005)(26005)(9686003)(52536014)(8936002)(2906002)(38070700005)(478600001)(86362001)(53546011)(66946007)(66476007)(5660300002)(66556008)(76116006)(41300700001)(38100700002)(66446008)(55016003)(64756008)(122000001)(4326008)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rsxuc7DnTrzJ3uysQaWWnMoGXHSec+O8YK/ckVsSqrVhjqX2OTD88a89Xv5y?=
 =?us-ascii?Q?lOYxtnXd6HDmiT1w1/LBNznFhqRnlR8Uzf4uTLtn06+5CxZiyT8e2EgHycsp?=
 =?us-ascii?Q?CXectVYFYV77T78t5CcM0kJ+yR76ct+bLWdk/KYIB9zF/nx/jD5rUNwE121U?=
 =?us-ascii?Q?UOocuXtYnai2yXeqwLapF+cynI5VoI72JkF2SYFVXaY6RuixsBnA7lZyd6V+?=
 =?us-ascii?Q?yu7F3YH+7411MM/UBwibcPlmUEzoiSxKm755toFXk3+n6JaZsdyWHqyRcKDS?=
 =?us-ascii?Q?S+5ohuz4+iaMX7kMDrlf3NmBhoUE3tZ3vl0kqrLL654rCjYPGDQaZYxzFxdj?=
 =?us-ascii?Q?0RCicB/qKjxH5Ery/1evCcgELQV3Prjj+RfuexSehiotlGhDYCSipILF4LWQ?=
 =?us-ascii?Q?6FVxbH4X1wetLHpPpRX0Vjf5yPTtAOwP1bMCSl3Mw9h6KHHQ7h5aVN52ofVS?=
 =?us-ascii?Q?nWjalzDuZaDk5hd0oNnFpTdeiz6AJaHD8Y00hSL0pizDJZW7u1PBEeXHBZvJ?=
 =?us-ascii?Q?+m+TC1VfXBxWeZNpKfgGJgvTVnJSl9m1G+391pDmRHN6yZiAPm5WX9ymme5W?=
 =?us-ascii?Q?elVXMAVs6HcCc9WYlwG1p2x8BlyX/eFWyJOMULgfaWthllg/mmw2KPHHMCu3?=
 =?us-ascii?Q?yWObngYCSVQg8fXe+r5sm1s5XAZqVl346fT3MtgR0PkZki0/MFXx9vOlLdec?=
 =?us-ascii?Q?vM/mT78u/w5j2wJwAlS4XqkqI3usc7HmJXLipOcCI1qaQTG0c4TcZN36x21y?=
 =?us-ascii?Q?9bhjhxpgDfWzK3ljXAUwXgk0qFLdGQJnO0R6QQtvX/RG3FEPpNrJselc3tAU?=
 =?us-ascii?Q?4QuH5ZdmgK70IGR8kPxFDNG1RJm05eDf6GniTFK+ciKxrB6sR4y2tXkikiKM?=
 =?us-ascii?Q?yNWyzpzqzO4S88k1KgWjA3w0+ZeKR/5/WfMAl7OFwdRurJQvUJDvRqdbkWIh?=
 =?us-ascii?Q?V4B4C0YY63R8tTVKJ1YuTt3Zi9pVK0XnLxlNopuXx1vS6ZkS/WJdjjsnTe+O?=
 =?us-ascii?Q?MrsDhWCELPUGGWeIBfwooJ4LfARCeb9GY5XTdxHw5FryWmjWLDm2JyLpnlE6?=
 =?us-ascii?Q?YTxSQihOI2JZUqoQwVjhahYlwSlqB68JV9IpiYZtx+RJeBC2CozoTj8Nq4yU?=
 =?us-ascii?Q?Mt7Pp5JIeXlaXxgGWRbaRPrbd1b4AcdaPImuMoTtGE+hXlce873AglJoaF0s?=
 =?us-ascii?Q?S9p/1GWDXab+EQt9+FsKQG4ogcGkzsL2LkIQUl4nxt3vJ87C+QW0vaGOwmur?=
 =?us-ascii?Q?QRi7rkK+GMKZrWqNxdd6W7NBgB0sgst3nzDULCS89ksumZAbGVZKWNXVnn+c?=
 =?us-ascii?Q?RttbREfpsMaVxM6osUbZ4SYMAI/bEcHXFBtPHQ5hAoAEA2z8ffkr6PSJGDX4?=
 =?us-ascii?Q?rx1qLj+QhQ+86OyLukI38yoEvUKWowXBMnmLnvHweQ+z8umknvcLnkBVZSGC?=
 =?us-ascii?Q?chWBWwrHJYq/fzmx/RAQUzogrEmvwnkjnLvO8bKsRUoyiCK4YlOvKG0DWYt0?=
 =?us-ascii?Q?GzWltDL7UPIETCVUUV778PiFEIy9FKlM3SnGiRNKI2UtB8EmC7SXWHkX4ZhD?=
 =?us-ascii?Q?JBuuS7wPuQ4lgbhSvuoivrIgY0AxBQYJkzqAw9Pf?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c2239124-e820-4368-3a67-08db19f7b43e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2023 01:53:07.4183
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +nX+I6OC2AbHuyBw0tYpqwKv/96R2Fz+ooyBXkZ1VkzRyIqkeKvI6EvUA5HVH4atEbAoVHmDn+SPUIU9hn9n1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7379

[AMD Official Use Only - General]

Hi Charlie,

Would you please help to follow up and let me know if you need any support?=
 Thanks!

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
