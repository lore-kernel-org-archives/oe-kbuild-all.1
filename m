Received: from DM6FTOPR00CU001.outbound.protection.outlook.com (mail-centralusazon11020019.outbound.protection.outlook.com [52.101.61.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B4AC139
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 17:06:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GHfhuSVEQdoqdgcaKuzrl5hfLe9mmVjxCQr+9xzn+nZnmYwlzScbqn9GaAbvdVBinw5mv1gcPKPIbL67bKtj9mlVN5i0jvpl7gOsADoLaOhm2hoPMBdV7W74LCYn7j3QNUpxXPNWH7xLjCRaoNMGizkG5GJFKYBlimXumLrbFWsDaJK0GwZfry0edZ1oZJXi3iSdELNs9teddmPdhPw8Ap/x2yCtfQi5Laf8pSVk0DUKqZK1gMkRn0yTa0L0vWSfYijGwJmVdq3eF0moelojwyXS215+U6IrAPJioFqNvBhBJSuL0p7/9yKq8GORrqADeSs4PbMp7/gjIUILsQNy1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0UMo2g33/UFKSaYzPNL3iJfBLZInJhKTym05+JlKro=;
 b=lpcTYKGFaYWQ1ToWgVFdpv1M/YxwpMUH3qjSRoPXNjtWpR7uQsDnEp22kwpNZf2ia42o2qmhMWCyS3OBpxuVOpv0P7DuN3G79aiU2obBIVuyTy/Y/9c8QzrzLw4LLXZqvxAhFN0PPNrYOddquZXqqOve+sJRjpfzwDM5DC0fZT3ZSB1GJReCkCzwYd+oEyeU6xjAfgQN53yIXMKoXiXxAI70Fw04AIstNPPGHo7Nb9gZ27b8g75nUHQWm+ze4QakjXMQ+TfuPH1Rp2TahY7HL6tJ8ZT2DOxAAQc8IXxx+2AFRawUFqGpv8f4rsuqN5fYC6WqKRavHyUnVT7h0ekbuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0UMo2g33/UFKSaYzPNL3iJfBLZInJhKTym05+JlKro=;
 b=cToIqkqFJhPRTwSxqWexWHNazrvOaUwK1TuLv8JCwDdVqBN7BOpSIBDzyoDFdCIBeh7/vSoSTN3er2E7S6rjjUv6bEPujF0g/J/E+LWZukBAHGM/II7MHhqQjwiVjWAHKIDMovSQ65XUOURoOT/Wr0P3aVjBgSQQJu6DSjklCls=
Received: from SA1PR21MB1335.namprd21.prod.outlook.com (2603:10b6:806:1f2::11)
 by SN7PR21MB3939.namprd21.prod.outlook.com (2603:10b6:806:2ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.4; Wed, 23 Aug
 2023 17:06:48 +0000
Received: from SA1PR21MB1335.namprd21.prod.outlook.com
 ([fe80::b05:d4ac:60ff:3b3f]) by SA1PR21MB1335.namprd21.prod.outlook.com
 ([fe80::b05:d4ac:60ff:3b3f%5]) with mapi id 15.20.6745.005; Wed, 23 Aug 2023
 17:06:48 +0000
From: Dexuan Cui <decui@microsoft.com>
To: kernel test robot <lkp@intel.com>, Tianyu Lan <Tianyu.Lan@microsoft.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, Linux
 Memory Management List <linux-mm@kvack.org>, Wei Liu <wei.liu@kernel.org>,
	"Michael Kelley (LINUX)" <mikelley@microsoft.com>
Subject: RE: [linux-next:master 11576/12208]
 arch/x86/kernel/cpu/mshyperv.c:407: undefined reference to
 `isolation_type_en_snp'
Thread-Topic: [linux-next:master 11576/12208]
 arch/x86/kernel/cpu/mshyperv.c:407: undefined reference to
 `isolation_type_en_snp'
Thread-Index: AQHZ1bFxMcPkHcJlSUK5b48zJH6pU6/4G+mg
Date: Wed, 23 Aug 2023 17:06:48 +0000
Message-ID:
 <SA1PR21MB1335B4EC7F7D51BB12F71C67BF1CA@SA1PR21MB1335.namprd21.prod.outlook.com>
References: <202308231805.RyYOycAU-lkp@intel.com>
In-Reply-To: <202308231805.RyYOycAU-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=aef8cc26-b34e-4e51-80ef-66b2985f0c77;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2023-08-23T17:02:50Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR21MB1335:EE_|SN7PR21MB3939:EE_
x-ms-office365-filtering-correlation-id: 6fff7e14-fd60-458c-fff0-08dba3fb5695
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 zGqNtyltEkR3J9qv3exWSHajGToIExsf3O8Mfxi97v4LlIkqAlv8dKUEk+vK6WNSd7FNw0eRy/NKQ3QwWKCsW+zXkkcx1nyQArF9P1Ra5rxp6utgmAywMfcQfI4SMpGQhJetfy5O3bdFh58hTV0kKtt3Ja6KWBOqPLhnw0BTgbkixM5GMFA5P3F3xCvppPDlUDA4sWqdVRJa3UXjSfls5C9XKWPlApMUBlYbPbCwL5FeXZtTl9xUFRX+ZwY7inGBPy0Dql+0yVjM29zjGP6pfnrt5HV2uhZK3i3QXW08TpRldnqd3Yhw6fDQYkFgMA9vLtTf91Jb5f52ezoXEbZBT92TwgweQj5wcXDqA/wB1T8RcfbzfAHdAyhE2W0kQxLAhVAjO+OlcqX3q/4imauy0bRcotTevy4HVa81/bzNvAYSmcE/4DA2zLPD/MMIu7ZX0ZdFuPCCjINtn2HJxIy0402IPPqVXKPNccyMo+B+MnOHQHOEDJZsMpm2Wy3NVM6/GgrJ/O1ARFkV6CnWft8SnDW6lM4KfyTU1Wl4PsDOHHnYgfW8UIMvwKxYlN1PAz9GYqOn3FGePw8O2q3PA9RVMS7IlMhhK2dBktG2rZCxrcOi+s/iIIcctE1HgLzXhQK+7ioZuFfSSoYVUPkF8Fv3NRXwqgHNQ4wzPX10+jkFd34zj++X4kdO+pRA7U9269Zq3XOzoSTwFBIQueSipzn4dQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR21MB1335.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(366004)(39860400002)(396003)(186009)(1800799009)(451199024)(966005)(478600001)(10290500003)(71200400001)(110136005)(6506007)(7696005)(9686003)(107886003)(76116006)(8990500004)(53546011)(2906002)(66556008)(8936002)(33656002)(66946007)(64756008)(52536014)(66476007)(316002)(4744005)(41300700001)(6636002)(8676002)(5660300002)(54906003)(4326008)(66446008)(86362001)(82960400001)(38100700002)(38070700005)(83380400001)(122000001)(82950400001)(12101799020)(55016003)(81973001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Dt3hj6eVam1DluT0RkDcDbnl+Yy6vxw6oovnWMCt3Og3CSJrs7uIYbwZDx/E?=
 =?us-ascii?Q?fthbiXuPZIz6yHuiyizaCd7LPk+dWTcOZeVsPi++RJ2nWCY3JptrecdLq2XZ?=
 =?us-ascii?Q?zerF/SbsiBuLE++NGOJZPVAWZOUx6m4JWK9uunLMBc/Vs0V5209O14QY76HJ?=
 =?us-ascii?Q?AQZu8vFOsibxyZTfeAou/YU0yNSkS1SUvnXD+YDbq9ENUu1O/Ge4hhBeX+84?=
 =?us-ascii?Q?ypkwk4rzWqGBbHpR+Xt0x7KOQOy1XNo+8DiF8N9azXd9V/mOOSrfnBkgxFX7?=
 =?us-ascii?Q?vehoeLnxVrGTUn5VHUEO6mKwZj26i7qw7jbtOa4KTfEuEXoFsE88AbDrmiZp?=
 =?us-ascii?Q?4IM5Y3eapyT8dLAOm7tm1NTfFU3vijSYktYMD+6Fub1/VdNjpFmVtx3M64og?=
 =?us-ascii?Q?5O/F9Q5IONf1cPUJHApz7hQqaZQAPq8UuRIh92goaFkByXB596Qmkt9Q4Z9d?=
 =?us-ascii?Q?VQpxZXG3bnByw9bVkAYw/66pR3o5vmRULggxX4WAk2tEyGCEwu1oSnXzxNTW?=
 =?us-ascii?Q?XezWBUKgag4nYPcdUaFleucw0q/mnPKflx8GoYhvsapJz+tfMENAUWlm622v?=
 =?us-ascii?Q?BzldC9/+m5Qf0+6SpaOfKB1w2bP0l0aPBKr9fFgk9+aRQU7+UFDk70l2CBo4?=
 =?us-ascii?Q?Gao+Eme0imuSMIgJWbH6hOkuEAGkgdlS9/0GJiGLiezHJfDqQ7QaFm19e7XV?=
 =?us-ascii?Q?9qwxUnWWTrsATZmk7TocIp+K8tueNDmpR89L5XIN7As/DraTtLOzxgjU3zyO?=
 =?us-ascii?Q?hx+FTpT0qS0k6iAXiIu5OmY6G4HVmXmZ7qqQdtnx8wPF6T6hwlhOSVxQSguU?=
 =?us-ascii?Q?x5Sp/REQLuwnf1cUw1cBa2XMYdq6ZaooCOwN1AoTuRgVYmgtfMbKUzVl1lMk?=
 =?us-ascii?Q?lP+LXLtmGHvqX+D8xfb0baShxTNh3/CqA7a7e13HZm8Y7LvNdN5OpixvynFW?=
 =?us-ascii?Q?wgP08FMDcnRPh0xiQsW2+vbjItAooAyEtlp+nxvVrf6cYI7BxRHR3j11TXfz?=
 =?us-ascii?Q?bskQnUt5+33JEYxwu/kFFe24w9UsrBuD9q3PsXfaLlIQLNOmradY38FDcICQ?=
 =?us-ascii?Q?HVVfiJDni8cmGEaU5AOQT9mMJju3KfTz+Gr+EUG8oON+gwPxfX6YpQRYm0U5?=
 =?us-ascii?Q?CNzX+4oEXLytD34owl20IJXKw6vqKR4jOz9twctzq3m3YOx/5YTflKXIueWs?=
 =?us-ascii?Q?Mol0Wis8B2iaZRs4SQhk+LAHNyqxWFy/H7AdLKD7ZtH3ON7rdKGTgC3L6CGr?=
 =?us-ascii?Q?/YdDnQ9gLv+zZJTkyEp9BDWNouDYm/7UEMaMgp6ZtkNijWWuyo1MqEuSXjeW?=
 =?us-ascii?Q?1pWQCqIId37Dty3ASnXsD2so0yMNWwe0qFibl6eU9hK8DZI534T3+2Fnuv7k?=
 =?us-ascii?Q?rhxmk6H88jW7B3+dzb/nwz2oiMFJHu5W7wjA8BrRoaUT6CxRqvNVRtPKggg6?=
 =?us-ascii?Q?3hJ5SmpAkmJkxfSYAgLbuKcpygB3tD2CUckUf7bjq/iDWS0P1iTzso7FTvqY?=
 =?us-ascii?Q?mvAEuiahLejRs+oDHHJoGHndjaSDbenHxvDHw1Pxm2OIYQCKxjOLibXfJFc2?=
 =?us-ascii?Q?005MpLDrrSENntswaLHL1zzWaHZVxY35Fb2HSNgrOKhvKREemzy/M/h8vBro?=
 =?us-ascii?Q?u96u8H3osz+WhUwfyPQLSX8g/HO06bsXQ1JzH0XfFsop?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR21MB1335.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fff7e14-fd60-458c-fff0-08dba3fb5695
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2023 17:06:48.7695
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GUL2gEh2vTofa6PrngXGjxYIq71euYsPbiPbMK33T8gO7fg3SDR5mrBTaC6qNGdeiiMg/9YbAxPx8VTiiG1woA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR21MB3939

> From: kernel test robot <lkp@intel.com>
> Sent: Wednesday, August 23, 2023 4:03 AM
> To: Tianyu Lan <Tianyu.Lan@microsoft.com>
> Cc: oe-kbuild-all@lists.linux.dev; Linux Memory Management List <linux-
> mm@kvack.org>; Wei Liu <wei.liu@kernel.org>; Dexuan Cui
> <decui@microsoft.com>; Michael Kelley (LINUX) <mikelley@microsoft.com>
> Subject: [linux-next:master 11576/12208]
> arch/x86/kernel/cpu/mshyperv.c:407: undefined reference to
> `isolation_type_en_snp'

The failure happens because we have CONFIG_HYPERVISOR_GUEST=3Dy, but
CONFIG_HYPERV is not set. This has been fixed in the hyperv-next branch:

https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git/log/?h=3Dh=
yperv-next
https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git/commit/?h=
=3Dhyperv-next&id=3D86e619c922e616d8780833562a14a5bda329f0c3

The fix is not in linux-next's master branch (currently it's next-20230823)=
 yet.
I believe tomorrow's linux-next would build successfully.

Thanks,
Dexuan
