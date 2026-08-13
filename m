Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013011.outbound.protection.outlook.com [40.93.201.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BB64A33FA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 21:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786655845; cv=fail; b=PJ9ls6dp+O1EKV4kj2d4yVdUBBjkXFnQJZkTXwjDb1Dp4lTCjo2xKo7bF+5KBUOYutApM49KXpC348xHGF2vAQRlaQEX8ct/8NKEMycUpfaOmK6seP4mkT2kFbWORutR1xHGzDCuFqqAW86bCTzv18bl74jFN/EFdijSzqhff44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786655845; c=relaxed/simple;
	bh=253FhoC8MFWnnAfg+aOFxoLEI818BMuiDymKLCuZSDA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hr/N0hjMycJ3Ku/AesV4rH3XIFd8FFBa+pVv43yUKhsZLm6Mu6bCPcempJTchaLgqWWqYvV/U8+yfK75F40WgXbyAKxXT3w0e/mCbvXnqHem8vWVPYvNKX3PJR0c6OmnrpsIvjPiQKYwmftYcSDR8+dm85xI4bLi5AxNU3/tb94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=obJjH05r; arc=fail smtp.client-ip=40.93.201.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="obJjH05r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gVLjNnmXc/NuUEAe4REr+0c8HicH82gQNgWak2CBBvvZhokd3Jry5CZkfbw9bk8W76j50GOiJHvEVQX/A7yUkOhGQJfJZsbBxfs/sWZDRrVYSoOn90nsvwR3FJCfvKojoemaLb+OWRRRMxtO7ZoTlcvTRjpaoZnl8zHVoguq9oQfRpz8xbFmH9IaQMiIqV6vQZzijeHf6VTZFGkSG0iQ7Vfj5rCekxJMCkGY59/1SDasOhG4UztKhyvTpsnAHKsdz4H9Ai4dcke600JPy0Qc1disen5BC24YAIpzHnyg1p1BwTX90F7tcHqps69jlaeOadcxxG/dkhLA9+0VP3duaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=weUivaKcHY+hGxuZCyBwxFpV3HlOZmaZKr5WL1snyZc=;
 b=rWlQp5rR7VOznUrfm6SMHwgKzPKEeKbmi3ysr2fFOcNtS5KHoy4JjpyXxwf/KypIJfFFSXvKmHjcNAgPkTwacXS0Ud9CkdziS9zfQTk9trAXcugOhgoOJ6l+fG2S4ETars5f9PqgqG3pwAyN6pjGJ6Ymggz5bQLmhFN1yp94Jumw+c7OiDvxIQr+9k6T2mTGxrIPo/n+hdnqD1cBhcvTBJpP3j25s75BIlPichVKyZdPBBas4siC8wlzb89vElb7+dV6y9vTq/mQzJ3E1qPIuTejiWhOSRXWpIONPsZRcG/7JlsXibhlBLRxPspbefHAHz230zUjaSFAcelSqbHtgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=weUivaKcHY+hGxuZCyBwxFpV3HlOZmaZKr5WL1snyZc=;
 b=obJjH05rcGeG5r8F2dh81uiQo4XiddRE6QUHvQ38PyVnLqgGftKyH+7QWHNFaLUvyHxpQ7w/s4mLaX4rNTD4QMuT5LcyeJavf4q4oIeK1LrMt9VaVsFCeL2o24J9RSvh59wHrV+hDsZwF35WnsPOlBkKkI4iQWh7FnmRIST8Cck=
Received: from IA1PR12MB8407.namprd12.prod.outlook.com (2603:10b6:208:3d9::17)
 by SN7PR12MB7227.namprd12.prod.outlook.com (2603:10b6:806:2aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 21:16:58 +0000
Received: from IA1PR12MB8407.namprd12.prod.outlook.com
 ([fe80::f019:2dab:3201:df90]) by IA1PR12MB8407.namprd12.prod.outlook.com
 ([fe80::f019:2dab:3201:df90%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 21:16:58 +0000
From: "LIPSKI, IVAN" <IVAN.LIPSKI@amd.com>
To: kernel test robot <lkp@intel.com>, "Pillai, Aurabindo"
	<Aurabindo.Pillai@amd.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Li, Roman" <Roman.Li@amd.com>
Subject: RE: [agd5f:drm-next-7.3 244/308]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn5_funcs_mode_programming.c:1131:74:
 sparse: sparse: Using plain integer as NULL pointer
Thread-Topic: [agd5f:drm-next-7.3 244/308]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn5_funcs_mode_programming.c:1131:74:
 sparse: sparse: Using plain integer as NULL pointer
Thread-Index: AQHdKCfG1H4g6aIbsUSINtHpO/jHHLacgR3Q
Date: Thu, 13 Aug 2026 21:16:58 +0000
Message-ID:
 <IA1PR12MB8407097A082C400ABB2580B3E7DB2@IA1PR12MB8407.namprd12.prod.outlook.com>
References: <202608100151.0auRZyTk-lkp@intel.com>
In-Reply-To: <202608100151.0auRZyTk-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-08-13T21:14:23.0000000Z;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General
 v26;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB8407:EE_|SN7PR12MB7227:EE_
x-ms-office365-filtering-correlation-id: 4c4dd91f-cd82-4b7c-09fb-08def980357f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|10067099003|11063799006|5023799004|3023799007|18002099003|22082099003|6133799003|38070700021;
x-microsoft-antispam-message-info:
 5e14kdQY2gixAfak4B2lJPBb5ZeZGpPR4BD91RKEVyjiXGN+DCrS+uBxQEy5QUiKkumL5esR2HLEuhsKjAWFye05M5UY5+Fn7+fItz/bB8WRum5x6Ld4IVbS4Ol+TYGmfbw80JOfsRCPAFuxS282WdtGCWXG1FnGAHGJGPG3p+MJTyf52srondhIL7/JZNNX+m1eIsVdZH/xpTRH27/RwF9BXANP9+WX+KJYTOS1lsF29dic4ZkMIJmbxbbgeeg1rvPbUGTui9HoPvWgEJyJnHMAgPncHpXX0vXwshMFwKDNLrbWvCPgh+CKWCBza5dARDDz0r01CK/X06FnR6lB3GiN0ZMtuSfUPslg4D5KFPV9uZQU4llwpaN7jLmevJBUHhcJkpCYvUqnAZI57PlsTBmeHuDh4Ol6evCoCunXJlVm5V8bEvWZRBaPCoeu/g98td2pIh/1JalPbN14BK5PvEHIfItE/In6NUvR3q1rVTr/OoOUZtwQOZ+K0RTjHHOF9/PjseMl5/yt5SA7XiX8LCcReCdVC3Vd+57YX1tTQtZ8YZOV8XQt29KQSxJ73QoezAsGvqj9YuwfdeAmM0BKZVJfWsKS9QgsQ9q5yfxovWoTSRvnjy0yRbisw/I6mJUbOLsGreMn1DVPshTaocm45bpDMRDQdrqFVq1ipOaJnYc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(10067099003)(11063799006)(5023799004)(3023799007)(18002099003)(22082099003)(6133799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?UaTs9Sx5vhw3InbRro9+x/8k7ATGjK3hN4QwiJsp2ew0VCKH7viVFKDSMEcw?=
 =?us-ascii?Q?dDreCr46FWBvJgknQX25rk41e0DTjAZqDo5lwG6RbuXKRuWeZvR3rkEP2Mw7?=
 =?us-ascii?Q?dBDdWi8pQ8RRo8rGRuVo3uzYffs8zLsHUi05OZkMhX02++lfoH1pjmcZDkRy?=
 =?us-ascii?Q?gMo3KCHnFrtYsAVsu4l+RGK0rMg2QfvxK5h0T8GcPk3r5FH72vepgZ0ulYWT?=
 =?us-ascii?Q?qMZ9LyLZFFFRXDQTobL2NivpFRGNhQxW8niS82D/CPYIU7iq/RNEQg9AJF4e?=
 =?us-ascii?Q?D8IZCP0y2KJU0q2GVauwll63N4UW1jFM9vaae2bgLCax1ND4FIWVqnH5pdBt?=
 =?us-ascii?Q?lUeMK3ZhtocyqbPY1Acq3AsPFHT01WYQ+z85TPvLI0ST+TQMldtgcseVFcgI?=
 =?us-ascii?Q?sbgBb4hJZTW6mEQSOMoV3p8cBiBfEawJ69L6NwcU87EzRo+33f21uPucKFEo?=
 =?us-ascii?Q?+tmIPaMQxzEekqS+KcIZ96kEjqCoLxsgaDGyxMkwxdfxDwCbHLCmm9CdUsf/?=
 =?us-ascii?Q?Wpr4hoEe0t+1JBLsYyhKIbz72TKs1zaFI0dDymaaoHlubPsDaHbz7o/LL5n/?=
 =?us-ascii?Q?xPt1Az6V8daoiAER5bn9llT2HSpPMhnUCZEsaY1i4XdN/uCJPOxyuXglqvYI?=
 =?us-ascii?Q?c5JjVb9kUeFLTO0id7K7YHIq+JphsqD0GCcw1pRHaCLwSrbaX6ma5aEnv8AD?=
 =?us-ascii?Q?QgZKPWl+OIh/fEA8yurH7+g06qQmORFEs28fIi+bgc7OVB9unJ7Zj6XBwRYo?=
 =?us-ascii?Q?xgIyeu7r5zHMcf69B3ssy5rnln7z84HlwPSlh1BmzcE/k0wZdYe7dyW1IvMi?=
 =?us-ascii?Q?VnCYHVUKaBBdkSEBTpWuud4ubzJyDHbWGITr7/17ef7EeOuyux/WXbNWs2dd?=
 =?us-ascii?Q?TrG3As3vChLKw1Ow6NvNeX5c5OWEnvln5xxJloEhFT8lZBpGAnRZSdDwSJ4s?=
 =?us-ascii?Q?4F2NvpoeDDFKpgh9krBXkj0GvJuFfFHETb+ZJwtQU2k0hLdz3SgVCAnwgvIu?=
 =?us-ascii?Q?hkDDQxDvYCPqfHglrJ/SCSBeXcWbxivk0VJNtV/OALsj7DHQGwxaD2QM/k40?=
 =?us-ascii?Q?w/Cy35+tBdb6wwu0rJklTQ+lAcCnEqhaSwSqXqSUbRyaikzovAhRidgGG9kg?=
 =?us-ascii?Q?TvdA1LDOvczJFi577y+xWQjpTXJz3VgtcEMyGr+rH78VsPglhycd/wucQiHj?=
 =?us-ascii?Q?8eqpKYPUqOwqEUa3nQ0lnIsvk5gqtQepWPHdeDW/KhKY1NYuPIYTdFEbjE6h?=
 =?us-ascii?Q?noMVoUa1psaQeW/+onVgKqMzwA8jwcgQAnBRGkMGQvptqmL6PzclqdDDjN+6?=
 =?us-ascii?Q?dSz/su4rXUJbAT8bXYX6I/PELIq382euwDp6KrekJiVCkNNVISCQGFqibD89?=
 =?us-ascii?Q?bRF8T8u2lT9bY89E9K2BdjCXbBuyBVS1Y/6Zu6WMeeXxQ5bAz8hT1R5ncunq?=
 =?us-ascii?Q?C6CoWfhfVzsL5RtmX1MDIjWJuIpIZCrqAXo9yXlCq+TfqpXE+zxw0t+I6r32?=
 =?us-ascii?Q?EVG1M3iYcRTMgV2+TSutZIO7qlvfwVE/z372qOsQYFy8jw3WqX5rCOJNWIFb?=
 =?us-ascii?Q?wAjI9yztNpit0hfYbPPTpaqULZJdhU5qOberNlosV07AVEdhT8jBq86lqP3w?=
 =?us-ascii?Q?GB41AEcMtVBoq0/M+cslOTS88iWxgscovYhfxACGgkLII6m+QbNyUrwvjXad?=
 =?us-ascii?Q?Uk4dZgMJF0T2RIIVK0/d7G361kwlKR/z/dek8iiM5uFo6FT4?=
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
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c4dd91f-cd82-4b7c-09fb-08def980357f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2026 21:16:58.1515
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ciwcZ3Y7ImYQCwF0hxifOsbOZxdqePkGJrR7Zz7x0fqTwED6x1lFb2ZylbRjjMwObcq84DksvCMgp8lpYTcbiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7227

AMD General

Hi,

Regarding the issue below,

   WARNING: invalid argument to '-march': '_zacas_zabha'
>> drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn60.c:586:9: spars=
e: sparse: static assertion failed: "DMUB command size mismatch"
   drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn60.c:662:9: spars=
e: sparse: static assertion failed: "DMUB command size mismatch"

I think it is a false positive from sparse, not a real size mismatch.

sparse (v0.6.5-rc1, as in your report) doesn't honor #pragma pack(push, 1),=
 which dmub_cmd.h relies on.

The only affected struct isdmub_cmd_fw_assisted_mclk_switch_pipe_data_v2: i=
ts packed size is 28 bytes
(27-byte pipe_config union + 1-byte mode), but sparse pads it to 32.

Via pipe_data[2] this grows union dmub_rb_cmd from 64 to 72, tripping stati=
c_assert(sizeof(*cmd) =3D=3D 64) in dmub_dcn60.c (and dmub_dcn42/dcn401).

GCC computes 64 and builds cleanly (both gcc-13 and your gcc-16.1.0), so th=
e assert is correct.

Thanks,
Ivan Lipski


-----Original Message-----
From: kernel test robot <lkp@intel.com>
Sent: Sunday, August 9, 2026 1:52 PM
To: Pillai, Aurabindo <Aurabindo.Pillai@amd.com>
Cc: oe-kbuild-all@lists.linux.dev; Deucher, Alexander <Alexander.Deucher@am=
d.com>; Li, Roman <Roman.Li@amd.com>; LIPSKI, IVAN <IVAN.LIPSKI@amd.com>
Subject: [agd5f:drm-next-7.3 244/308] drivers/gpu/drm/amd/amdgpu/../display=
/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn5_funcs_mode_programming.c:1131=
:74: sparse: sparse: Using plain integer as NULL pointer

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-7.3
head:   daaeec235e46b45a0dbd4facfb275cc43022028d
commit: 992694ad28584188725751f695a85661e8e3797a [244/308] drm/amd/display:=
 Enable DCN6 sources compilation
config: riscv-randconfig-r111-20260807 (https://download.01.org/0day-ci/arc=
hive/20260810/202608100151.0auRZyTk-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260810/202608100151.0auRZyTk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608100151.0auRZyTk-lkp@i=
ntel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
   WARNING: invalid argument to '-march': '_zacas_zabha'
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2=
_core_dcn5_funcs_mode_programming.c: note: in included file (through driver=
s/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/inc/dml2_internal_share=
d_types.h, ...):
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/inc/bounding_boxes=
/utm_qos_model_dchub_v3.h:53:45: sparse: sparse: no newline at end of file
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2=
_core_dcn5_funcs_mode_programming.c:1131:74: sparse: sparse: Using plain in=
teger as NULL pointer
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2=
_core_dcn5_funcs_mode_programming.c:1132:70: sparse: sparse: Using plain in=
teger as NULL pointer
--
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn60.c:586:9: spars=
e: sparse: static assertion failed: "DMUB command size mismatch"
   drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn60.c:662:9: spars=
e: sparse: static assertion failed: "DMUB command size mismatch"
--
   WARNING: invalid argument to '-march': '_zacas_zabha'
   WARNING: invalid argument to '-march': '_zacas_zabha'
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_pmo/dml2_=
pmo_dcn6_stage_optimizers.c: note: in included file (through drivers/gpu/dr=
m/amd/amdgpu/../display/dc/dml2_0/dml21/src/inc/dml2_internal_shared_types.=
h, ...):
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/inc/bounding_boxes=
/utm_qos_model_dchub_v3.h:53:45: sparse: sparse: no newline at end of file
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_pmo/dml2_=
pmo_dcn6_stage_optimizers.c:1417:87: sparse: sparse: Using plain integer as=
 NULL pointer
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_pmo/dml2_=
pmo_dcn6_stage_optimizers.c:1417:90: sparse: sparse: Using plain integer as=
 NULL pointer

vim +1131 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_co=
re/dml2_core_dcn5_funcs_mode_programming.c

7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    10
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    11  static bool dcn5_mode_pr=
ogramming(struct dml2_core_calcs_mode_programming_ex *in_out_params)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    12  {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    13       const struct dml2_d=
isplay_cfg *display_cfg =3D in_out_params->in_display_cfg;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    14       const struct dml2_u=
tm_soc_bb *utm_soc_bb =3D in_out_params->utm_soc_bb;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    15       const struct dml2_s=
op_table *sop_table =3D &in_out_params->utm_soc_bb->sop_table;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    16       const struct core_d=
isplay_cfg_support_info *cfg_support_info =3D in_out_params->cfg_support_in=
fo;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    17       struct dml2_core_in=
ternal_display_mode_lib *mode_lib =3D in_out_params->mode_lib;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    18       const struct dml2_d=
isplay_cfg_programming *programming =3D in_out_params->programming;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    19       struct dml2_core_ca=
lcs_mode_programming_locals *s =3D &mode_lib->scratch.dml_core_mode_program=
ming_locals;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    20       struct dml2_core_ca=
lcs_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport_params *CalculateWa=
termarks_params =3D &mode_lib->scratch.CalculateWatermarksMALLUseAndDRAMSpe=
edChangeSupport_params;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    21       struct dml2_core_ca=
lcs_CalculateVMRowAndSwath_params *CalculateVMRowAndSwath_params =3D &mode_=
lib->scratch.CalculateVMRowAndSwath_params;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    22       struct dml2_core_ca=
lcs_CalculateSwathAndDETConfiguration_params *CalculateSwathAndDETConfigura=
tion_params =3D &mode_lib->scratch.CalculateSwathAndDETConfiguration_params=
;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    23       struct dml2_core_ca=
lcs_CalculateStutterEfficiency_params *CalculateStutterEfficiency_params =
=3D &mode_lib->scratch.CalculateStutterEfficiency_params;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    24       struct dml2_core_ca=
lcs_CalculatePrefetchSchedule_params *CalculatePrefetchSchedule_params =3D =
&mode_lib->scratch.CalculatePrefetchSchedule_params;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    25       struct dml2_core_ca=
lcs_calculate_mcache_setting_params *calculate_mcache_setting_params =3D &m=
ode_lib->scratch.calculate_mcache_setting_params;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    26       struct dml2_core_ca=
lcs_calculate_tdlut_setting_params *calculate_tdlut_setting_params =3D &mod=
e_lib->scratch.calculate_tdlut_setting_params;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    27       struct dml2_core_sh=
ared_CalculateMetaAndPTETimes_params *CalculateMetaAndPTETimes_params =3D &=
mode_lib->scratch.CalculateMetaAndPTETimes_params;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    28       struct dml2_core_ca=
lcs_calculate_peak_bandwidth_required_params *calculate_peak_bandwidth_para=
ms =3D &mode_lib->scratch.calculate_peak_bandwidth_params;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    29       struct dml2_core_ca=
lcs_calculate_bytes_to_fetch_required_to_hide_latency_params *calculate_byt=
es_to_fetch_required_to_hide_latency_params =3D &mode_lib->scratch.calculat=
e_bytes_to_fetch_required_to_hide_latency_params;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    30
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    31       unsigned int k, j;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    32       bool must_support_i=
flip;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    33       const long min_retu=
rn_uclk_cycles =3D 83;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    34       const long min_retu=
rn_fclk_cycles =3D 75;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    35       struct dml2_soc_ope=
rating_point max_sop;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    36       struct dml2_soc_ope=
rating_point min_sop;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    37       double min_return_l=
atency_in_DCFCLK_cycles =3D 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    38
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    39       DML_LOG_VERBOSE("DM=
L::%s: --- START --- \n", __func__);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    40
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    41       s->num_active_plane=
s =3D display_cfg->num_planes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    42       dml2_core_utils_get=
_stream_output_bpp(s->OutputBpp, display_cfg);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    43
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    44       mode_lib->mp.num_ac=
tive_pipes =3D dml2_core_util_get_num_active_pipes(display_cfg->num_planes,=
 cfg_support_info);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    45       dml2_core_utils_pip=
e_plane_mapping(cfg_support_info, mode_lib->mp.pipe_plane);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    46
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    47       mode_lib->mp.Global=
DPPCLK =3D programming->min_clocks.dcn4x.dpprefclk_khz / 1000.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    48       sop_table->get_max_=
sop(sop_table, &max_sop);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    49       sop_table->get_min_=
sop(sop_table, &min_sop);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    50       s->SOCCLK =3D min_s=
op.socclk_khz / 1000.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    51
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    52       for (k =3D 0; k < s=
->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    53               unsigned in=
t stream_index =3D display_cfg->plane_descriptors[k].stream_index;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    54               DML_ASSERT(=
cfg_support_info->stream_support_info[stream_index].odms_used <=3D 4);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    55               DML_ASSERT(=
cfg_support_info->stream_support_info[stream_index].num_odm_output_segments=
 =3D=3D 4 ||
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    56                          =
             cfg_support_info->stream_support_info[stream_index].num_odm_ou=
tput_segments =3D=3D 2 ||
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    57                          =
             cfg_support_info->stream_support_info[stream_index].num_odm_ou=
tput_segments =3D=3D 1);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    58
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    59               if (cfg_sup=
port_info->stream_support_info[stream_index].odms_used > 1)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    60                       DML=
_ASSERT(cfg_support_info->stream_support_info[stream_index].num_odm_output_=
segments =3D=3D 1);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    61
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    62               switch (cfg=
_support_info->stream_support_info[stream_index].odms_used) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    63               case (4):
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    64                       mod=
e_lib->mp.ODMMode[k] =3D dml2_odm_mode_combine_4to1;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    65                       bre=
ak;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    66               case (3):
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    67                       mod=
e_lib->mp.ODMMode[k] =3D dml2_odm_mode_combine_3to1;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    68                       bre=
ak;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    69               case (2):
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    70                       mod=
e_lib->mp.ODMMode[k] =3D dml2_odm_mode_combine_2to1;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    71                       bre=
ak;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    72               default:
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    73                       if =
(cfg_support_info->stream_support_info[stream_index].num_odm_output_segment=
s =3D=3D 4)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    74                          =
     mode_lib->mp.ODMMode[k] =3D dml2_odm_mode_mso_1to4;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    75                       els=
e if (cfg_support_info->stream_support_info[stream_index].num_odm_output_se=
gments =3D=3D 2)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    76                          =
     mode_lib->mp.ODMMode[k] =3D dml2_odm_mode_mso_1to2;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    77                       els=
e
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    78                          =
     mode_lib->mp.ODMMode[k] =3D dml2_odm_mode_bypass;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    79                       bre=
ak;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    80               }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    81       }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    82
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    83       for (k =3D 0; k < s=
->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    84               mode_lib->m=
p.NoOfDPP[k] =3D cfg_support_info->plane_support_info[k].dpps_used;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    85               mode_lib->m=
p.Dppclk[k] =3D programming->plane_programming[k].min_clocks.dcn4x.dppclk_k=
hz / 1000.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    86               DML_ASSERT(=
mode_lib->mp.Dppclk[k] > 0);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    87       }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    88
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    89       for (k =3D 0; k < s=
->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    90               unsigned in=
t stream_index =3D display_cfg->plane_descriptors[k].stream_index;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    91               mode_lib->m=
p.DSCCLK[k] =3D programming->stream_programming[stream_index].min_clocks.dc=
n4x.dscclk_khz / 1000.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    92               DML_LOG_VER=
BOSE("DML::%s: k=3D%d stream_index=3D%d, mode_lib->mp.DSCCLK =3D %f\n", __f=
unc__, k, stream_index, mode_lib->mp.DSCCLK[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    93       }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    94
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    95       mode_lib->mp.Dispcl=
k =3D programming->min_clocks.dcn4x.dispclk_khz / 1000.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    96       mode_lib->mp.DCFCLK=
DeepSleep =3D programming->min_clocks.dcn4x.deepsleep_dcfclk_khz / 1000.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    97
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    98       memcpy(mode_lib->mp=
.uclk_pstate_switch_modes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22    99                       in_=
out_params->uclk_params->pstate_switch_modes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   100                       siz=
eof(in_out_params->uclk_params->pstate_switch_modes));
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   101
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   102       DML_ASSERT(mode_lib=
->mp.Dcfclk > 0);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   103       DML_ASSERT(mode_lib=
->mp.FabricClock > 0);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   104       DML_ASSERT(mode_lib=
->mp.uclk_freq_mhz > 0);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   105       DML_ASSERT(mode_lib=
->mp.GlobalDPPCLK > 0);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   106       DML_ASSERT(mode_lib=
->mp.Dispclk > 0);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   107       DML_ASSERT(mode_lib=
->mp.DCFCLKDeepSleep > 0);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   108       DML_ASSERT(s->SOCCL=
K > 0);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   109
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   110       DML_LOG_VERBOSE("DM=
L::%s: num_active_planes =3D %u\n", __func__, s->num_active_planes);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   111       DML_LOG_VERBOSE("DM=
L::%s: num_active_pipes =3D %u\n", __func__, mode_lib->mp.num_active_pipes)=
;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   112       DML_LOG_VERBOSE("DM=
L::%s: Dcfclk =3D %f\n", __func__, mode_lib->mp.Dcfclk);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   113       DML_LOG_VERBOSE("DM=
L::%s: FabricClock =3D %f\n", __func__, mode_lib->mp.FabricClock);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   114       DML_LOG_VERBOSE("DM=
L::%s: uclk_freq_mhz =3D %f\n", __func__, mode_lib->mp.uclk_freq_mhz);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   115       DML_LOG_VERBOSE("DM=
L::%s: Dispclk =3D %f\n", __func__, mode_lib->mp.Dispclk);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   116       for (k =3D 0; k < s=
->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   117               DML_LOG_VER=
BOSE("DML::%s: Dppclk[%0d] =3D %f\n", __func__, k, mode_lib->mp.Dppclk[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   118       }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   119       DML_LOG_VERBOSE("DM=
L::%s: GlobalDPPCLK =3D %f\n", __func__, mode_lib->mp.GlobalDPPCLK);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   120       DML_LOG_VERBOSE("DM=
L::%s: DCFCLKDeepSleep =3D %f\n", __func__, mode_lib->mp.DCFCLKDeepSleep);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   121       DML_LOG_VERBOSE("DM=
L::%s: SOCCLK =3D %f\n", __func__, s->SOCCLK);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   122       for (k =3D 0; k < m=
ode_lib->mp.num_active_pipes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   123               DML_LOG_VER=
BOSE("DML::%s: pipe=3D%d is in plane=3D%d\n", __func__, k, mode_lib->mp.pip=
e_plane[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   124               DML_LOG_VER=
BOSE("DML::%s: Per-plane DPPPerSurface[%0d] =3D %d\n", __func__, k, mode_li=
b->mp.NoOfDPP[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   125       }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   126
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   127       for (k =3D 0; k < s=
->num_active_planes; k++)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   128               DML_LOG_VER=
BOSE("DML::%s: plane_%d: reserved_vblank_time_ns =3D %lu\n", __func__, k, d=
isplay_cfg->plane_descriptors[k].overrides.reserved_vblank_time_ns);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   129
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   130       dcn5_calculate_max_=
det_and_min_compressed_buffer_size(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   131               mode_lib->i=
p.config_return_buffer_size_in_kbytes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   132               mode_lib->i=
p.config_return_buffer_segment_size_in_kbytes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   133               mode_lib->i=
p.rob_buffer_size_kbytes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   134               mode_lib->i=
p.max_num_dpp,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   135               display_cfg=
->overrides.hw.force_nom_det_size_kbytes.enable,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   136               display_cfg=
->overrides.hw.force_nom_det_size_kbytes.value,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   137               mode_lib->i=
p.dcn_mrq_present,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   138
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   139               /* Output *=
/
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   140               &s->MaxTota=
lDETInKByte,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   141               &s->NomDETI=
nKByte,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   142               &s->MinComp=
ressedBufferSizeInKByte);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   143
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   144
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   145       dcn5_adjust_pixel_c=
lock_for_progressive_to_interlace_unit(display_cfg, mode_lib->ip.ptoi_suppo=
rted, s->PixelClockBackEnd);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   146
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   147       for (k =3D 0; k < s=
->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   148               dcn5_calcul=
ate_single_pipe_dppclk_and_scl_throughput(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   149                       dis=
play_cfg->plane_descriptors[k].composition.scaler_info.plane0.h_ratio,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   150                       dis=
play_cfg->plane_descriptors[k].composition.scaler_info.plane1.h_ratio,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   151                       dis=
play_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   152                       dis=
play_cfg->plane_descriptors[k].composition.scaler_info.plane1.v_ratio,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   153                       mod=
e_lib->ip.max_dchub_pscl_bw_pix_per_clk,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   154                       mod=
e_lib->ip.max_pscl_lb_bw_pix_per_clk,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   155                       ((d=
ouble)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].str=
eam_index].timing.pixel_clock_khz / 1000),
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   156                       dis=
play_cfg->plane_descriptors[k].pixel_format,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   157                       dis=
play_cfg->plane_descriptors[k].composition.scaler_info.plane0.h_taps,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   158                       dis=
play_cfg->plane_descriptors[k].composition.scaler_info.plane1.v_taps,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   159                       dis=
play_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_taps,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   160                       dis=
play_cfg->plane_descriptors[k].composition.scaler_info.plane1.h_taps,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   161
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   162                       /* =
Output */
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   163                       &mo=
de_lib->mp.PSCL_THROUGHPUT[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   164                       &mo=
de_lib->mp.PSCL_THROUGHPUT_CHROMA[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   165                       &mo=
de_lib->mp.DPPCLKUsingSingleDPP[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   166       }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   167
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   168       for (k =3D 0; k < s=
->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   169               dcn5_calcul=
ate_byte_per_pixel_and_block_sizes(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   170                       dis=
play_cfg->plane_descriptors[k].pixel_format,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   171                       dis=
play_cfg->plane_descriptors[k].surface.tiling,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   172                       dis=
play_cfg->plane_descriptors[k].surface.plane0.pitch,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   173                       dis=
play_cfg->plane_descriptors[k].surface.plane1.pitch,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   174
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   175                       // =
Output
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   176                       &mo=
de_lib->mp.BytePerPixelY[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   177                       &mo=
de_lib->mp.BytePerPixelC[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   178                       &mo=
de_lib->mp.BytePerPixelInDETY[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   179                       &mo=
de_lib->mp.BytePerPixelInDETC[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   180                       &mo=
de_lib->mp.Read256BlockHeightY[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   181                       &mo=
de_lib->mp.Read256BlockHeightC[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   182                       &mo=
de_lib->mp.Read256BlockWidthY[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   183                       &mo=
de_lib->mp.Read256BlockWidthC[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   184                       &mo=
de_lib->mp.MacroTileHeightY[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   185                       &mo=
de_lib->mp.MacroTileHeightC[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   186                       &mo=
de_lib->mp.MacroTileWidthY[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   187                       &mo=
de_lib->mp.MacroTileWidthC[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   188                       &mo=
de_lib->mp.surf_linear128_l[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   189                       &mo=
de_lib->mp.surf_linear128_c[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   190       }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   191
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   192       dcn5_calculate_swat=
h_width(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   193               display_cfg=
,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   194               false, // F=
orceSingleDPP
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   195               s->num_acti=
ve_planes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   196               mode_lib->m=
p.ODMMode,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   197               mode_lib->m=
p.BytePerPixelY,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   198               mode_lib->m=
p.BytePerPixelC,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   199               mode_lib->m=
p.Read256BlockHeightY,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   200               mode_lib->m=
p.Read256BlockHeightC,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   201               mode_lib->m=
p.Read256BlockWidthY,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   202               mode_lib->m=
p.Read256BlockWidthC,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   203               mode_lib->m=
p.surf_linear128_l,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   204               mode_lib->m=
p.surf_linear128_c,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   205               mode_lib->m=
p.NoOfDPP,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   206
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   207               /* Output *=
/
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   208               mode_lib->m=
p.req_per_swath_ub_l,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   209               mode_lib->m=
p.req_per_swath_ub_c,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   210               mode_lib->m=
p.SwathWidthSingleDPPY,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   211               mode_lib->m=
p.SwathWidthSingleDPPC,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   212               mode_lib->m=
p.SwathWidthY,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   213               mode_lib->m=
p.SwathWidthC,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   214               s->dummy_in=
teger_array[0], // unsigned int MaximumSwathHeightY[]
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   215               s->dummy_in=
teger_array[1], // unsigned int MaximumSwathHeightC[]
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   216               mode_lib->m=
p.swath_width_luma_ub,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   217               mode_lib->m=
p.swath_width_chroma_ub,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   218               s->dummy_in=
teger_array[2],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   219               s->dummy_in=
teger_array[3]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   220
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   221       for (k =3D 0; k < s=
->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   222               mode_lib->m=
p.cursor_bw[k] =3D display_cfg->plane_descriptors[k].cursor.num_cursors * d=
isplay_cfg->plane_descriptors[k].cursor.cursor_width * display_cfg->plane_d=
escriptors[k].cursor.cursor_bpp / 8.0 /
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   223                       ((d=
ouble)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].str=
eam_index].timing.h_total / ((double)display_cfg->stream_descriptors[displa=
y_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000));
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   224               mode_lib->m=
p.vactive_sw_bw_l[k] =3D mode_lib->mp.SwathWidthSingleDPPY[k] * mode_lib->m=
p.BytePerPixelY[k] / (display_cfg->stream_descriptors[display_cfg->plane_de=
scriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_de=
scriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_cloc=
k_khz / 1000)) * display_cfg->plane_descriptors[k].composition.scaler_info.=
plane0.v_ratio;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   225               mode_lib->m=
p.vactive_sw_bw_c[k] =3D mode_lib->mp.SwathWidthSingleDPPC[k] * mode_lib->m=
p.BytePerPixelC[k] / (display_cfg->stream_descriptors[display_cfg->plane_de=
scriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_de=
scriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_cloc=
k_khz / 1000)) * display_cfg->plane_descriptors[k].composition.scaler_info.=
plane1.v_ratio;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   226               DML_LOG_VER=
BOSE("DML::%s: vactive_sw_bw_l[%i] =3D %fBps\n", __func__, k, mode_lib->mp.=
vactive_sw_bw_l[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   227               DML_LOG_VER=
BOSE("DML::%s: vactive_sw_bw_c[%i] =3D %fBps\n", __func__, k, mode_lib->mp.=
vactive_sw_bw_c[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   228       }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   229
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   230       CalculateSwathAndDE=
TConfiguration_params->display_cfg =3D display_cfg;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   231       CalculateSwathAndDE=
TConfiguration_params->ConfigReturnBufferSizeInKByte =3D mode_lib->ip.confi=
g_return_buffer_size_in_kbytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   232       CalculateSwathAndDE=
TConfiguration_params->MaxTotalDETInKByte =3D s->MaxTotalDETInKByte;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   233       CalculateSwathAndDE=
TConfiguration_params->MinCompressedBufferSizeInKByte =3D s->MinCompressedB=
ufferSizeInKByte;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   234       CalculateSwathAndDE=
TConfiguration_params->rob_buffer_size_kbytes =3D mode_lib->ip.rob_buffer_s=
ize_kbytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   235       CalculateSwathAndDE=
TConfiguration_params->pixel_chunk_size_kbytes =3D mode_lib->ip.pixel_chunk=
_size_kbytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   236       CalculateSwathAndDE=
TConfiguration_params->rob_buffer_size_kbytes =3D mode_lib->ip.rob_buffer_s=
ize_kbytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   237       CalculateSwathAndDE=
TConfiguration_params->pixel_chunk_size_kbytes =3D mode_lib->ip.pixel_chunk=
_size_kbytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   238       CalculateSwathAndDE=
TConfiguration_params->ForceSingleDPP =3D false;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   239       CalculateSwathAndDE=
TConfiguration_params->NumberOfActiveSurfaces =3D s->num_active_planes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   240       CalculateSwathAndDE=
TConfiguration_params->nomDETInKByte =3D s->NomDETInKByte;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   241       CalculateSwathAndDE=
TConfiguration_params->ConfigReturnBufferSegmentSizeInkByte =3D mode_lib->i=
p.config_return_buffer_segment_size_in_kbytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   242       CalculateSwathAndDE=
TConfiguration_params->CompressedBufferSegmentSizeInkByte =3D mode_lib->ip.=
compressed_buffer_segment_size_in_kbytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   243       CalculateSwathAndDE=
TConfiguration_params->ReadBandwidthLuma =3D mode_lib->mp.vactive_sw_bw_l;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   244       CalculateSwathAndDE=
TConfiguration_params->ReadBandwidthChroma =3D mode_lib->mp.vactive_sw_bw_c=
;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   245       CalculateSwathAndDE=
TConfiguration_params->MaximumSwathWidthLuma =3D s->dummy_single_array[0];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   246       CalculateSwathAndDE=
TConfiguration_params->MaximumSwathWidthChroma =3D s->dummy_single_array[1]=
;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   247       CalculateSwathAndDE=
TConfiguration_params->Read256BytesBlockHeightY =3D mode_lib->mp.Read256Blo=
ckHeightY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   248       CalculateSwathAndDE=
TConfiguration_params->Read256BytesBlockHeightC =3D mode_lib->mp.Read256Blo=
ckHeightC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   249       CalculateSwathAndDE=
TConfiguration_params->Read256BytesBlockWidthY =3D mode_lib->mp.Read256Bloc=
kWidthY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   250       CalculateSwathAndDE=
TConfiguration_params->Read256BytesBlockWidthC =3D mode_lib->mp.Read256Bloc=
kWidthC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   251       CalculateSwathAndDE=
TConfiguration_params->surf_linear128_l =3D mode_lib->mp.surf_linear128_l;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   252       CalculateSwathAndDE=
TConfiguration_params->surf_linear128_c =3D mode_lib->mp.surf_linear128_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   253       CalculateSwathAndDE=
TConfiguration_params->ODMMode =3D mode_lib->mp.ODMMode;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   254       CalculateSwathAndDE=
TConfiguration_params->DPPPerSurface =3D mode_lib->mp.NoOfDPP;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   255       CalculateSwathAndDE=
TConfiguration_params->BytePerPixY =3D mode_lib->mp.BytePerPixelY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   256       CalculateSwathAndDE=
TConfiguration_params->BytePerPixC =3D mode_lib->mp.BytePerPixelC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   257       CalculateSwathAndDE=
TConfiguration_params->BytePerPixDETY =3D mode_lib->mp.BytePerPixelInDETY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   258       CalculateSwathAndDE=
TConfiguration_params->BytePerPixDETC =3D mode_lib->mp.BytePerPixelInDETC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   259       CalculateSwathAndDE=
TConfiguration_params->mrq_present =3D mode_lib->ip.dcn_mrq_present;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   260
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   261       // output
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   262       CalculateSwathAndDE=
TConfiguration_params->req_per_swath_ub_l =3D mode_lib->mp.req_per_swath_ub=
_l;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   263       CalculateSwathAndDE=
TConfiguration_params->req_per_swath_ub_c =3D mode_lib->mp.req_per_swath_ub=
_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   264       CalculateSwathAndDE=
TConfiguration_params->swath_width_luma_ub =3D s->dummy_long_array[0];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   265       CalculateSwathAndDE=
TConfiguration_params->swath_width_chroma_ub =3D s->dummy_long_array[1];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   266       CalculateSwathAndDE=
TConfiguration_params->SwathWidth =3D s->dummy_long_array[2];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   267       CalculateSwathAndDE=
TConfiguration_params->SwathWidthChroma =3D s->dummy_long_array[3];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   268       CalculateSwathAndDE=
TConfiguration_params->SwathHeightY =3D mode_lib->mp.SwathHeightY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   269       CalculateSwathAndDE=
TConfiguration_params->SwathHeightC =3D mode_lib->mp.SwathHeightC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   270       CalculateSwathAndDE=
TConfiguration_params->request_size_bytes_luma =3D mode_lib->mp.request_siz=
e_bytes_luma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   271       CalculateSwathAndDE=
TConfiguration_params->request_size_bytes_chroma =3D mode_lib->mp.request_s=
ize_bytes_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   272       CalculateSwathAndDE=
TConfiguration_params->DETBufferSizeInKByte =3D mode_lib->mp.DETBufferSizeI=
nKByte;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   273       CalculateSwathAndDE=
TConfiguration_params->DETBufferSizeY =3D mode_lib->mp.DETBufferSizeY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   274       CalculateSwathAndDE=
TConfiguration_params->DETBufferSizeC =3D mode_lib->mp.DETBufferSizeC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   275       CalculateSwathAndDE=
TConfiguration_params->full_swath_bytes_l =3D s->full_swath_bytes_l;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   276       CalculateSwathAndDE=
TConfiguration_params->full_swath_bytes_c =3D s->full_swath_bytes_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   277       CalculateSwathAndDE=
TConfiguration_params->full_swath_bytes_single_dpp_l =3D s->dummy_long_arra=
y[4];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   278       CalculateSwathAndDE=
TConfiguration_params->full_swath_bytes_single_dpp_c =3D s->dummy_long_arra=
y[5];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   279       CalculateSwathAndDE=
TConfiguration_params->UnboundedRequestEnabled =3D &mode_lib->mp.UnboundedR=
equestEnabled;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   280       CalculateSwathAndDE=
TConfiguration_params->compbuf_reserved_space_64b =3D &mode_lib->mp.compbuf=
_reserved_space_64b;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   281       CalculateSwathAndDE=
TConfiguration_params->hw_debug5 =3D &mode_lib->mp.hw_debug5;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   282       CalculateSwathAndDE=
TConfiguration_params->CompressedBufferSizeInkByte =3D &mode_lib->mp.Compre=
ssedBufferSizeInkByte;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   283       CalculateSwathAndDE=
TConfiguration_params->ViewportSizeSupportPerSurface =3D &s->dummy_boolean_=
array[0][0];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   284       CalculateSwathAndDE=
TConfiguration_params->ViewportSizeSupport =3D &s->dummy_boolean[0];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   285
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   286       // Calculate DET si=
ze, swath height here.
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   287       dcn5_calculate_swat=
h_and_det_configuration(&mode_lib->scratch, CalculateSwathAndDETConfigurati=
on_params);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   288
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   289       // DSC Delay
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   290       mode_lib->mp.use_le=
gacy_dsc_delay_formula =3D mode_lib->ip.use_legacy_dsc_delay_formula;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   291       for (k =3D 0; k < s=
->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   292               mode_lib->m=
p.DSCDelay[k] =3D dcn5_calculate_dsc_delay_requirement(cfg_support_info->st=
ream_support_info[display_cfg->plane_descriptors[k].stream_index].dsc_enabl=
e,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   293                       mod=
e_lib->mp.ODMMode[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   294                       mod=
e_lib->ip.maximum_dsc_bits_per_component,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   295                       s->=
OutputBpp[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   296                       dis=
play_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index=
].timing.h_active,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   297                       dis=
play_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index=
].timing.h_total,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   298                       cfg=
_support_info->stream_support_info[display_cfg->plane_descriptors[k].stream=
_index].num_dsc_slices,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   299                       dis=
play_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index=
].output.output_format,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   300                       dis=
play_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index=
].output.output_encoder,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   301                       ((d=
ouble)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].str=
eam_index].timing.pixel_clock_khz / 1000),
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   302                       s->=
PixelClockBackEnd[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   303                       mod=
e_lib->mp.use_legacy_dsc_delay_formula);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   304       }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   305
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   306       for (k =3D 0; k < s=
->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   307               s->SurfaceP=
arameters[k].PixelClock =3D ((double)display_cfg->stream_descriptors[displa=
y_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   308               s->SurfaceP=
arameters[k].DPPPerSurface =3D mode_lib->mp.NoOfDPP[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   309               s->SurfaceP=
arameters[k].RotationAngle =3D display_cfg->plane_descriptors[k].compositio=
n.rotation_angle;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   310               s->SurfaceP=
arameters[k].ViewportHeight =3D display_cfg->plane_descriptors[k].compositi=
on.viewport.plane0.height;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   311               s->SurfaceP=
arameters[k].ViewportHeightC =3D display_cfg->plane_descriptors[k].composit=
ion.viewport.plane1.height;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   312               s->SurfaceP=
arameters[k].BlockWidth256BytesY =3D mode_lib->mp.Read256BlockWidthY[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   313               s->SurfaceP=
arameters[k].BlockHeight256BytesY =3D mode_lib->mp.Read256BlockHeightY[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   314               s->SurfaceP=
arameters[k].BlockWidth256BytesC =3D mode_lib->mp.Read256BlockWidthC[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   315               s->SurfaceP=
arameters[k].BlockHeight256BytesC =3D mode_lib->mp.Read256BlockHeightC[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   316               s->SurfaceP=
arameters[k].BlockWidthY =3D mode_lib->mp.MacroTileWidthY[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   317               s->SurfaceP=
arameters[k].BlockHeightY =3D mode_lib->mp.MacroTileHeightY[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   318               s->SurfaceP=
arameters[k].BlockWidthC =3D mode_lib->mp.MacroTileWidthC[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   319               s->SurfaceP=
arameters[k].BlockHeightC =3D mode_lib->mp.MacroTileHeightC[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   320               s->SurfaceP=
arameters[k].InterlaceEnable =3D display_cfg->stream_descriptors[display_cf=
g->plane_descriptors[k].stream_index].timing.interlaced;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   321               s->SurfaceP=
arameters[k].HTotal =3D display_cfg->stream_descriptors[display_cfg->plane_=
descriptors[k].stream_index].timing.h_total;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   322               s->SurfaceP=
arameters[k].DCCEnable =3D display_cfg->plane_descriptors[k].surface.dcc.en=
able;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   323               s->SurfaceP=
arameters[k].SourcePixelFormat =3D display_cfg->plane_descriptors[k].pixel_=
format;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   324               s->SurfaceP=
arameters[k].SurfaceTiling =3D display_cfg->plane_descriptors[k].surface.ti=
ling;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   325               s->SurfaceP=
arameters[k].BytePerPixelY =3D mode_lib->mp.BytePerPixelY[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   326               s->SurfaceP=
arameters[k].BytePerPixelC =3D mode_lib->mp.BytePerPixelC[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   327               s->SurfaceP=
arameters[k].ProgressiveToInterlaceUnitInOPP =3D mode_lib->ip.ptoi_supporte=
d;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   328               s->SurfaceP=
arameters[k].VRatio =3D display_cfg->plane_descriptors[k].composition.scale=
r_info.plane0.v_ratio;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   329               s->SurfaceP=
arameters[k].VRatioChroma =3D display_cfg->plane_descriptors[k].composition=
.scaler_info.plane1.v_ratio;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   330               s->SurfaceP=
arameters[k].VTaps =3D display_cfg->plane_descriptors[k].composition.scaler=
_info.plane0.v_taps;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   331               s->SurfaceP=
arameters[k].VTapsChroma =3D display_cfg->plane_descriptors[k].composition.=
scaler_info.plane1.v_taps;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   332               s->SurfaceP=
arameters[k].PitchY =3D display_cfg->plane_descriptors[k].surface.plane0.pi=
tch;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   333               s->SurfaceP=
arameters[k].PitchC =3D display_cfg->plane_descriptors[k].surface.plane1.pi=
tch;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   334               s->SurfaceP=
arameters[k].ViewportStationary =3D display_cfg->plane_descriptors[k].compo=
sition.viewport.stationary;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   335               s->SurfaceP=
arameters[k].ViewportXStart =3D display_cfg->plane_descriptors[k].compositi=
on.viewport.plane0.x_start;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   336               s->SurfaceP=
arameters[k].ViewportYStart =3D display_cfg->plane_descriptors[k].compositi=
on.viewport.plane0.y_start;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   337               s->SurfaceP=
arameters[k].ViewportXStartC =3D display_cfg->plane_descriptors[k].composit=
ion.viewport.plane1.y_start;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   338               s->SurfaceP=
arameters[k].ViewportYStartC =3D display_cfg->plane_descriptors[k].composit=
ion.viewport.plane1.y_start;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   339               s->SurfaceP=
arameters[k].FORCE_ONE_ROW_FOR_FRAME =3D display_cfg->plane_descriptors[k].=
overrides.hw.force_one_row_for_frame;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   340               s->SurfaceP=
arameters[k].SwathHeightY =3D mode_lib->mp.SwathHeightY[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   341               s->SurfaceP=
arameters[k].SwathHeightC =3D mode_lib->mp.SwathHeightC[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   342               s->SurfaceP=
arameters[k].DCCMetaPitchY =3D display_cfg->plane_descriptors[k].surface.dc=
c.plane0.pitch;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   343               s->SurfaceP=
arameters[k].DCCMetaPitchC =3D display_cfg->plane_descriptors[k].surface.dc=
c.plane1.pitch;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   344               s->SurfaceP=
arameters[k].UPSPEnabled =3D display_cfg->plane_descriptors[k].composition.=
scaler_info.upsp_enabled;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   345       }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   346
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   347       CalculateVMRowAndSw=
ath_params->display_cfg =3D display_cfg;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   348       CalculateVMRowAndSw=
ath_params->uclk_pstate_switch_modes =3D mode_lib->ms.uclk_pstate_switch_mo=
des;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   349       CalculateVMRowAndSw=
ath_params->NumberOfActiveSurfaces =3D s->num_active_planes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   350       CalculateVMRowAndSw=
ath_params->myPipe =3D s->SurfaceParameters;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   351       CalculateVMRowAndSw=
ath_params->PTEBufferSizeInRequestsLuma =3D mode_lib->ip.dpte_buffer_size_i=
n_pte_reqs_luma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   352       CalculateVMRowAndSw=
ath_params->PTEBufferSizeInRequestsChroma =3D mode_lib->ip.dpte_buffer_size=
_in_pte_reqs_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   353       CalculateVMRowAndSw=
ath_params->SwathWidthY =3D mode_lib->mp.SwathWidthY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   354       CalculateVMRowAndSw=
ath_params->SwathWidthC =3D mode_lib->mp.SwathWidthC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   355       CalculateVMRowAndSw=
ath_params->DCCMetaBufferSizeBytes =3D mode_lib->ip.dcc_meta_buffer_size_by=
tes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   356       CalculateVMRowAndSw=
ath_params->mrq_present =3D mode_lib->ip.dcn_mrq_present;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   357
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   358       // output
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   359       CalculateVMRowAndSw=
ath_params->PTEBufferSizeNotExceeded =3D s->dummy_boolean_array[0];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   360       CalculateVMRowAndSw=
ath_params->dpte_row_width_luma_ub =3D mode_lib->mp.dpte_row_width_luma_ub;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   361       CalculateVMRowAndSw=
ath_params->dpte_row_width_chroma_ub =3D mode_lib->mp.dpte_row_width_chroma=
_ub;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   362       CalculateVMRowAndSw=
ath_params->dpte_row_height_luma =3D mode_lib->mp.dpte_row_height;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   363       CalculateVMRowAndSw=
ath_params->dpte_row_height_chroma =3D mode_lib->mp.dpte_row_height_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   364       CalculateVMRowAndSw=
ath_params->dpte_row_height_linear_luma =3D mode_lib->mp.dpte_row_height_li=
near;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   365       CalculateVMRowAndSw=
ath_params->dpte_row_height_linear_chroma =3D mode_lib->mp.dpte_row_height_=
linear_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   366       CalculateVMRowAndSw=
ath_params->vm_group_bytes =3D mode_lib->mp.vm_group_bytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   367       CalculateVMRowAndSw=
ath_params->dpte_group_bytes =3D mode_lib->mp.dpte_group_bytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   368       CalculateVMRowAndSw=
ath_params->PixelPTEReqWidthY =3D mode_lib->mp.PixelPTEReqWidthY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   369       CalculateVMRowAndSw=
ath_params->PixelPTEReqHeightY =3D mode_lib->mp.PixelPTEReqHeightY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   370       CalculateVMRowAndSw=
ath_params->PTERequestSizeY =3D mode_lib->mp.PTERequestSizeY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   371       CalculateVMRowAndSw=
ath_params->PixelPTEReqWidthC =3D mode_lib->mp.PixelPTEReqWidthC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   372       CalculateVMRowAndSw=
ath_params->PixelPTEReqHeightC =3D mode_lib->mp.PixelPTEReqHeightC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   373       CalculateVMRowAndSw=
ath_params->PTERequestSizeC =3D mode_lib->mp.PTERequestSizeC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   374       CalculateVMRowAndSw=
ath_params->vmpg_width_y =3D s->vmpg_width_y;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   375       CalculateVMRowAndSw=
ath_params->vmpg_height_y =3D s->vmpg_height_y;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   376       CalculateVMRowAndSw=
ath_params->vmpg_width_c =3D s->vmpg_width_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   377       CalculateVMRowAndSw=
ath_params->vmpg_height_c =3D s->vmpg_height_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   378       CalculateVMRowAndSw=
ath_params->dpde0_bytes_per_frame_ub_l =3D mode_lib->mp.dpde0_bytes_per_fra=
me_ub_l;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   379       CalculateVMRowAndSw=
ath_params->dpde0_bytes_per_frame_ub_c =3D mode_lib->mp.dpde0_bytes_per_fra=
me_ub_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   380       CalculateVMRowAndSw=
ath_params->PrefetchSourceLinesY =3D mode_lib->mp.PrefetchSourceLinesY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   381       CalculateVMRowAndSw=
ath_params->PrefetchSourceLinesC =3D mode_lib->mp.PrefetchSourceLinesC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   382       CalculateVMRowAndSw=
ath_params->VInitPreFillY =3D mode_lib->mp.VInitPreFillY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   383       CalculateVMRowAndSw=
ath_params->VInitPreFillC =3D mode_lib->mp.VInitPreFillC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   384       CalculateVMRowAndSw=
ath_params->MaxNumSwathY =3D mode_lib->mp.MaxNumSwathY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   385       CalculateVMRowAndSw=
ath_params->MaxNumSwathC =3D mode_lib->mp.MaxNumSwathC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   386       CalculateVMRowAndSw=
ath_params->dpte_row_bw =3D mode_lib->mp.dpte_row_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   387       CalculateVMRowAndSw=
ath_params->PixelPTEBytesPerRow =3D mode_lib->mp.PixelPTEBytesPerRow;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   388       CalculateVMRowAndSw=
ath_params->dpte_row_bytes_per_row_l =3D s->dpte_row_bytes_per_row_l;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   389       CalculateVMRowAndSw=
ath_params->dpte_row_bytes_per_row_c =3D s->dpte_row_bytes_per_row_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   390       CalculateVMRowAndSw=
ath_params->vm_bytes =3D mode_lib->mp.vm_bytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   391       CalculateVMRowAndSw=
ath_params->use_one_row_for_frame =3D mode_lib->mp.use_one_row_for_frame;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   392       CalculateVMRowAndSw=
ath_params->use_one_row_for_frame_flip =3D mode_lib->mp.use_one_row_for_fra=
me_flip;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   393       CalculateVMRowAndSw=
ath_params->PTE_BUFFER_MODE =3D mode_lib->mp.PTE_BUFFER_MODE;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   394       CalculateVMRowAndSw=
ath_params->BIGK_FRAGMENT_SIZE =3D mode_lib->mp.BIGK_FRAGMENT_SIZE;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   395       CalculateVMRowAndSw=
ath_params->DCCMetaBufferSizeNotExceeded =3D s->dummy_boolean_array[1];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   396       CalculateVMRowAndSw=
ath_params->meta_row_bw =3D mode_lib->mp.meta_row_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   397       CalculateVMRowAndSw=
ath_params->meta_row_bytes =3D mode_lib->mp.meta_row_bytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   398       CalculateVMRowAndSw=
ath_params->meta_row_bytes_per_row_ub_l =3D s->meta_row_bytes_per_row_ub_l;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   399       CalculateVMRowAndSw=
ath_params->meta_row_bytes_per_row_ub_c =3D s->meta_row_bytes_per_row_ub_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   400       CalculateVMRowAndSw=
ath_params->meta_req_width_luma =3D mode_lib->mp.meta_req_width;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   401       CalculateVMRowAndSw=
ath_params->meta_req_height_luma =3D mode_lib->mp.meta_req_height;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   402       CalculateVMRowAndSw=
ath_params->meta_row_width_luma =3D mode_lib->mp.meta_row_width;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   403       CalculateVMRowAndSw=
ath_params->meta_row_height_luma =3D mode_lib->mp.meta_row_height;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   404       CalculateVMRowAndSw=
ath_params->meta_pte_bytes_per_frame_ub_l =3D mode_lib->mp.meta_pte_bytes_p=
er_frame_ub_l;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   405       CalculateVMRowAndSw=
ath_params->meta_req_width_chroma =3D mode_lib->mp.meta_req_width_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   406       CalculateVMRowAndSw=
ath_params->meta_row_height_chroma =3D mode_lib->mp.meta_row_height_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   407       CalculateVMRowAndSw=
ath_params->meta_row_width_chroma =3D mode_lib->mp.meta_row_width_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   408       CalculateVMRowAndSw=
ath_params->meta_req_height_chroma =3D mode_lib->mp.meta_req_height_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   409       CalculateVMRowAndSw=
ath_params->meta_pte_bytes_per_frame_ub_c =3D mode_lib->mp.meta_pte_bytes_p=
er_frame_ub_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   410
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   411       dcn5_calculate_vm_r=
ow_and_swath(&mode_lib->scratch, CalculateVMRowAndSwath_params);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   412
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   413       memset(calculate_mc=
ache_setting_params, 0, sizeof(struct dml2_core_calcs_calculate_mcache_sett=
ing_params));
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   414       for (k =3D 0; k < s=
->num_active_planes; k++) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   415               mode_lib->m=
p.dcc_dram_bw_nom_overhead_factor_p0[k] =3D 1.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   416               mode_lib->m=
p.dcc_dram_bw_pref_overhead_factor_p0[k] =3D 1.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   417               mode_lib->m=
p.dcc_dram_bw_nom_overhead_factor_p1[k] =3D 1.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   418               mode_lib->m=
p.dcc_dram_bw_pref_overhead_factor_p1[k] =3D 1.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   419       }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   420
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   421       dcn5_calculate_host=
vm_inefficiency_factor(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   422               &s->HostVMI=
nefficiencyFactor,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   423               &s->HostVMI=
nefficiencyFactorPrefetch,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   424
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   425               display_cfg=
->gpuvm_enable,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   426               display_cfg=
->hostvm_enable,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   427               mode_lib->i=
p.remote_iommu_outstanding_translations,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   428               utm_soc_bb-=
>max_outstanding_reqs,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   429               1.0,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   430               0.5);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   431
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   432       s->TotalDCCActiveDP=
P =3D 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   433       s->TotalActiveDPP =
=3D 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   434       for (k =3D 0; k < s=
->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   435               s->TotalAct=
iveDPP =3D s->TotalActiveDPP + mode_lib->mp.NoOfDPP[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   436               if (display=
_cfg->plane_descriptors[k].surface.dcc.enable)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   437                       s->=
TotalDCCActiveDPP =3D s->TotalDCCActiveDPP + mode_lib->mp.NoOfDPP[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   438       }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   439       // Calculate tdlut =
schedule related terms
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   440       for (k =3D 0; k <=
=3D s->num_active_planes - 1; k++) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   441               calculate_t=
dlut_setting_params->dispclk_mhz =3D mode_lib->mp.Dispclk;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   442               calculate_t=
dlut_setting_params->setup_for_tdlut =3D display_cfg->plane_descriptors[k].=
tdlut.setup_for_tdlut;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   443               calculate_t=
dlut_setting_params->tdlut_width_mode =3D display_cfg->plane_descriptors[k]=
.tdlut.tdlut_width_mode;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   444               calculate_t=
dlut_setting_params->tdlut_addressing_mode =3D display_cfg->plane_descripto=
rs[k].tdlut.tdlut_addressing_mode;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   445               calculate_t=
dlut_setting_params->cursor_buffer_size =3D mode_lib->ip.cursor_buffer_size=
;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   446               calculate_t=
dlut_setting_params->gpuvm_enable =3D display_cfg->gpuvm_enable;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   447               calculate_t=
dlut_setting_params->gpuvm_page_size_kbytes =3D display_cfg->plane_descript=
ors[k].overrides.gpuvm_min_page_size_kbytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   448
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   449               // output
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   450               calculate_t=
dlut_setting_params->tdlut_pte_bytes_per_frame =3D &s->tdlut_pte_bytes_per_=
frame[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   451               calculate_t=
dlut_setting_params->tdlut_bytes_per_frame =3D &s->tdlut_bytes_per_frame[k]=
;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   452               calculate_t=
dlut_setting_params->tdlut_groups_per_2row_ub =3D &s->tdlut_groups_per_2row=
_ub[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   453               calculate_t=
dlut_setting_params->tdlut_opt_time =3D &s->tdlut_opt_time[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   454               calculate_t=
dlut_setting_params->tdlut_drain_time =3D &s->tdlut_drain_time[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   455               calculate_t=
dlut_setting_params->tdlut_bytes_per_group =3D &s->tdlut_bytes_per_group[k]=
;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   456
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   457               dcn5_calcul=
ate_tdlut_setting(&mode_lib->scratch, calculate_tdlut_setting_params);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   458       }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   459
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   460       dcn5_calculate_extr=
a_latency(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   461               display_cfg=
,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   462               mode_lib->i=
p.rob_buffer_size_kbytes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   463               0,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   464               s->Reorderi=
ngBytes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   465               mode_lib->m=
p.Dcfclk,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   466               mode_lib->m=
p.FabricClock,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   467               mode_lib->i=
p.pixel_chunk_size_kbytes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   468               mode_lib->m=
p.dram_bw_mbps,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   469               s->num_acti=
ve_planes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   470               mode_lib->m=
p.NoOfDPP,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   471               mode_lib->m=
p.dpte_group_bytes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   472               s->tdlut_by=
tes_per_group,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   473               s->HostVMIn=
efficiencyFactor,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   474               s->HostVMIn=
efficiencyFactorPrefetch,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   475               dml2_qos_pa=
ram_type_dcn4x,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   476               !(display_c=
fg->overrides.max_outstanding_when_urgent_expected_disable),
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   477               utm_soc_bb-=
>max_outstanding_reqs,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   478               mode_lib->m=
p.request_size_bytes_luma,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   479               mode_lib->m=
p.request_size_bytes_chroma,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   480               mode_lib->i=
p.meta_chunk_size_kbytes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   481               mode_lib->i=
p.dchub_arb_to_ret_delay,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   482               mode_lib->m=
p.TripToMemory,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   483               mode_lib->i=
p.hostvm_mode,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   484
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   485               // output
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   486               &mode_lib->=
mp.ExtraLatency,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   487               &mode_lib->=
mp.ExtraLatency_sr,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   488               &mode_lib->=
mp.ExtraLatencyPrefetch);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   489
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   490       mode_lib->mp.TCalc =
=3D 24.0 / mode_lib->mp.DCFCLKDeepSleep;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   491
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   492       for (k =3D 0; k < s=
->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   493               mode_lib->m=
p.WritebackDelay[k] =3D 0.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   494               for (j =3D =
0; j < display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].st=
ream_index].writeback.active_writebacks_per_stream; ++j) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   495                       mod=
e_lib->mp.WritebackDelay[k] =3D math_max2(mode_lib->mp.WritebackDelay[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   496                          =
             utm_soc_bb->writeback_base_latency_us
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   497                          =
             + dcn5_calculate_write_back_delay(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   498                          =
                     display_cfg->stream_descriptors[display_cfg->plane_des=
criptors[k].stream_index].writeback.writeback_stream[j].pixel_format,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   499                          =
                     display_cfg->stream_descriptors[display_cfg->plane_des=
criptors[k].stream_index].writeback.writeback_stream[j].h_ratio,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   500                          =
                     display_cfg->stream_descriptors[display_cfg->plane_des=
criptors[k].stream_index].writeback.writeback_stream[j].v_ratio,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   501                          =
                     display_cfg->stream_descriptors[display_cfg->plane_des=
criptors[k].stream_index].writeback.writeback_stream[j].v_taps,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   502                          =
                     display_cfg->stream_descriptors[display_cfg->plane_des=
criptors[k].stream_index].writeback.writeback_stream[j].v_taps_chroma,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   503                          =
                     display_cfg->stream_descriptors[display_cfg->plane_des=
criptors[k].stream_index].writeback.writeback_stream[j].output_width,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   504                          =
                     display_cfg->stream_descriptors[display_cfg->plane_des=
criptors[k].stream_index].writeback.writeback_stream[j].output_height,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   505                          =
                     display_cfg->stream_descriptors[display_cfg->plane_des=
criptors[k].stream_index].writeback.writeback_stream[j].input_width,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   506                          =
                     display_cfg->stream_descriptors[display_cfg->plane_des=
criptors[k].stream_index].writeback.writeback_stream[j].input_height,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   507                          =
                     display_cfg->stream_descriptors[display_cfg->plane_des=
criptors[k].stream_index].timing.h_total)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   508                          =
                     / mode_lib->mp.Dispclk);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   509               }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   510       }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   511
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   512       /* VActive bytes to=
 fetch for UCLK P-State */
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   513       calculate_bytes_to_=
fetch_required_to_hide_latency_params->display_cfg =3D display_cfg;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   514       calculate_bytes_to_=
fetch_required_to_hide_latency_params->mrq_present =3D mode_lib->ip.dcn_mrq=
_present;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   515
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   516       calculate_bytes_to_=
fetch_required_to_hide_latency_params->num_active_planes =3D s->num_active_=
planes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   517       calculate_bytes_to_=
fetch_required_to_hide_latency_params->num_of_dpp =3D mode_lib->mp.NoOfDPP;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   518       calculate_bytes_to_=
fetch_required_to_hide_latency_params->meta_row_height_l =3D mode_lib->mp.m=
eta_row_height;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   519       calculate_bytes_to_=
fetch_required_to_hide_latency_params->meta_row_height_c =3D mode_lib->mp.m=
eta_row_height_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   520       calculate_bytes_to_=
fetch_required_to_hide_latency_params->meta_row_bytes_per_row_ub_l =3D s->m=
eta_row_bytes_per_row_ub_l;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   521       calculate_bytes_to_=
fetch_required_to_hide_latency_params->meta_row_bytes_per_row_ub_c =3D s->m=
eta_row_bytes_per_row_ub_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   522       calculate_bytes_to_=
fetch_required_to_hide_latency_params->dpte_row_height_l =3D mode_lib->mp.d=
pte_row_height;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   523       calculate_bytes_to_=
fetch_required_to_hide_latency_params->dpte_row_height_c =3D mode_lib->mp.d=
pte_row_height_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   524       calculate_bytes_to_=
fetch_required_to_hide_latency_params->dpte_bytes_per_row_l =3D s->dpte_row=
_bytes_per_row_l;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   525       calculate_bytes_to_=
fetch_required_to_hide_latency_params->dpte_bytes_per_row_c =3D s->dpte_row=
_bytes_per_row_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   526       calculate_bytes_to_=
fetch_required_to_hide_latency_params->byte_per_pix_l =3D mode_lib->mp.Byte=
PerPixelY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   527       calculate_bytes_to_=
fetch_required_to_hide_latency_params->byte_per_pix_c =3D mode_lib->mp.Byte=
PerPixelC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   528       calculate_bytes_to_=
fetch_required_to_hide_latency_params->swath_width_l =3D mode_lib->mp.Swath=
WidthY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   529       calculate_bytes_to_=
fetch_required_to_hide_latency_params->swath_width_c =3D mode_lib->mp.Swath=
WidthC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   530       calculate_bytes_to_=
fetch_required_to_hide_latency_params->swath_height_l =3D mode_lib->mp.Swat=
hHeightY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   531       calculate_bytes_to_=
fetch_required_to_hide_latency_params->swath_height_c =3D mode_lib->mp.Swat=
hHeightC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   532       for (k =3D 0; k < s=
->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   533               calculate_b=
ytes_to_fetch_required_to_hide_latency_params->latency_to_hide_us[k] =3D ut=
m_soc_bb->power_management_parameters.dram_clk_change_blackout_us;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   534       }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   535
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   536       /* outputs */
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   537       calculate_bytes_to_=
fetch_required_to_hide_latency_params->bytes_required_l =3D s->pstate_bytes=
_required_l[dml2_pstate_type_uclk];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   538       calculate_bytes_to_=
fetch_required_to_hide_latency_params->bytes_required_c =3D s->pstate_bytes=
_required_c[dml2_pstate_type_uclk];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   539
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   540       dcn5_calculate_byte=
s_to_fetch_required_to_hide_latency(calculate_bytes_to_fetch_required_to_hi=
de_latency_params);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   541
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   542       /* Excess VActive b=
andwidth required to fill DET */
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   543       dcn5_calculate_exce=
ss_vactive_bandwidth_required(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   544                       dis=
play_cfg,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   545                       s->=
num_active_planes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   546                       s->=
pstate_bytes_required_l[dml2_pstate_type_uclk],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   547                       s->=
pstate_bytes_required_c[dml2_pstate_type_uclk],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   548                       /* =
outputs */
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   549                       mod=
e_lib->mp.excess_vactive_fill_bw_l,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   550                       mod=
e_lib->mp.excess_vactive_fill_bw_c);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   551
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   552       mode_lib->mp.TripTo=
Memory =3D math_max2(mode_lib->mp.UrgentLatency, mode_lib->mp.TripToMemory)=
;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   553
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   554       for (k =3D 0; k < s=
->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   555               bool cursor=
_not_enough_urgent_latency_hiding =3D 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   556               double line=
_time_us;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   557
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   558               dcn5_calcul=
ate_cursor_req_attributes(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   559                       dis=
play_cfg->plane_descriptors[k].cursor.cursor_width,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   560                       dis=
play_cfg->plane_descriptors[k].cursor.cursor_bpp,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   561
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   562                       // =
output
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   563                       &s-=
>cursor_lines_per_chunk[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   564                       &s-=
>cursor_bytes_per_line[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   565                       &s-=
>cursor_bytes_per_chunk[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   566                       &s-=
>cursor_bytes[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   567
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   568               line_time_u=
s =3D display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].str=
eam_index].timing.h_total / ((double)display_cfg->stream_descriptors[displa=
y_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   569
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   570               dcn5_calcul=
ate_cursor_urgent_burst_factor(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   571                       mod=
e_lib->ip.cursor_buffer_size,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   572                       dis=
play_cfg->plane_descriptors[k].cursor.cursor_width,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   573                       s->=
cursor_bytes_per_chunk[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   574                       s->=
cursor_lines_per_chunk[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   575                       lin=
e_time_us,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   576                       mod=
e_lib->mp.UrgentLatency,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   577
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   578                       // =
output
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   579                       &mo=
de_lib->mp.UrgentBurstFactorCursor[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   580                       &cu=
rsor_not_enough_urgent_latency_hiding);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   581               mode_lib->m=
p.UrgentBurstFactorCursorPre[k] =3D mode_lib->mp.UrgentBurstFactorCursor[k]=
;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   582
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   583               dcn5_calcul=
ate_urgent_burst_factor(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   584                       &di=
splay_cfg->plane_descriptors[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   585                       mod=
e_lib->mp.swath_width_luma_ub[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   586                       mod=
e_lib->mp.swath_width_chroma_ub[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   587                       mod=
e_lib->mp.SwathHeightY[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   588                       mod=
e_lib->mp.SwathHeightC[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   589                       lin=
e_time_us,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   590                       mod=
e_lib->mp.UrgentLatency,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   591                       dis=
play_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   592                       dis=
play_cfg->plane_descriptors[k].composition.scaler_info.plane1.v_ratio,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   593                       mod=
e_lib->mp.BytePerPixelInDETY[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   594                       mod=
e_lib->mp.BytePerPixelInDETC[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   595                       mod=
e_lib->mp.DETBufferSizeY[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   596                       mod=
e_lib->mp.DETBufferSizeC[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   597
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   598                       /* =
output */
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   599                       &mo=
de_lib->mp.UrgentBurstFactorLuma[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   600                       &mo=
de_lib->mp.UrgentBurstFactorChroma[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   601                       &mo=
de_lib->mp.NotEnoughUrgentLatencyHiding[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   602
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   603               mode_lib->m=
p.NotEnoughUrgentLatencyHiding[k] =3D mode_lib->mp.NotEnoughUrgentLatencyHi=
ding[k] || cursor_not_enough_urgent_latency_hiding;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   604       }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   605
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   606       for (k =3D 0; k < s=
->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   607               s->MaxVStar=
tupLines[k] =3D dcn5_calculate_max_vstartup(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   608                       mod=
e_lib->ip.ptoi_supported,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   609                       mod=
e_lib->ip.vblank_nom_default_us,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   610                       &di=
splay_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_inde=
x].timing,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   611                       mod=
e_lib->mp.WritebackDelay[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   612               DML_LOG_VER=
BOSE("DML::%s: k=3D%u MaxVStartupLines =3D %u\n", __func__, k, s->MaxVStart=
upLines[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   613               DML_LOG_VER=
BOSE("DML::%s: k=3D%u WritebackDelay =3D %f\n", __func__, k, mode_lib->mp.W=
ritebackDelay[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   614       }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   615
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   616       s->immediate_flip_r=
equired =3D false;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   617       for (k =3D 0; k < s=
->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   618               s->immediat=
e_flip_required =3D s->immediate_flip_required || display_cfg->plane_descri=
ptors[k].immediate_flip;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   619       }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   620       DML_LOG_VERBOSE("DM=
L::%s: immediate_flip_required =3D %u\n", __func__, s->immediate_flip_requi=
red);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   621
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   622       {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   623               s->Destinat=
ionLineTimesForPrefetchLessThan2 =3D false;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   624               s->VRatioPr=
efetchMoreThanMax =3D false;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   625
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   626               DML_LOG_VER=
BOSE("DML::%s: Start one iteration of prefetch schedule evaluation\n", __fu=
nc__);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   627
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   628               for (k =3D =
0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   629                       str=
uct dml2_core_internal_DmlPipe *myPipe =3D &s->myPipe;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   630
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   631                       DML=
_LOG_VERBOSE("DML::%s: k=3D%d MaxVStartupLines =3D %u\n", __func__, k, s->M=
axVStartupLines[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   632                       mod=
e_lib->mp.TWait[k] =3D dcn5_calculate_t_wait(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   633                          =
     display_cfg->plane_descriptors[k].overrides.reserved_vblank_time_ns,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   634                          =
     mode_lib->mp.UrgentLatency,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   635                          =
     mode_lib->mp.TripToMemory,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   636                          =
     utm_soc_bb->power_management_parameters.g7_ppt_blackout_us,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   637                          =
     display_cfg->stream_descriptors->timing.drr_config.enabled);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   638
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   639                       myP=
ipe->Dppclk =3D mode_lib->mp.Dppclk[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   640                       myP=
ipe->Dispclk =3D mode_lib->mp.Dispclk;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   641                       myP=
ipe->PixelClock =3D ((double)display_cfg->stream_descriptors[display_cfg->p=
lane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   642                       myP=
ipe->DCFClkDeepSleep =3D mode_lib->mp.DCFCLKDeepSleep;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   643                       myP=
ipe->DPPPerSurface =3D mode_lib->mp.NoOfDPP[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   644                       myP=
ipe->ScalerEnabled =3D display_cfg->plane_descriptors[k].composition.scaler=
_info.enabled;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   645                       myP=
ipe->VRatio =3D display_cfg->plane_descriptors[k].composition.scaler_info.p=
lane0.v_ratio;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   646                       myP=
ipe->VRatioChroma =3D display_cfg->plane_descriptors[k].composition.scaler_=
info.plane1.v_ratio;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   647                       myP=
ipe->VTaps =3D display_cfg->plane_descriptors[k].composition.scaler_info.pl=
ane0.v_taps;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   648                       myP=
ipe->VTapsChroma =3D display_cfg->plane_descriptors[k].composition.scaler_i=
nfo.plane1.v_taps;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   649                       myP=
ipe->RotationAngle =3D display_cfg->plane_descriptors[k].composition.rotati=
on_angle;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   650                       myP=
ipe->mirrored =3D display_cfg->plane_descriptors[k].composition.mirrored;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   651                       myP=
ipe->BlockWidth256BytesY =3D mode_lib->mp.Read256BlockWidthY[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   652                       myP=
ipe->BlockHeight256BytesY =3D mode_lib->mp.Read256BlockHeightY[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   653                       myP=
ipe->BlockWidth256BytesC =3D mode_lib->mp.Read256BlockWidthC[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   654                       myP=
ipe->BlockHeight256BytesC =3D mode_lib->mp.Read256BlockHeightC[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   655                       myP=
ipe->InterlaceEnable =3D display_cfg->stream_descriptors[display_cfg->plane=
_descriptors[k].stream_index].timing.interlaced;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   656                       myP=
ipe->NumberOfCursors =3D display_cfg->plane_descriptors[k].cursor.num_curso=
rs;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   657                       myP=
ipe->VBlank =3D display_cfg->stream_descriptors[display_cfg->plane_descript=
ors[k].stream_index].timing.v_total - display_cfg->stream_descriptors[displ=
ay_cfg->plane_descriptors[k].stream_index].timing.v_active;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   658                       myP=
ipe->HTotal =3D display_cfg->stream_descriptors[display_cfg->plane_descript=
ors[k].stream_index].timing.h_total;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   659                       myP=
ipe->HActive =3D display_cfg->stream_descriptors[display_cfg->plane_descrip=
tors[k].stream_index].timing.h_active;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   660                       myP=
ipe->DCCEnable =3D display_cfg->plane_descriptors[k].surface.dcc.enable;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   661                       myP=
ipe->ODMMode =3D mode_lib->mp.ODMMode[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   662                       myP=
ipe->SourcePixelFormat =3D display_cfg->plane_descriptors[k].pixel_format;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   663                       myP=
ipe->BytePerPixelY =3D mode_lib->mp.BytePerPixelY[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   664                       myP=
ipe->BytePerPixelC =3D mode_lib->mp.BytePerPixelC[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   665                       myP=
ipe->ProgressiveToInterlaceUnitInOPP =3D mode_lib->ip.ptoi_supported;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   666                       DML=
_LOG_VERBOSE("DML::%s: Calling CalculatePrefetchSchedule for k=3D%u\n", __f=
unc__, k);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   667
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   668                       Cal=
culatePrefetchSchedule_params->display_cfg =3D display_cfg;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   669                       Cal=
culatePrefetchSchedule_params->HostVMInefficiencyFactor =3D s->HostVMIneffi=
ciencyFactorPrefetch;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   670                       Cal=
culatePrefetchSchedule_params->myPipe =3D myPipe;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   671                       Cal=
culatePrefetchSchedule_params->DSCDelay =3D mode_lib->mp.DSCDelay[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   672                       Cal=
culatePrefetchSchedule_params->DPPCLKDelaySubtotalPlusCNVCFormater =3D mode=
_lib->ip.dppclk_delay_subtotal + mode_lib->ip.dppclk_delay_cnvc_formatter;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   673                       Cal=
culatePrefetchSchedule_params->DPPCLKDelaySCL =3D mode_lib->ip.dppclk_delay=
_scl;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   674                       Cal=
culatePrefetchSchedule_params->DPPCLKDelaySCLLBOnly =3D mode_lib->ip.dppclk=
_delay_scl_lb_only;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   675                       Cal=
culatePrefetchSchedule_params->DPPCLKDelayCNVCCursor =3D mode_lib->ip.dppcl=
k_delay_cnvc_cursor;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   676                       Cal=
culatePrefetchSchedule_params->DISPCLKDelaySubtotal =3D mode_lib->ip.dispcl=
k_delay_subtotal;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   677                       Cal=
culatePrefetchSchedule_params->DPP_RECOUT_WIDTH =3D (unsigned int)(mode_lib=
->mp.SwathWidthY[k] / display_cfg->plane_descriptors[k].composition.scaler_=
info.plane0.h_ratio);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   678                       Cal=
culatePrefetchSchedule_params->OutputFormat =3D display_cfg->stream_descrip=
tors[display_cfg->plane_descriptors[k].stream_index].output.output_format;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   679                       Cal=
culatePrefetchSchedule_params->MaxInterDCNTileRepeaters =3D mode_lib->ip.ma=
x_inter_dcn_tile_repeaters;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   680                       Cal=
culatePrefetchSchedule_params->VStartup =3D s->MaxVStartupLines[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   681                       Cal=
culatePrefetchSchedule_params->HostVMMinPageSize =3D display_cfg->plane_des=
criptors[k].overrides.hostvm_min_page_size_kbytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   682                       Cal=
culatePrefetchSchedule_params->DynamicMetadataEnable =3D display_cfg->plane=
_descriptors[k].dynamic_meta_data.enable;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   683                       Cal=
culatePrefetchSchedule_params->DynamicMetadataVMEnabled =3D mode_lib->ip.dy=
namic_metadata_vm_enabled;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   684                       Cal=
culatePrefetchSchedule_params->DynamicMetadataLinesBeforeActiveRequired =3D=
 display_cfg->plane_descriptors[k].dynamic_meta_data.lines_before_active_re=
quired;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   685                       Cal=
culatePrefetchSchedule_params->DynamicMetadataTransmittedBytes =3D display_=
cfg->plane_descriptors[k].dynamic_meta_data.transmitted_bytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   686                       Cal=
culatePrefetchSchedule_params->ExtraLatencyPrefetch =3D mode_lib->mp.ExtraL=
atencyPrefetch;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   687                       Cal=
culatePrefetchSchedule_params->TCalc =3D mode_lib->mp.TCalc;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   688                       Cal=
culatePrefetchSchedule_params->vm_bytes =3D mode_lib->mp.vm_bytes[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   689                       Cal=
culatePrefetchSchedule_params->PixelPTEBytesPerRow =3D mode_lib->mp.PixelPT=
EBytesPerRow[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   690                       Cal=
culatePrefetchSchedule_params->PrefetchSourceLinesY =3D mode_lib->mp.Prefet=
chSourceLinesY[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   691                       Cal=
culatePrefetchSchedule_params->VInitPreFillY =3D mode_lib->mp.VInitPreFillY=
[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   692                       Cal=
culatePrefetchSchedule_params->MaxNumSwathY =3D mode_lib->mp.MaxNumSwathY[k=
];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   693                       Cal=
culatePrefetchSchedule_params->PrefetchSourceLinesC =3D mode_lib->mp.Prefet=
chSourceLinesC[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   694                       Cal=
culatePrefetchSchedule_params->VInitPreFillC =3D mode_lib->mp.VInitPreFillC=
[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   695                       Cal=
culatePrefetchSchedule_params->MaxNumSwathC =3D mode_lib->mp.MaxNumSwathC[k=
];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   696                       Cal=
culatePrefetchSchedule_params->swath_width_luma_ub =3D mode_lib->mp.swath_w=
idth_luma_ub[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   697                       Cal=
culatePrefetchSchedule_params->swath_width_chroma_ub =3D mode_lib->mp.swath=
_width_chroma_ub[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   698                       Cal=
culatePrefetchSchedule_params->SwathHeightY =3D mode_lib->mp.SwathHeightY[k=
];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   699                       Cal=
culatePrefetchSchedule_params->SwathHeightC =3D mode_lib->mp.SwathHeightC[k=
];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   700                       Cal=
culatePrefetchSchedule_params->TWait =3D mode_lib->mp.TWait[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   701                       Cal=
culatePrefetchSchedule_params->Ttrip =3D mode_lib->mp.TripToMemory;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   702                       Cal=
culatePrefetchSchedule_params->Turg =3D mode_lib->mp.UrgentLatency;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   703                       Cal=
culatePrefetchSchedule_params->setup_for_tdlut =3D display_cfg->plane_descr=
iptors[k].tdlut.setup_for_tdlut;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   704                       Cal=
culatePrefetchSchedule_params->tdlut_pte_bytes_per_frame =3D s->tdlut_pte_b=
ytes_per_frame[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   705                       Cal=
culatePrefetchSchedule_params->tdlut_bytes_per_frame =3D s->tdlut_bytes_per=
_frame[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   706                       Cal=
culatePrefetchSchedule_params->tdlut_opt_time =3D s->tdlut_opt_time[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   707                       Cal=
culatePrefetchSchedule_params->tdlut_drain_time =3D s->tdlut_drain_time[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   708                       Cal=
culatePrefetchSchedule_params->num_cursors =3D (display_cfg->plane_descript=
ors[k].cursor.cursor_width > 0);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   709                       Cal=
culatePrefetchSchedule_params->cursor_bytes_per_chunk =3D s->cursor_bytes_p=
er_chunk[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   710                       Cal=
culatePrefetchSchedule_params->cursor_bytes_per_line =3D s->cursor_bytes_pe=
r_line[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   711                       Cal=
culatePrefetchSchedule_params->dcc_enable =3D display_cfg->plane_descriptor=
s[k].surface.dcc.enable;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   712                       Cal=
culatePrefetchSchedule_params->mrq_present =3D mode_lib->ip.dcn_mrq_present=
;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   713                       Cal=
culatePrefetchSchedule_params->meta_row_bytes =3D mode_lib->mp.meta_row_byt=
es[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   714
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   715                       // =
output
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   716                       Cal=
culatePrefetchSchedule_params->DSTXAfterScaler =3D &mode_lib->mp.DSTXAfterS=
caler[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   717                       Cal=
culatePrefetchSchedule_params->DSTYAfterScaler =3D &mode_lib->mp.DSTYAfterS=
caler[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   718                       Cal=
culatePrefetchSchedule_params->dst_y_prefetch =3D &mode_lib->mp.dst_y_prefe=
tch[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   719                       Cal=
culatePrefetchSchedule_params->dst_y_per_vm_vblank =3D &mode_lib->mp.dst_y_=
per_vm_vblank[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   720                       Cal=
culatePrefetchSchedule_params->dst_y_per_row_vblank =3D &mode_lib->mp.dst_y=
_per_row_vblank[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   721                       Cal=
culatePrefetchSchedule_params->VRatioPrefetchY =3D &mode_lib->mp.VRatioPref=
etchY[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   722                       Cal=
culatePrefetchSchedule_params->VRatioPrefetchC =3D &mode_lib->mp.VRatioPref=
etchC[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   723                       Cal=
culatePrefetchSchedule_params->RequiredPrefetchPixelDataBWLuma =3D &mode_li=
b->mp.RequiredPrefetchPixelDataBWLuma[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   724                       Cal=
culatePrefetchSchedule_params->RequiredPrefetchPixelDataBWChroma =3D &mode_=
lib->mp.RequiredPrefetchPixelDataBWChroma[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   725                       Cal=
culatePrefetchSchedule_params->NotEnoughTimeForDynamicMetadata =3D &mode_li=
b->mp.NotEnoughTimeForDynamicMetadata[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   726                       Cal=
culatePrefetchSchedule_params->Tno_bw =3D &mode_lib->mp.Tno_bw[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   727                       Cal=
culatePrefetchSchedule_params->Tno_bw_flip =3D &mode_lib->mp.Tno_bw_flip[k]=
;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   728                       Cal=
culatePrefetchSchedule_params->prefetch_vmrow_bw =3D &mode_lib->mp.prefetch=
_vmrow_bw[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   729                       Cal=
culatePrefetchSchedule_params->Tdmdl_vm =3D &mode_lib->mp.Tdmdl_vm[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   730                       Cal=
culatePrefetchSchedule_params->Tdmdl =3D &mode_lib->mp.Tdmdl[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   731                       Cal=
culatePrefetchSchedule_params->TSetup =3D &mode_lib->mp.TSetup[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   732                       Cal=
culatePrefetchSchedule_params->Tvm_trips =3D &s->Tvm_trips[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   733                       Cal=
culatePrefetchSchedule_params->Tr0_trips =3D &s->Tr0_trips[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   734                       Cal=
culatePrefetchSchedule_params->Tvm_trips_flip =3D &s->Tvm_trips_flip[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   735                       Cal=
culatePrefetchSchedule_params->Tr0_trips_flip =3D &s->Tr0_trips_flip[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   736                       Cal=
culatePrefetchSchedule_params->Tvm_trips_flip_rounded =3D &s->Tvm_trips_fli=
p_rounded[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   737                       Cal=
culatePrefetchSchedule_params->Tr0_trips_flip_rounded =3D &s->Tr0_trips_fli=
p_rounded[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   738                       Cal=
culatePrefetchSchedule_params->VUpdateOffsetPix =3D &mode_lib->mp.VUpdateOf=
fsetPix[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   739                       Cal=
culatePrefetchSchedule_params->VUpdateWidthPix =3D &mode_lib->mp.VUpdateWid=
thPix[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   740                       Cal=
culatePrefetchSchedule_params->VReadyOffsetPix =3D &mode_lib->mp.VReadyOffs=
etPix[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   741                       Cal=
culatePrefetchSchedule_params->prefetch_cursor_bw =3D &mode_lib->mp.prefetc=
h_cursor_bw[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   742                       Cal=
culatePrefetchSchedule_params->prefetch_sw_bytes =3D &s->prefetch_sw_bytes[=
k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   743                       Cal=
culatePrefetchSchedule_params->Tpre_rounded =3D &s->Tpre_rounded[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   744                       Cal=
culatePrefetchSchedule_params->Tpre_oto =3D &s->Tpre_oto[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   745
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   746                       mod=
e_lib->mp.NoTimeToPrefetch[k] =3D dcn5_calculate_prefetch_schedule(&mode_li=
b->scratch, CalculatePrefetchSchedule_params);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   747                       DML=
_LOG_VERBOSE("DML::%s: k=3D%0u NoTimeToPrefetch=3D%0d\n", __func__, k, mode=
_lib->mp.NoTimeToPrefetch[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   748                       mod=
e_lib->mp.VStartupMin[k] =3D s->MaxVStartupLines[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   749               } // for k
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   750
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   751               mode_lib->m=
p.PrefetchModeSupported =3D true;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   752               for (k =3D =
0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   753                       if =
(mode_lib->mp.NoTimeToPrefetch[k] =3D=3D true ||
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   754                          =
     mode_lib->mp.NotEnoughTimeForDynamicMetadata[k] ||
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   755                          =
     mode_lib->mp.DSTYAfterScaler[k] > 8) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   756                          =
     DML_LOG_VERBOSE("DML::%s: k=3D%u, NoTimeToPrefetch =3D %0d\n", __func_=
_, k, mode_lib->mp.NoTimeToPrefetch[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   757                          =
     DML_LOG_VERBOSE("DML::%s: k=3D%u, NotEnoughTimeForDynamicMetadata=3D%u=
\n", __func__, k, mode_lib->mp.NotEnoughTimeForDynamicMetadata[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   758                          =
     DML_LOG_VERBOSE("DML::%s: k=3D%u, DSTYAfterScaler=3D%u (should be <=3D=
 0)\n", __func__, k, mode_lib->mp.DSTYAfterScaler[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   759                          =
     mode_lib->mp.PrefetchModeSupported =3D false;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   760                       }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   761                       if =
(mode_lib->mp.dst_y_prefetch[k] < 2)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   762                          =
     s->DestinationLineTimesForPrefetchLessThan2 =3D true;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   763
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   764                       if =
(mode_lib->mp.VRatioPrefetchY[k] > __DML2_CALCS_MAX_VRATIO_PRE__ ||
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   765                          =
     mode_lib->mp.VRatioPrefetchC[k] > __DML2_CALCS_MAX_VRATIO_PRE__) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   766                          =
     s->VRatioPrefetchMoreThanMax =3D true;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   767                          =
     DML_LOG_VERBOSE("DML::%s: k=3D%d, VRatioPrefetchY=3D%f (should not be =
< %f)\n", __func__, k, mode_lib->mp.VRatioPrefetchY[k], __DML2_CALCS_MAX_VR=
ATIO_PRE__);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   768                          =
     DML_LOG_VERBOSE("DML::%s: k=3D%d, VRatioPrefetchC=3D%f (should not be =
< %f)\n", __func__, k, mode_lib->mp.VRatioPrefetchC[k], __DML2_CALCS_MAX_VR=
ATIO_PRE__);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   769                          =
     DML_LOG_VERBOSE("DML::%s: VRatioPrefetchMoreThanMax =3D %u\n", __func_=
_, s->VRatioPrefetchMoreThanMax);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   770                       }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   771
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   772                       if =
(mode_lib->mp.NotEnoughUrgentLatencyHiding[k]) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   773                          =
     DML_LOG_VERBOSE("DML::%s: k=3D%u, NotEnoughUrgentLatencyHiding =3D %u\=
n", __func__, k, mode_lib->mp.NotEnoughUrgentLatencyHiding[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   774                          =
     mode_lib->mp.PrefetchModeSupported =3D false;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   775                       }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   776               }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   777
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   778               if (s->VRat=
ioPrefetchMoreThanMax =3D=3D true || s->DestinationLineTimesForPrefetchLess=
Than2 =3D=3D true) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   779                       DML=
_LOG_VERBOSE("DML::%s: VRatioPrefetchMoreThanMax =3D %u\n", __func__, s->VR=
atioPrefetchMoreThanMax);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   780                       DML=
_LOG_VERBOSE("DML::%s: DestinationLineTimesForPrefetchLessThan2 =3D %u\n", =
__func__, s->DestinationLineTimesForPrefetchLessThan2);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   781                       mod=
e_lib->mp.PrefetchModeSupported =3D false;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   782               }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   783
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   784               DML_LOG_VER=
BOSE("DML::%s: Prefetch schedule is %sOK at vstartup =3D %u\n", __func__,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   785                       mod=
e_lib->mp.PrefetchModeSupported ? "" : "NOT ", CalculatePrefetchSchedule_pa=
rams->VStartup);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   786
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   787               // Prefetch=
 schedule OK, now check prefetch bw
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   788               if (mode_li=
b->mp.PrefetchModeSupported =3D=3D true) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   789                       for=
 (k =3D 0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   790                          =
     double line_time_us =3D display_cfg->stream_descriptors[display_cfg->p=
lane_descriptors[k].stream_index].timing.h_total /
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   791                          =
             ((double)display_cfg->stream_descriptors[display_cfg->plane_de=
scriptors[k].stream_index].timing.pixel_clock_khz / 1000);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   792                          =
     dcn5_calculate_urgent_burst_factor(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   793                          =
             &display_cfg->plane_descriptors[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   794                          =
             mode_lib->mp.swath_width_luma_ub[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   795                          =
             mode_lib->mp.swath_width_chroma_ub[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   796                          =
             mode_lib->mp.SwathHeightY[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   797                          =
             mode_lib->mp.SwathHeightC[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   798                          =
             line_time_us,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   799                          =
             mode_lib->mp.UrgentLatency,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   800                          =
             mode_lib->mp.VRatioPrefetchY[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   801                          =
             mode_lib->mp.VRatioPrefetchC[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   802                          =
             mode_lib->mp.BytePerPixelInDETY[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   803                          =
             mode_lib->mp.BytePerPixelInDETC[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   804                          =
             mode_lib->mp.DETBufferSizeY[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   805                          =
             mode_lib->mp.DETBufferSizeC[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   806                          =
             /* Output */
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   807                          =
             &mode_lib->mp.UrgentBurstFactorLumaPre[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   808                          =
             &mode_lib->mp.UrgentBurstFactorChromaPre[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   809                          =
             &mode_lib->mp.NotEnoughUrgentLatencyHidingPre[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   810
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   811                          =
     DML_LOG_VERBOSE("DML::%s: k=3D%0u DPPPerSurface=3D%u\n", __func__, k, =
mode_lib->mp.NoOfDPP[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   812                          =
     DML_LOG_VERBOSE("DML::%s: k=3D%0u UrgentBurstFactorLuma=3D%f\n", __fun=
c__, k, mode_lib->mp.UrgentBurstFactorLuma[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   813                          =
     DML_LOG_VERBOSE("DML::%s: k=3D%0u UrgentBurstFactorChroma=3D%f\n", __f=
unc__, k, mode_lib->mp.UrgentBurstFactorChroma[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   814                          =
     DML_LOG_VERBOSE("DML::%s: k=3D%0u UrgentBurstFactorLumaPre=3D%f\n", __=
func__, k, mode_lib->mp.UrgentBurstFactorLumaPre[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   815                          =
     DML_LOG_VERBOSE("DML::%s: k=3D%0u UrgentBurstFactorChromaPre=3D%f\n", =
__func__, k, mode_lib->mp.UrgentBurstFactorChromaPre[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   816
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   817                          =
     DML_LOG_VERBOSE("DML::%s: k=3D%0u VRatioPrefetchY=3D%f\n", __func__, k=
, mode_lib->mp.VRatioPrefetchY[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   818                          =
     DML_LOG_VERBOSE("DML::%s: k=3D%0u VRatioY=3D%f\n", __func__, k, displa=
y_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   819
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   820                          =
     DML_LOG_VERBOSE("DML::%s: k=3D%0u prefetch_vmrow_bw=3D%f\n", __func__,=
 k, mode_lib->mp.prefetch_vmrow_bw[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   821                          =
     DML_LOG_VERBOSE("DML::%s: k=3D%0u vactive_sw_bw_l=3D%f\n", __func__, k=
, mode_lib->mp.vactive_sw_bw_l[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   822                          =
     DML_LOG_VERBOSE("DML::%s: k=3D%0u vactive_sw_bw_c=3D%f\n", __func__, k=
, mode_lib->mp.vactive_sw_bw_c[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   823                          =
     DML_LOG_VERBOSE("DML::%s: k=3D%0u cursor_bw=3D%f\n", __func__, k, mode=
_lib->mp.cursor_bw[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   824                          =
     DML_LOG_VERBOSE("DML::%s: k=3D%0u dpte_row_bw=3D%f\n", __func__, k, mo=
de_lib->mp.dpte_row_bw[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   825                          =
     DML_LOG_VERBOSE("DML::%s: k=3D%0u meta_row_bw=3D%f\n", __func__, k, mo=
de_lib->mp.meta_row_bw[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   826                          =
     DML_LOG_VERBOSE("DML::%s: k=3D%0u RequiredPrefetchPixelDataBWLuma=3D%f=
\n", __func__, k, mode_lib->mp.RequiredPrefetchPixelDataBWLuma[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   827                          =
     DML_LOG_VERBOSE("DML::%s: k=3D%0u RequiredPrefetchPixelDataBWChroma=3D=
%f\n", __func__, k, mode_lib->mp.RequiredPrefetchPixelDataBWChroma[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   828                          =
     DML_LOG_VERBOSE("DML::%s: k=3D%0u prefetch_cursor_bw=3D%f\n", __func__=
, k, mode_lib->mp.prefetch_cursor_bw[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   829                       }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   830
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   831                       for=
 (k =3D 0; k <=3D s->num_active_planes - 1; k++)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   832                          =
     mode_lib->mp.final_flip_bw[k] =3D 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   833
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   834                       cal=
culate_peak_bandwidth_params->urg_vactive_bandwidth_required =3D mode_lib->=
mp.urg_vactive_bandwidth_required;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   835                       cal=
culate_peak_bandwidth_params->urg_bandwidth_required =3D mode_lib->mp.urg_b=
andwidth_required;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   836                       cal=
culate_peak_bandwidth_params->urg_bandwidth_required_qual =3D mode_lib->mp.=
urg_bandwidth_required_qual;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   837                       cal=
culate_peak_bandwidth_params->non_urg_bandwidth_required =3D mode_lib->mp.n=
on_urg_bandwidth_required;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   838                       cal=
culate_peak_bandwidth_params->surface_avg_vactive_required_bw =3D s->surfac=
e_dummy_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   839                       cal=
culate_peak_bandwidth_params->surface_peak_required_bw =3D s->surface_dummy=
_bw0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   840
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   841                       cal=
culate_peak_bandwidth_params->display_cfg =3D display_cfg;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   842                       cal=
culate_peak_bandwidth_params->inc_flip_bw =3D 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   843                       cal=
culate_peak_bandwidth_params->num_active_planes =3D s->num_active_planes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   844                       cal=
culate_peak_bandwidth_params->num_of_dpp =3D mode_lib->mp.NoOfDPP;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   845                       cal=
culate_peak_bandwidth_params->dcc_dram_bw_nom_overhead_factor_p0 =3D mode_l=
ib->mp.dcc_dram_bw_nom_overhead_factor_p0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   846                       cal=
culate_peak_bandwidth_params->dcc_dram_bw_nom_overhead_factor_p1 =3D mode_l=
ib->mp.dcc_dram_bw_nom_overhead_factor_p1;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   847                       cal=
culate_peak_bandwidth_params->dcc_dram_bw_pref_overhead_factor_p0 =3D mode_=
lib->mp.dcc_dram_bw_pref_overhead_factor_p0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   848                       cal=
culate_peak_bandwidth_params->dcc_dram_bw_pref_overhead_factor_p1 =3D mode_=
lib->mp.dcc_dram_bw_pref_overhead_factor_p1;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   849
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   850                       cal=
culate_peak_bandwidth_params->surface_read_bandwidth_l =3D mode_lib->mp.vac=
tive_sw_bw_l;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   851                       cal=
culate_peak_bandwidth_params->surface_read_bandwidth_c =3D mode_lib->mp.vac=
tive_sw_bw_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   852                       cal=
culate_peak_bandwidth_params->prefetch_bandwidth_l =3D mode_lib->mp.Require=
dPrefetchPixelDataBWLuma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   853                       cal=
culate_peak_bandwidth_params->prefetch_bandwidth_c =3D mode_lib->mp.Require=
dPrefetchPixelDataBWChroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   854                       cal=
culate_peak_bandwidth_params->excess_vactive_fill_bw_l =3D mode_lib->mp.exc=
ess_vactive_fill_bw_l;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   855                       cal=
culate_peak_bandwidth_params->excess_vactive_fill_bw_c =3D mode_lib->mp.exc=
ess_vactive_fill_bw_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   856                       cal=
culate_peak_bandwidth_params->cursor_bw =3D mode_lib->mp.cursor_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   857                       cal=
culate_peak_bandwidth_params->dpte_row_bw =3D mode_lib->mp.dpte_row_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   858                       cal=
culate_peak_bandwidth_params->meta_row_bw =3D mode_lib->mp.meta_row_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   859                       cal=
culate_peak_bandwidth_params->prefetch_cursor_bw =3D mode_lib->mp.prefetch_=
cursor_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   860                       cal=
culate_peak_bandwidth_params->prefetch_vmrow_bw =3D mode_lib->mp.prefetch_v=
mrow_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   861                       cal=
culate_peak_bandwidth_params->flip_bw =3D mode_lib->mp.final_flip_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   862                       cal=
culate_peak_bandwidth_params->urgent_burst_factor_l =3D mode_lib->mp.Urgent=
BurstFactorLuma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   863                       cal=
culate_peak_bandwidth_params->urgent_burst_factor_c =3D mode_lib->mp.Urgent=
BurstFactorChroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   864                       cal=
culate_peak_bandwidth_params->urgent_burst_factor_cursor =3D mode_lib->mp.U=
rgentBurstFactorCursor;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   865                       cal=
culate_peak_bandwidth_params->urgent_burst_factor_prefetch_l =3D mode_lib->=
mp.UrgentBurstFactorLumaPre;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   866                       cal=
culate_peak_bandwidth_params->urgent_burst_factor_prefetch_c =3D mode_lib->=
mp.UrgentBurstFactorChromaPre;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   867                       cal=
culate_peak_bandwidth_params->urgent_burst_factor_prefetch_cursor =3D mode_=
lib->mp.UrgentBurstFactorCursorPre;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   868
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   869                       dcn=
5_calculate_peak_bandwidth_required(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   870                          =
             &mode_lib->scratch,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   871                          =
             calculate_peak_bandwidth_params);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   872
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   873                       // =
Check urg peak bandwidth against available urg bw
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   874                       // =
check at SDP and DRAM, for all soc states (Sys Active)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   875                       dcn=
5_check_urgent_bandwidth_support(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   876                          =
     &mode_lib->mp.FractionOfUrgentBandwidth, // double* frac_urg_bandwidth
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   877                          =
     &mode_lib->mp.PrefetchModeSupported, // prefetch bw ok
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   878
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   879                          =
     **mode_lib->mp.non_urg_bandwidth_required,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   880                          =
     **mode_lib->mp.urg_bandwidth_required,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   881                          =
     mode_lib->mp.dram_bw_mbps);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   882
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   883                       if =
(!mode_lib->mp.PrefetchModeSupported)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   884                          =
     DML_LOG_VERBOSE("DML::%s: Bandwidth not sufficient for prefetch!\n", _=
_func__);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   885
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   886                       for=
 (k =3D 0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   887                          =
     if (mode_lib->mp.NotEnoughUrgentLatencyHidingPre[k]) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   888                          =
             DML_LOG_VERBOSE("DML::%s: k=3D%u, NotEnoughUrgentLatencyHiding=
Pre =3D %u\n", __func__, k, mode_lib->mp.NotEnoughUrgentLatencyHidingPre[k]=
);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   889                          =
             mode_lib->mp.PrefetchModeSupported =3D false;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   890                          =
     }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   891                       }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   892               } // prefet=
ch schedule ok
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   893
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   894               // Prefetch=
 schedule and prefetch bw ok, now check flip bw
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   895               if (mode_li=
b->mp.PrefetchModeSupported =3D=3D true) { // prefetch schedule and prefetc=
h bw ok, now check flip bw
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   896
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   897                       mod=
e_lib->mp.BandwidthAvailableForImmediateFlip =3D
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   898                          =
     dcn5_get_bandwidth_available_for_immediate_flip(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   899                          =
             **mode_lib->mp.urg_bandwidth_required_qual, // no flip
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   900                          =
             mode_lib->mp.dram_bw_mbps);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   901
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   902                       mod=
e_lib->mp.TotImmediateFlipBytes =3D 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   903
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   904                       for=
 (k =3D 0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   905                          =
     if (display_cfg->plane_descriptors[k].immediate_flip) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   906                          =
             s->per_pipe_flip_bytes[k] =3D  dcn5_get_pipe_flip_bytes(s->Hos=
tVMInefficiencyFactor,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   907                          =
                                                             mode_lib->mp.v=
m_bytes[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   908                          =
                                                             mode_lib->mp.P=
ixelPTEBytesPerRow[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   909                          =
                                                             mode_lib->mp.m=
eta_row_bytes[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   910                          =
     } else {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   911                          =
             s->per_pipe_flip_bytes[k] =3D 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   912                          =
     }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   913                          =
     mode_lib->mp.TotImmediateFlipBytes +=3D s->per_pipe_flip_bytes[k] * mo=
de_lib->mp.NoOfDPP[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   914                          =
     DML_LOG_VERBOSE("DML::%s: k =3D %u\n", __func__, k);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   915                          =
     DML_LOG_VERBOSE("DML::%s: DPPPerSurface =3D %u\n", __func__, mode_lib-=
>mp.NoOfDPP[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   916                          =
     DML_LOG_VERBOSE("DML::%s: vm_bytes =3D %u\n", __func__, mode_lib->mp.v=
m_bytes[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   917                          =
     DML_LOG_VERBOSE("DML::%s: PixelPTEBytesPerRow =3D %u\n", __func__, mod=
e_lib->mp.PixelPTEBytesPerRow[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   918                          =
     DML_LOG_VERBOSE("DML::%s: meta_row_bytes =3D %u\n", __func__, mode_lib=
->mp.meta_row_bytes[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   919                          =
     DML_LOG_VERBOSE("DML::%s: TotImmediateFlipBytes =3D %u\n", __func__, m=
ode_lib->mp.TotImmediateFlipBytes);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   920                       }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   921                       for=
 (k =3D 0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   922                          =
     dcn5_calculate_flip_schedule(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   923                          =
             &mode_lib->scratch,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   924                          =
             display_cfg->plane_descriptors[k].immediate_flip,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   925                          =
             0, // use_lb_flip_bw
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   926                          =
             s->HostVMInefficiencyFactor,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   927                          =
             s->Tvm_trips_flip[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   928                          =
             s->Tr0_trips_flip[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   929                          =
             s->Tvm_trips_flip_rounded[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   930                          =
             s->Tr0_trips_flip_rounded[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   931                          =
             display_cfg->gpuvm_enable,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   932                          =
             mode_lib->mp.vm_bytes[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   933                          =
             mode_lib->mp.PixelPTEBytesPerRow[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   934                          =
             mode_lib->mp.BandwidthAvailableForImmediateFlip,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   935                          =
             mode_lib->mp.TotImmediateFlipBytes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   936                          =
             display_cfg->plane_descriptors[k].pixel_format,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   937                          =
             display_cfg->stream_descriptors[display_cfg->plane_descriptors=
[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors=
[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1=
000),
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   938                          =
             display_cfg->plane_descriptors[k].composition.scaler_info.plan=
e0.v_ratio,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   939                          =
             display_cfg->plane_descriptors[k].composition.scaler_info.plan=
e1.v_ratio,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   940                          =
             mode_lib->mp.Tno_bw[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   941                          =
             mode_lib->mp.dpte_row_height[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   942                          =
             mode_lib->mp.dpte_row_height_chroma[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   943                          =
             mode_lib->mp.use_one_row_for_frame_flip[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   944                          =
             mode_lib->ip.max_flip_time_us,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   945                          =
             mode_lib->ip.max_flip_time_lines,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   946                          =
             s->per_pipe_flip_bytes[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   947                          =
             mode_lib->mp.meta_row_bytes[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   948                          =
             mode_lib->mp.meta_row_height[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   949                          =
             mode_lib->mp.meta_row_height_chroma[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   950                          =
             mode_lib->ip.dcn_mrq_present && display_cfg->plane_descriptors=
[k].surface.dcc.enable,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   951
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   952                          =
             // Output
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   953                          =
             &mode_lib->mp.dst_y_per_vm_flip[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   954                          =
             &mode_lib->mp.dst_y_per_row_flip[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   955                          =
             &mode_lib->mp.final_flip_bw[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   956                          =
             &mode_lib->mp.ImmediateFlipSupportedForPipe[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   957                       }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   958
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   959                       cal=
culate_peak_bandwidth_params->urg_vactive_bandwidth_required =3D s->dummy_b=
w;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   960                       cal=
culate_peak_bandwidth_params->urg_bandwidth_required =3D mode_lib->mp.urg_b=
andwidth_required_flip;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   961                       cal=
culate_peak_bandwidth_params->urg_bandwidth_required_qual =3D s->dummy_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   962                       cal=
culate_peak_bandwidth_params->non_urg_bandwidth_required =3D mode_lib->mp.n=
on_urg_bandwidth_required_flip;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   963                       cal=
culate_peak_bandwidth_params->surface_avg_vactive_required_bw =3D s->surfac=
e_dummy_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   964                       cal=
culate_peak_bandwidth_params->surface_peak_required_bw =3D s->surface_dummy=
_bw0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   965
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   966                       cal=
culate_peak_bandwidth_params->display_cfg =3D display_cfg;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   967                       cal=
culate_peak_bandwidth_params->inc_flip_bw =3D 1;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   968                       cal=
culate_peak_bandwidth_params->num_active_planes =3D s->num_active_planes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   969                       cal=
culate_peak_bandwidth_params->num_of_dpp =3D mode_lib->mp.NoOfDPP;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   970                       cal=
culate_peak_bandwidth_params->dcc_dram_bw_nom_overhead_factor_p0 =3D mode_l=
ib->mp.dcc_dram_bw_nom_overhead_factor_p0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   971                       cal=
culate_peak_bandwidth_params->dcc_dram_bw_nom_overhead_factor_p1 =3D mode_l=
ib->mp.dcc_dram_bw_nom_overhead_factor_p1;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   972                       cal=
culate_peak_bandwidth_params->dcc_dram_bw_pref_overhead_factor_p0 =3D mode_=
lib->mp.dcc_dram_bw_pref_overhead_factor_p0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   973                       cal=
culate_peak_bandwidth_params->dcc_dram_bw_pref_overhead_factor_p1 =3D mode_=
lib->mp.dcc_dram_bw_pref_overhead_factor_p1;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   974
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   975                       cal=
culate_peak_bandwidth_params->surface_read_bandwidth_l =3D mode_lib->mp.vac=
tive_sw_bw_l;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   976                       cal=
culate_peak_bandwidth_params->surface_read_bandwidth_c =3D mode_lib->mp.vac=
tive_sw_bw_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   977                       cal=
culate_peak_bandwidth_params->prefetch_bandwidth_l =3D mode_lib->mp.Require=
dPrefetchPixelDataBWLuma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   978                       cal=
culate_peak_bandwidth_params->prefetch_bandwidth_c =3D mode_lib->mp.Require=
dPrefetchPixelDataBWChroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   979                       cal=
culate_peak_bandwidth_params->excess_vactive_fill_bw_l =3D mode_lib->mp.exc=
ess_vactive_fill_bw_l;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   980                       cal=
culate_peak_bandwidth_params->excess_vactive_fill_bw_c =3D mode_lib->mp.exc=
ess_vactive_fill_bw_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   981                       cal=
culate_peak_bandwidth_params->cursor_bw =3D mode_lib->mp.cursor_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   982                       cal=
culate_peak_bandwidth_params->dpte_row_bw =3D mode_lib->mp.dpte_row_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   983                       cal=
culate_peak_bandwidth_params->meta_row_bw =3D mode_lib->mp.meta_row_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   984                       cal=
culate_peak_bandwidth_params->prefetch_cursor_bw =3D mode_lib->mp.prefetch_=
cursor_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   985                       cal=
culate_peak_bandwidth_params->prefetch_vmrow_bw =3D mode_lib->mp.prefetch_v=
mrow_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   986                       cal=
culate_peak_bandwidth_params->flip_bw =3D mode_lib->mp.final_flip_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   987                       cal=
culate_peak_bandwidth_params->urgent_burst_factor_l =3D mode_lib->mp.Urgent=
BurstFactorLuma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   988                       cal=
culate_peak_bandwidth_params->urgent_burst_factor_c =3D mode_lib->mp.Urgent=
BurstFactorChroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   989                       cal=
culate_peak_bandwidth_params->urgent_burst_factor_cursor =3D mode_lib->mp.U=
rgentBurstFactorCursor;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   990                       cal=
culate_peak_bandwidth_params->urgent_burst_factor_prefetch_l =3D mode_lib->=
mp.UrgentBurstFactorLumaPre;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   991                       cal=
culate_peak_bandwidth_params->urgent_burst_factor_prefetch_c =3D mode_lib->=
mp.UrgentBurstFactorChromaPre;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   992                       cal=
culate_peak_bandwidth_params->urgent_burst_factor_prefetch_cursor =3D mode_=
lib->mp.UrgentBurstFactorCursorPre;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   993
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   994                       dcn=
5_calculate_peak_bandwidth_required(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   995                          =
             &mode_lib->scratch,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   996                          =
             calculate_peak_bandwidth_params);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   997
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   998                       dcn=
5_check_immediate_flip_bandwidth_support(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22   999                          =
     &mode_lib->mp.FractionOfUrgentBandwidthImmediateFlip, // double* frac_=
urg_bandwidth_flip
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1000                          =
     &mode_lib->mp.ImmediateFlipSupported, // bool* flip_bandwidth_support_=
ok
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1001                          =
     **mode_lib->mp.urg_bandwidth_required_flip,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1002                          =
     **mode_lib->mp.non_urg_bandwidth_required_flip,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1003                          =
     mode_lib->mp.dram_bw_mbps);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1004
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1005                       if =
(!mode_lib->mp.ImmediateFlipSupported)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1006                          =
     DML_LOG_VERBOSE("DML::%s: Bandwidth not sufficient for flip!", __func_=
_);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1007
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1008                       for=
 (k =3D 0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1009                          =
     if (display_cfg->plane_descriptors[k].immediate_flip && mode_lib->mp.I=
mmediateFlipSupportedForPipe[k] =3D=3D false) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1010                          =
             mode_lib->mp.ImmediateFlipSupported =3D false;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1011                          =
             DML_LOG_VERBOSE("DML::%s: Pipe %0d not supporting iflip!\n", _=
_func__, k);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1012                          =
     }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1013                       }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1014               } else { //=
 flip or prefetch not support
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1015                       mod=
e_lib->mp.ImmediateFlipSupported =3D false;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1016               }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1017
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1018               // consider=
 flip support is okay if the flip bw is ok or (when user does't require a i=
flip and there is no host vm)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1019               must_suppor=
t_iflip =3D display_cfg->hostvm_enable || s->immediate_flip_required;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1020               mode_lib->m=
p.PrefetchAndImmediateFlipSupported =3D (mode_lib->mp.PrefetchModeSupported=
 =3D=3D true && (!must_support_iflip || mode_lib->mp.ImmediateFlipSupported=
));
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1021
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1022               DML_LOG_VER=
BOSE("DML::%s: PrefetchModeSupported =3D %u\n", __func__, mode_lib->mp.Pref=
etchModeSupported);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1023               for (k =3D =
0; k < s->num_active_planes; ++k)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1024                       DML=
_LOG_VERBOSE("DML::%s: immediate_flip_required[%u] =3D %u\n", __func__, k, =
display_cfg->plane_descriptors[k].immediate_flip);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1025               DML_LOG_VER=
BOSE("DML::%s: HostVMEnable =3D %u\n", __func__, display_cfg->hostvm_enable=
);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1026               DML_LOG_VER=
BOSE("DML::%s: ImmediateFlipSupported =3D %u\n", __func__, mode_lib->mp.Imm=
ediateFlipSupported);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1027               DML_LOG_VER=
BOSE("DML::%s: PrefetchAndImmediateFlipSupported =3D %u\n", __func__, mode_=
lib->mp.PrefetchAndImmediateFlipSupported);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1028               DML_LOG_VER=
BOSE("DML::%s: Done one iteration: k=3D%d, MaxVStartupLines=3D%u\n", __func=
__, k, s->MaxVStartupLines[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1029       }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1030
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1031       for (k =3D 0; k < s=
->num_active_planes; ++k)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1032               DML_LOG_VER=
BOSE("DML::%s: k=3D%d MaxVStartupLines =3D %u\n", __func__, k, s->MaxVStart=
upLines[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1033
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1034       if (!mode_lib->mp.P=
refetchAndImmediateFlipSupported) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1035               DML_LOG_VER=
BOSE("DML::%s: Bad, Prefetch and flip scheduling solution NOT found!\n", __=
func__);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1036       } else {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1037               DML_LOG_VER=
BOSE("DML::%s: Good, Prefetch and flip scheduling solution found\n", __func=
__);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1038
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1039               // DCC Conf=
iguration
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1040               for (k =3D =
0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1041                       DML=
_LOG_VERBOSE("DML::%s: Calculate DCC configuration for surface k=3D%u\n", _=
_func__, k);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1042                       dcn=
5_calculate_dcc_configuration(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1043                          =
     display_cfg->plane_descriptors[k].surface.dcc.enable,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1044                          =
     display_cfg->overrides.dcc_programming_assumes_scan_direction_unknown,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1045                          =
     display_cfg->plane_descriptors[k].pixel_format,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1046                          =
     display_cfg->plane_descriptors[k].surface.plane0.width,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1047                          =
     display_cfg->plane_descriptors[k].surface.plane1.width,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1048                          =
     display_cfg->plane_descriptors[k].surface.plane0.height,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1049                          =
     display_cfg->plane_descriptors[k].surface.plane1.height,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1050                          =
     s->NomDETInKByte,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1051                          =
     mode_lib->mp.Read256BlockHeightY[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1052                          =
     mode_lib->mp.Read256BlockHeightC[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1053                          =
     display_cfg->plane_descriptors[k].surface.tiling,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1054                          =
     mode_lib->mp.BytePerPixelY[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1055                          =
     mode_lib->mp.BytePerPixelC[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1056                          =
     mode_lib->mp.BytePerPixelInDETY[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1057                          =
     mode_lib->mp.BytePerPixelInDETC[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1058                          =
     display_cfg->plane_descriptors[k].composition.rotation_angle,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1059
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1060                          =
     /* Output */
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1061                          =
     &mode_lib->mp.RequestLuma[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1062                          =
     &mode_lib->mp.RequestChroma[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1063                          =
     &mode_lib->mp.DCCYMaxUncompressedBlock[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1064                          =
     &mode_lib->mp.DCCCMaxUncompressedBlock[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1065                          =
     &mode_lib->mp.DCCYMaxCompressedBlock[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1066                          =
     &mode_lib->mp.DCCCMaxCompressedBlock[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1067                          =
     &mode_lib->mp.DCCYIndependentBlock[k],
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1068                          =
     &mode_lib->mp.DCCCIndependentBlock[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1069               }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1070
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1071               //Watermark=
s and NB P-State/DRAM Clock Change Support
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1072               s->mmSOCPar=
ameters.UrgentLatency =3D mode_lib->mp.UrgentLatency;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1073               s->mmSOCPar=
ameters.ExtraLatency =3D mode_lib->mp.ExtraLatency;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1074               s->mmSOCPar=
ameters.ExtraLatency_sr =3D mode_lib->mp.ExtraLatency_sr;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1075               s->mmSOCPar=
ameters.WritebackLatency =3D utm_soc_bb->writeback_base_latency_us;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1076               s->mmSOCPar=
ameters.DRAMClockChangeLatency =3D utm_soc_bb->power_management_parameters.=
dram_clk_change_blackout_us;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1077               s->mmSOCPar=
ameters.FCLKChangeLatency =3D utm_soc_bb->power_management_parameters.fclk_=
change_blackout_us;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1078               s->mmSOCPar=
ameters.SRExitTime =3D utm_soc_bb->power_management_parameters.stutter_exit=
_latency_us;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1079               s->mmSOCPar=
ameters.SREnterPlusExitTime =3D utm_soc_bb->power_management_parameters.stu=
tter_enter_plus_exit_latency_us;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1080               s->mmSOCPar=
ameters.SRExitZ8Time =3D utm_soc_bb->power_management_parameters.z8_stutter=
_exit_latency_us;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1081               s->mmSOCPar=
ameters.SREnterPlusExitZ8Time =3D utm_soc_bb->power_management_parameters.z=
8_stutter_enter_plus_exit_latency_us;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1082               s->mmSOCPar=
ameters.USRRetrainingLatency =3D 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1083               s->mmSOCPar=
ameters.SMNLatency =3D 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1084               s->mmSOCPar=
ameters.temp_read_or_ppt_blackout_us =3D utm_soc_bb->power_management_param=
eters.g7_ppt_blackout_us;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1085               s->mmSOCPar=
ameters.qos_type =3D dml2_qos_param_type_dcn4x;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1086
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1087               CalculateWa=
termarks_params->display_cfg =3D display_cfg;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1088               CalculateWa=
termarks_params->USRRetrainingRequired =3D false;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1089               CalculateWa=
termarks_params->NumberOfActiveSurfaces =3D s->num_active_planes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1090               CalculateWa=
termarks_params->MaxLineBufferLines =3D mode_lib->ip.max_line_buffer_lines;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1091               CalculateWa=
termarks_params->LineBufferSize =3D mode_lib->ip.line_buffer_size_bits;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1092               CalculateWa=
termarks_params->WritebackInterfaceBufferSize =3D mode_lib->ip.writeback_in=
terface_buffer_size_kbytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1093               CalculateWa=
termarks_params->DCFCLK =3D mode_lib->mp.Dcfclk;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1094               CalculateWa=
termarks_params->SynchronizeTimings =3D display_cfg->overrides.synchronize_=
timings;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1095               CalculateWa=
termarks_params->SynchronizeDRRDisplaysForUCLKPStateChange =3D display_cfg-=
>overrides.synchronize_ddr_displays_for_uclk_pstate_change;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1096               CalculateWa=
termarks_params->dpte_group_bytes =3D mode_lib->mp.dpte_group_bytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1097               CalculateWa=
termarks_params->mmSOCParameters =3D s->mmSOCParameters;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1098               CalculateWa=
termarks_params->WritebackChunkSize =3D mode_lib->ip.writeback_chunk_size_k=
bytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1099               CalculateWa=
termarks_params->SOCCLK =3D s->SOCCLK;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1100               CalculateWa=
termarks_params->DCFClkDeepSleep =3D mode_lib->mp.DCFCLKDeepSleep;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1101               CalculateWa=
termarks_params->DETBufferSizeY =3D mode_lib->mp.DETBufferSizeY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1102               CalculateWa=
termarks_params->DETBufferSizeC =3D mode_lib->mp.DETBufferSizeC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1103               CalculateWa=
termarks_params->SwathHeightY =3D mode_lib->mp.SwathHeightY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1104               CalculateWa=
termarks_params->SwathHeightC =3D mode_lib->mp.SwathHeightC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1105               //Calculate=
Watermarks_params->LBBitPerPixel =3D 57; //FIXME_STAGE2
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1106               CalculateWa=
termarks_params->SwathWidthY =3D mode_lib->mp.SwathWidthY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1107               CalculateWa=
termarks_params->SwathWidthC =3D mode_lib->mp.SwathWidthC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1108               CalculateWa=
termarks_params->BytePerPixelDETY =3D mode_lib->mp.BytePerPixelInDETY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1109               CalculateWa=
termarks_params->BytePerPixelDETC =3D mode_lib->mp.BytePerPixelInDETC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1110               CalculateWa=
termarks_params->DSTXAfterScaler =3D mode_lib->mp.DSTXAfterScaler;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1111               CalculateWa=
termarks_params->DSTYAfterScaler =3D mode_lib->mp.DSTYAfterScaler;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1112               CalculateWa=
termarks_params->UnboundedRequestEnabled =3D mode_lib->mp.UnboundedRequestE=
nabled;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1113               CalculateWa=
termarks_params->CompressedBufferSizeInkByte =3D mode_lib->mp.CompressedBuf=
ferSizeInkByte;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1114               CalculateWa=
termarks_params->meta_row_height_l =3D mode_lib->mp.meta_row_height;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1115               CalculateWa=
termarks_params->meta_row_height_c =3D mode_lib->mp.meta_row_height_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1116               CalculateWa=
termarks_params->DPPPerSurface =3D mode_lib->mp.NoOfDPP;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1117               CalculateWa=
termarks_params->uclk_pstate_switch_modes =3D mode_lib->mp.uclk_pstate_swit=
ch_modes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1118
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1119               // Output
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1120               CalculateWa=
termarks_params->Watermark =3D &mode_lib->mp.Watermark;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1121               CalculateWa=
termarks_params->DRAMClockChangeSupport =3D mode_lib->mp.DRAMClockChangeSup=
port;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1122               CalculateWa=
termarks_params->global_dram_clock_change_support_required =3D &s->dummy_bo=
olean[0];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1123               CalculateWa=
termarks_params->global_dram_clock_change_supported =3D &mode_lib->mp.globa=
l_dram_clock_change_supported;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1124               CalculateWa=
termarks_params->MaxActiveDRAMClockChangeLatencySupported =3D mode_lib->mp.=
MaxActiveDRAMClockChangeLatencySupported;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1125               CalculateWa=
termarks_params->FCLKChangeSupport =3D mode_lib->mp.FCLKChangeSupport;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1126               CalculateWa=
termarks_params->global_fclk_change_supported =3D &mode_lib->mp.global_fclk=
_change_supported;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1127               CalculateWa=
termarks_params->MaxActiveFCLKChangeLatencySupported =3D &mode_lib->mp.MaxA=
ctiveFCLKChangeLatencySupported;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1128               CalculateWa=
termarks_params->USRRetrainingSupport =3D &mode_lib->mp.USRRetrainingSuppor=
t;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1129               CalculateWa=
termarks_params->temp_read_or_ppt_support =3D mode_lib->mp.temp_read_or_ppt=
_support;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1130               CalculateWa=
termarks_params->global_temp_read_or_ppt_supported =3D &mode_lib->mp.global=
_temp_read_or_ppt_supported;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22 @1131               CalculateWa=
termarks_params->VActiveLatencyHidingMargin =3D 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1132               CalculateWa=
termarks_params->VActiveLatencyHidingUs =3D 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1133
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1134               dcn5_calcul=
ate_watermarks_and_dram_speed_change_support(&mode_lib->scratch, CalculateW=
atermarks_params);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1135
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1136               for (k =3D =
0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1137                       if =
(display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_i=
ndex].writeback.active_writebacks_per_stream > 0) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1138                          =
     mode_lib->mp.WritebackAllowDRAMClockChangeEndPosition[k] =3D math_max2=
(0, mode_lib->mp.VStartupMin[k] * display_cfg->stream_descriptors[display_c=
fg->plane_descriptors[k].stream_index].timing.h_total /
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1139                          =
             ((double)display_cfg->stream_descriptors[display_cfg->plane_de=
scriptors[k].stream_index].timing.pixel_clock_khz / 1000) - mode_lib->mp.Wa=
termark.WritebackDRAMClockChangeWatermark);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1140                          =
     mode_lib->mp.WritebackAllowFCLKChangeEndPosition[k] =3D math_max2(0, m=
ode_lib->mp.VStartupMin[k] * display_cfg->stream_descriptors[display_cfg->p=
lane_descriptors[k].stream_index].timing.h_total /
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1141                          =
             ((double)display_cfg->stream_descriptors[display_cfg->plane_de=
scriptors[k].stream_index].timing.pixel_clock_khz / 1000) - mode_lib->mp.Wa=
termark.WritebackFCLKChangeWatermark);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1142                       } e=
lse {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1143                          =
     mode_lib->mp.WritebackAllowDRAMClockChangeEndPosition[k] =3D 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1144                          =
     mode_lib->mp.WritebackAllowFCLKChangeEndPosition[k] =3D 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1145                       }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1146               }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1147
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1148               dcn5_calcul=
ate_pstate_keepout_dst_lines(display_cfg, &mode_lib->mp.Watermark, mode_lib=
->mp.pstate_keepout_dst_lines);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1149
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1150               DML_LOG_VER=
BOSE("DML::%s: DEBUG stream_index =3D %0d\n", __func__, display_cfg->plane_=
descriptors[0].stream_index);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1151               DML_LOG_VER=
BOSE("DML::%s: DEBUG PixelClock =3D %ld kHz\n", __func__, (display_cfg->str=
eam_descriptors[display_cfg->plane_descriptors[0].stream_index].timing.pixe=
l_clock_khz));
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1152
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1153               //Display P=
ipeline Delivery Time in Prefetch, Groups
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1154               dcn5_calcul=
ate_pixel_delivery_times(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1155                       dis=
play_cfg,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1156                       mod=
e_lib->mp.NoOfDPP,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1157                       s->=
num_active_planes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1158                       mod=
e_lib->mp.VRatioPrefetchY,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1159                       mod=
e_lib->mp.VRatioPrefetchC,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1160                       mod=
e_lib->mp.swath_width_luma_ub,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1161                       mod=
e_lib->mp.swath_width_chroma_ub,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1162                       mod=
e_lib->mp.PSCL_THROUGHPUT,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1163                       mod=
e_lib->mp.PSCL_THROUGHPUT_CHROMA,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1164                       mod=
e_lib->mp.Dppclk,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1165                       mod=
e_lib->mp.DCFCLKDeepSleep,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1166                       mod=
e_lib->mp.BytePerPixelY,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1167                       mod=
e_lib->mp.BytePerPixelC,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1168                       mod=
e_lib->mp.req_per_swath_ub_l,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1169                       mod=
e_lib->mp.req_per_swath_ub_c,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1170
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1171                       /* =
Output */
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1172                       mod=
e_lib->mp.DisplayPipeLineDeliveryTimeLuma,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1173                       mod=
e_lib->mp.DisplayPipeLineDeliveryTimeChroma,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1174                       mod=
e_lib->mp.DisplayPipeLineDeliveryTimeLumaPrefetch,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1175                       mod=
e_lib->mp.DisplayPipeLineDeliveryTimeChromaPrefetch,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1176                       mod=
e_lib->mp.DisplayPipeRequestDeliveryTimeLuma,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1177                       mod=
e_lib->mp.DisplayPipeRequestDeliveryTimeChroma,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1178                       mod=
e_lib->mp.DisplayPipeRequestDeliveryTimeLumaPrefetch,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1179                       mod=
e_lib->mp.DisplayPipeRequestDeliveryTimeChromaPrefetch);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1180
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1181               CalculateMe=
taAndPTETimes_params->scratch =3D &mode_lib->scratch;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1182               CalculateMe=
taAndPTETimes_params->display_cfg =3D display_cfg;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1183               CalculateMe=
taAndPTETimes_params->NumberOfActiveSurfaces =3D s->num_active_planes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1184               CalculateMe=
taAndPTETimes_params->use_one_row_for_frame =3D mode_lib->mp.use_one_row_fo=
r_frame;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1185               CalculateMe=
taAndPTETimes_params->dst_y_per_row_vblank =3D mode_lib->mp.dst_y_per_row_v=
blank;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1186               CalculateMe=
taAndPTETimes_params->dst_y_per_row_flip =3D mode_lib->mp.dst_y_per_row_fli=
p;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1187               CalculateMe=
taAndPTETimes_params->BytePerPixelY =3D mode_lib->mp.BytePerPixelY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1188               CalculateMe=
taAndPTETimes_params->BytePerPixelC =3D mode_lib->mp.BytePerPixelC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1189               CalculateMe=
taAndPTETimes_params->dpte_row_height =3D mode_lib->mp.dpte_row_height;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1190               CalculateMe=
taAndPTETimes_params->dpte_row_height_chroma =3D mode_lib->mp.dpte_row_heig=
ht_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1191               CalculateMe=
taAndPTETimes_params->dpte_group_bytes =3D mode_lib->mp.dpte_group_bytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1192               CalculateMe=
taAndPTETimes_params->PTERequestSizeY =3D mode_lib->mp.PTERequestSizeY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1193               CalculateMe=
taAndPTETimes_params->PTERequestSizeC =3D mode_lib->mp.PTERequestSizeC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1194               CalculateMe=
taAndPTETimes_params->PixelPTEReqWidthY =3D mode_lib->mp.PixelPTEReqWidthY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1195               CalculateMe=
taAndPTETimes_params->PixelPTEReqHeightY =3D mode_lib->mp.PixelPTEReqHeight=
Y;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1196               CalculateMe=
taAndPTETimes_params->PixelPTEReqWidthC =3D mode_lib->mp.PixelPTEReqWidthC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1197               CalculateMe=
taAndPTETimes_params->PixelPTEReqHeightC =3D mode_lib->mp.PixelPTEReqHeight=
C;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1198               CalculateMe=
taAndPTETimes_params->dpte_row_width_luma_ub =3D mode_lib->mp.dpte_row_widt=
h_luma_ub;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1199               CalculateMe=
taAndPTETimes_params->dpte_row_width_chroma_ub =3D mode_lib->mp.dpte_row_wi=
dth_chroma_ub;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1200               CalculateMe=
taAndPTETimes_params->tdlut_groups_per_2row_ub =3D s->tdlut_groups_per_2row=
_ub;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1201               CalculateMe=
taAndPTETimes_params->mrq_present =3D mode_lib->ip.dcn_mrq_present;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1202
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1203               CalculateMe=
taAndPTETimes_params->MetaChunkSize =3D mode_lib->ip.meta_chunk_size_kbytes=
;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1204               CalculateMe=
taAndPTETimes_params->MinMetaChunkSizeBytes =3D mode_lib->ip.min_meta_chunk=
_size_bytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1205               CalculateMe=
taAndPTETimes_params->meta_row_width =3D mode_lib->mp.meta_row_width;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1206               CalculateMe=
taAndPTETimes_params->meta_row_width_chroma =3D mode_lib->mp.meta_row_width=
_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1207               CalculateMe=
taAndPTETimes_params->meta_row_height =3D mode_lib->mp.meta_row_height;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1208               CalculateMe=
taAndPTETimes_params->meta_row_height_chroma =3D mode_lib->mp.meta_row_heig=
ht_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1209               CalculateMe=
taAndPTETimes_params->meta_req_width =3D mode_lib->mp.meta_req_width;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1210               CalculateMe=
taAndPTETimes_params->meta_req_width_chroma =3D mode_lib->mp.meta_req_width=
_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1211               CalculateMe=
taAndPTETimes_params->meta_req_height =3D mode_lib->mp.meta_req_height;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1212               CalculateMe=
taAndPTETimes_params->meta_req_height_chroma =3D mode_lib->mp.meta_req_heig=
ht_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1213
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1214               CalculateMe=
taAndPTETimes_params->time_per_tdlut_group =3D mode_lib->mp.time_per_tdlut_=
group;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1215               CalculateMe=
taAndPTETimes_params->DST_Y_PER_PTE_ROW_NOM_L =3D mode_lib->mp.DST_Y_PER_PT=
E_ROW_NOM_L;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1216               CalculateMe=
taAndPTETimes_params->DST_Y_PER_PTE_ROW_NOM_C =3D mode_lib->mp.DST_Y_PER_PT=
E_ROW_NOM_C;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1217               CalculateMe=
taAndPTETimes_params->time_per_pte_group_nom_luma =3D mode_lib->mp.time_per=
_pte_group_nom_luma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1218               CalculateMe=
taAndPTETimes_params->time_per_pte_group_vblank_luma =3D mode_lib->mp.time_=
per_pte_group_vblank_luma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1219               CalculateMe=
taAndPTETimes_params->time_per_pte_group_flip_luma =3D mode_lib->mp.time_pe=
r_pte_group_flip_luma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1220               CalculateMe=
taAndPTETimes_params->time_per_pte_group_nom_chroma =3D mode_lib->mp.time_p=
er_pte_group_nom_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1221               CalculateMe=
taAndPTETimes_params->time_per_pte_group_vblank_chroma =3D mode_lib->mp.tim=
e_per_pte_group_vblank_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1222               CalculateMe=
taAndPTETimes_params->time_per_pte_group_flip_chroma =3D mode_lib->mp.time_=
per_pte_group_flip_chroma;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1223               CalculateMe=
taAndPTETimes_params->DST_Y_PER_META_ROW_NOM_L =3D mode_lib->mp.DST_Y_PER_M=
ETA_ROW_NOM_L;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1224               CalculateMe=
taAndPTETimes_params->DST_Y_PER_META_ROW_NOM_C =3D mode_lib->mp.DST_Y_PER_M=
ETA_ROW_NOM_C;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1225               CalculateMe=
taAndPTETimes_params->TimePerMetaChunkNominal =3D mode_lib->mp.TimePerMetaC=
hunkNominal;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1226               CalculateMe=
taAndPTETimes_params->TimePerChromaMetaChunkNominal =3D mode_lib->mp.TimePe=
rChromaMetaChunkNominal;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1227               CalculateMe=
taAndPTETimes_params->TimePerMetaChunkVBlank =3D mode_lib->mp.TimePerMetaCh=
unkVBlank;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1228               CalculateMe=
taAndPTETimes_params->TimePerChromaMetaChunkVBlank =3D mode_lib->mp.TimePer=
ChromaMetaChunkVBlank;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1229               CalculateMe=
taAndPTETimes_params->TimePerMetaChunkFlip =3D mode_lib->mp.TimePerMetaChun=
kFlip;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1230               CalculateMe=
taAndPTETimes_params->TimePerChromaMetaChunkFlip =3D mode_lib->mp.TimePerCh=
romaMetaChunkFlip;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1231
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1232               dcn5_calcul=
ate_meta_and_pte_times(CalculateMetaAndPTETimes_params);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1233
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1234               dcn5_calcul=
ate_vm_group_and_request_times(
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1235                       dis=
play_cfg,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1236                       s->=
num_active_planes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1237                       mod=
e_lib->mp.BytePerPixelC,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1238                       mod=
e_lib->mp.dst_y_per_vm_vblank,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1239                       mod=
e_lib->mp.dst_y_per_vm_flip,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1240                       mod=
e_lib->mp.dpte_row_width_luma_ub,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1241                       mod=
e_lib->mp.dpte_row_width_chroma_ub,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1242                       mod=
e_lib->mp.vm_group_bytes,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1243                       mod=
e_lib->mp.dpde0_bytes_per_frame_ub_l,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1244                       mod=
e_lib->mp.dpde0_bytes_per_frame_ub_c,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1245                       s->=
tdlut_pte_bytes_per_frame,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1246                       mod=
e_lib->mp.meta_pte_bytes_per_frame_ub_l,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1247                       mod=
e_lib->mp.meta_pte_bytes_per_frame_ub_c,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1248                       mod=
e_lib->ip.dcn_mrq_present,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1249
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1250                       /* =
Output */
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1251                       mod=
e_lib->mp.TimePerVMGroupVBlank,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1252                       mod=
e_lib->mp.TimePerVMGroupFlip,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1253                       mod=
e_lib->mp.TimePerVMRequestVBlank,
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1254                       mod=
e_lib->mp.TimePerVMRequestFlip);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1255
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1256               // VStartup=
 Adjustment
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1257               for (k =3D =
0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1258                       boo=
l isInterlaceTiming;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1259
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1260                       mod=
e_lib->mp.MinTTUVBlank[k] =3D mode_lib->mp.TWait[k] + mode_lib->mp.ExtraLat=
ency;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1261                       if =
(!display_cfg->plane_descriptors[k].dynamic_meta_data.enable)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1262                          =
     mode_lib->mp.MinTTUVBlank[k] =3D mode_lib->mp.TCalc + mode_lib->mp.Min=
TTUVBlank[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1263
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1264                       DML=
_LOG_VERBOSE("DML::%s: k=3D%u, MinTTUVBlank =3D %f (before vstartup margin)=
\n", __func__, k, mode_lib->mp.MinTTUVBlank[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1265                       s->=
Tvstartup_margin =3D (s->MaxVStartupLines[k] - mode_lib->mp.VStartupMin[k])=
 * display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream=
_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_c=
fg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1266                       mod=
e_lib->mp.MinTTUVBlank[k] =3D mode_lib->mp.MinTTUVBlank[k] + s->Tvstartup_m=
argin;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1267
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1268                       DML=
_LOG_VERBOSE("DML::%s: k=3D%u, Tvstartup_margin =3D %f\n", __func__, k, s->=
Tvstartup_margin);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1269                       DML=
_LOG_VERBOSE("DML::%s: k=3D%u, MaxVStartupLines =3D %u\n", __func__, k, s->=
MaxVStartupLines[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1270                       DML=
_LOG_VERBOSE("DML::%s: k=3D%u, MinTTUVBlank =3D %f\n", __func__, k, mode_li=
b->mp.MinTTUVBlank[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1271
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1272                       mod=
e_lib->mp.Tdmdl[k] =3D mode_lib->mp.Tdmdl[k] + s->Tvstartup_margin;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1273                       if =
(display_cfg->plane_descriptors[k].dynamic_meta_data.enable && mode_lib->ip=
.dynamic_metadata_vm_enabled) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1274                          =
     mode_lib->mp.Tdmdl_vm[k] =3D mode_lib->mp.Tdmdl_vm[k] + s->Tvstartup_m=
argin;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1275                       }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1276
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1277                       isI=
nterlaceTiming =3D (display_cfg->stream_descriptors[display_cfg->plane_desc=
riptors[k].stream_index].timing.interlaced && !mode_lib->ip.ptoi_supported)=
;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1278
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1279                       // =
The actual positioning of the vstartup
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1280                       mod=
e_lib->mp.VStartup[k] =3D (isInterlaceTiming ? (2 * s->MaxVStartupLines[k])=
 : s->MaxVStartupLines[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1281
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1282                       s->=
dlg_vblank_start =3D ((isInterlaceTiming ? math_floor2((display_cfg->stream=
_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.v_total=
 - display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream=
_index].timing.v_front_porch) / 2.0, 1.0) :
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1283                          =
     display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stre=
am_index].timing.v_total) - display_cfg->stream_descriptors[display_cfg->pl=
ane_descriptors[k].stream_index].timing.v_front_porch);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1284                       s->=
LSetup =3D math_floor2(4.0 * mode_lib->mp.TSetup[k] / ((double)display_cfg-=
>stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.=
h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descr=
iptors[k].stream_index].timing.pixel_clock_khz / 1000)), 1.0) / 4.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1285                       s->=
blank_lines_remaining =3D (display_cfg->stream_descriptors[display_cfg->pla=
ne_descriptors[k].stream_index].timing.v_total - display_cfg->stream_descri=
ptors[display_cfg->plane_descriptors[k].stream_index].timing.v_active) - mo=
de_lib->mp.VStartup[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1286
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1287                       if =
(s->blank_lines_remaining < 0) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1288                          =
     DML_LOG_VERBOSE("ERROR: Vstartup is larger than vblank!?\n");
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1289                          =
     s->blank_lines_remaining =3D 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1290                          =
     DML_ASSERT(0);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1291                       }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1292                       mod=
e_lib->mp.MIN_DST_Y_NEXT_START[k] =3D s->dlg_vblank_start + s->blank_lines_=
remaining + s->LSetup;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1293
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1294                       // =
debug only
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1295                       if =
(((mode_lib->mp.VUpdateOffsetPix[k] + mode_lib->mp.VUpdateWidthPix[k] + mod=
e_lib->mp.VReadyOffsetPix[k]) / (double) display_cfg->stream_descriptors[di=
splay_cfg->plane_descriptors[k].stream_index].timing.h_total) <=3D
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1296                          =
     (isInterlaceTiming ?
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1297                          =
             math_floor2((display_cfg->stream_descriptors[display_cfg->plan=
e_descriptors[k].stream_index].timing.v_total - display_cfg->stream_descrip=
tors[display_cfg->plane_descriptors[k].stream_index].timing.v_active - disp=
lay_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index]=
.timing.v_front_porch - mode_lib->mp.VStartup[k]) / 2.0, 1.0) :
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1298                          =
             (int)(display_cfg->stream_descriptors[display_cfg->plane_descr=
iptors[k].stream_index].timing.v_total - display_cfg->stream_descriptors[di=
splay_cfg->plane_descriptors[k].stream_index].timing.v_active - display_cfg=
->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing=
.v_front_porch - mode_lib->mp.VStartup[k]))) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1299                          =
     mode_lib->mp.VREADY_AT_OR_AFTER_VSYNC[k] =3D true;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1300                       } e=
lse {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1301                          =
     mode_lib->mp.VREADY_AT_OR_AFTER_VSYNC[k] =3D false;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1302                       }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1303                       DML=
_LOG_VERBOSE("DML::%s: k=3D%u, VStartup =3D %u (max)\n", __func__, k, mode_=
lib->mp.VStartup[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1304                       DML=
_LOG_VERBOSE("DML::%s: k=3D%u, VStartupMin =3D %u (max)\n", __func__, k, mo=
de_lib->mp.VStartupMin[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1305                       DML=
_LOG_VERBOSE("DML::%s: k=3D%u, VUpdateOffsetPix =3D %u\n", __func__, k, mod=
e_lib->mp.VUpdateOffsetPix[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1306                       DML=
_LOG_VERBOSE("DML::%s: k=3D%u, VUpdateWidthPix =3D %u\n", __func__, k, mode=
_lib->mp.VUpdateWidthPix[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1307                       DML=
_LOG_VERBOSE("DML::%s: k=3D%u, VReadyOffsetPix =3D %u\n", __func__, k, mode=
_lib->mp.VReadyOffsetPix[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1308                       DML=
_LOG_VERBOSE("DML::%s: k=3D%u, HTotal =3D %lu\n", __func__, k, display_cfg-=
>stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.=
h_total);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1309                       DML=
_LOG_VERBOSE("DML::%s: k=3D%u, VTotal =3D %lu\n", __func__, k, display_cfg-=
>stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.=
v_total);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1310                       DML=
_LOG_VERBOSE("DML::%s: k=3D%u, VActive =3D %lu\n", __func__, k, display_cfg=
->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing=
.v_active);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1311                       DML=
_LOG_VERBOSE("DML::%s: k=3D%u, VFrontPorch =3D %lu\n", __func__, k, display=
_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].ti=
ming.v_front_porch);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1312                       DML=
_LOG_VERBOSE("DML::%s: k=3D%u, TSetup =3D %f\n", __func__, k, mode_lib->mp.=
TSetup[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1313                       DML=
_LOG_VERBOSE("DML::%s: k=3D%u, MIN_DST_Y_NEXT_START =3D %f\n", __func__, k,=
 mode_lib->mp.MIN_DST_Y_NEXT_START[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1314                       DML=
_LOG_VERBOSE("DML::%s: k=3D%u, VREADY_AT_OR_AFTER_VSYNC =3D %u\n", __func__=
, k, mode_lib->mp.VREADY_AT_OR_AFTER_VSYNC[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1315               }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1316
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1317               //Maximum B=
andwidth Used
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1318               mode_lib->m=
p.TotalWRBandwidth =3D 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1319               for (k =3D =
0; k < display_cfg->num_streams; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1320                       for=
 (j =3D 0; j < display_cfg->stream_descriptors[k].writeback.active_writebac=
ks_per_stream; ++j) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1321                          =
     double writeback_bytes_per_pixel;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1322                          =
     if (display_cfg->stream_descriptors[k].writeback.writeback_stream[j].p=
ixel_format =3D=3D dml2_444_64)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1323                          =
             writeback_bytes_per_pixel =3D 8.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1324                          =
     else if (display_cfg->stream_descriptors[k].writeback.writeback_stream=
[j].pixel_format =3D=3D dml2_444_32)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1325                          =
             writeback_bytes_per_pixel =3D 4.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1326                          =
     else if (display_cfg->stream_descriptors[k].writeback.writeback_stream=
[j].pixel_format =3D=3D dml2_420_8)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1327                          =
             writeback_bytes_per_pixel =3D 1.5;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1328                          =
     else if (display_cfg->stream_descriptors[k].writeback.writeback_stream=
[j].pixel_format =3D=3D dml2_420_10)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1329                          =
             writeback_bytes_per_pixel =3D 3.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1330                          =
     else if (display_cfg->stream_descriptors[k].writeback.writeback_stream=
[j].pixel_format =3D=3D dml2_422_packed_8)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1331                          =
             writeback_bytes_per_pixel =3D 2.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1332                          =
     else if (display_cfg->stream_descriptors[k].writeback.writeback_stream=
[j].pixel_format =3D=3D dml2_422_packed_10)
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1333                          =
             writeback_bytes_per_pixel =3D 4.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1334                          =
     else
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1335                          =
             writeback_bytes_per_pixel =3D 0.0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1336                          =
     s->WRBandwidth =3D display_cfg->stream_descriptors[k].writeback.writeb=
ack_stream[j].output_height
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1337                          =
             * display_cfg->stream_descriptors[k].writeback.writeback_strea=
m[j].output_width
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1338                          =
             / (display_cfg->stream_descriptors[k].timing.h_total
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1339                          =
             * display_cfg->stream_descriptors[k].writeback.writeback_strea=
m[j].input_height
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1340                          =
             / ((double)display_cfg->stream_descriptors[k].timing.pixel_clo=
ck_khz / 1000)) * writeback_bytes_per_pixel;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1341                          =
     mode_lib->mp.TotalWRBandwidth =3D mode_lib->mp.TotalWRBandwidth + s->W=
RBandwidth;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1342                       }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1343               }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1344
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1345               mode_lib->m=
p.TotalDataReadBandwidth =3D 0;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1346               for (k =3D =
0; k < s->num_active_planes; ++k) {
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1347                       mod=
e_lib->mp.TotalDataReadBandwidth =3D mode_lib->mp.TotalDataReadBandwidth + =
mode_lib->mp.vactive_sw_bw_l[k] + mode_lib->mp.vactive_sw_bw_c[k];
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1348                       DML=
_LOG_VERBOSE("DML::%s: k=3D%u, TotalDataReadBandwidth =3D %f\n", __func__, =
k, mode_lib->mp.TotalDataReadBandwidth);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1349                       DML=
_LOG_VERBOSE("DML::%s: k=3D%u, vactive_sw_bw_l =3D %f\n", __func__, k, mode=
_lib->mp.vactive_sw_bw_l[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1350                       DML=
_LOG_VERBOSE("DML::%s: k=3D%u, vactive_sw_bw_c =3D %f\n", __func__, k, mode=
_lib->mp.vactive_sw_bw_c[k]);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1351               }
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1352
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1353               CalculateSt=
utterEfficiency_params->display_cfg =3D display_cfg;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1354               CalculateSt=
utterEfficiency_params->CompressedBufferSizeInkByte =3D mode_lib->mp.Compre=
ssedBufferSizeInkByte;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1355               CalculateSt=
utterEfficiency_params->UnboundedRequestEnabled =3D mode_lib->mp.UnboundedR=
equestEnabled;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1356               CalculateSt=
utterEfficiency_params->MetaFIFOSizeInKEntries =3D mode_lib->ip.meta_fifo_s=
ize_in_kentries;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1357               CalculateSt=
utterEfficiency_params->ZeroSizeBufferEntries =3D mode_lib->ip.zero_size_bu=
ffer_entries;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1358               CalculateSt=
utterEfficiency_params->PixelChunkSizeInKByte =3D mode_lib->ip.pixel_chunk_=
size_kbytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1359               CalculateSt=
utterEfficiency_params->NumberOfActiveSurfaces =3D s->num_active_planes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1360               CalculateSt=
utterEfficiency_params->ROBBufferSizeInKByte =3D mode_lib->ip.rob_buffer_si=
ze_kbytes;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1361               CalculateSt=
utterEfficiency_params->TotalDataReadBandwidth =3D mode_lib->mp.TotalDataRe=
adBandwidth;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1362               CalculateSt=
utterEfficiency_params->DCFCLK =3D mode_lib->mp.Dcfclk;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1363               CalculateSt=
utterEfficiency_params->ReturnBW =3D mode_lib->mp.dram_bw_mbps;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1364               CalculateSt=
utterEfficiency_params->CompbufReservedSpace64B =3D mode_lib->mp.compbuf_re=
served_space_64b;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1365               CalculateSt=
utterEfficiency_params->CompbufReservedSpaceZs =3D mode_lib->ip.compbuf_res=
erved_space_zs;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1366               CalculateSt=
utterEfficiency_params->SRExitTime =3D utm_soc_bb->power_management_paramet=
ers.stutter_exit_latency_us;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1367               CalculateSt=
utterEfficiency_params->SRExitZ8Time =3D utm_soc_bb->power_management_param=
eters.z8_stutter_exit_latency_us;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1368               CalculateSt=
utterEfficiency_params->SynchronizeTimings =3D display_cfg->overrides.synch=
ronize_timings;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1369               CalculateSt=
utterEfficiency_params->StutterEnterPlusExitWatermark =3D mode_lib->mp.Wate=
rmark.StutterEnterPlusExitWatermark;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1370               CalculateSt=
utterEfficiency_params->Z8StutterEnterPlusExitWatermark =3D mode_lib->mp.Wa=
termark.Z8StutterEnterPlusExitWatermark;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1371               CalculateSt=
utterEfficiency_params->ProgressiveToInterlaceUnitInOPP =3D mode_lib->ip.pt=
oi_supported;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1372               CalculateSt=
utterEfficiency_params->MinTTUVBlank =3D mode_lib->mp.MinTTUVBlank;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1373               CalculateSt=
utterEfficiency_params->DPPPerSurface =3D mode_lib->mp.NoOfDPP;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1374               CalculateSt=
utterEfficiency_params->DETBufferSizeY =3D mode_lib->mp.DETBufferSizeY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1375               CalculateSt=
utterEfficiency_params->BytePerPixelY =3D mode_lib->mp.BytePerPixelY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1376               CalculateSt=
utterEfficiency_params->BytePerPixelDETY =3D mode_lib->mp.BytePerPixelInDET=
Y;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1377               CalculateSt=
utterEfficiency_params->SwathWidthY =3D mode_lib->mp.SwathWidthY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1378               CalculateSt=
utterEfficiency_params->SwathHeightY =3D mode_lib->mp.SwathHeightY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1379               CalculateSt=
utterEfficiency_params->SwathHeightC =3D mode_lib->mp.SwathHeightC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1380               CalculateSt=
utterEfficiency_params->BlockHeight256BytesY =3D mode_lib->mp.Read256BlockH=
eightY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1381               CalculateSt=
utterEfficiency_params->BlockWidth256BytesY =3D mode_lib->mp.Read256BlockWi=
dthY;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1382               CalculateSt=
utterEfficiency_params->BlockHeight256BytesC =3D mode_lib->mp.Read256BlockH=
eightC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1383               CalculateSt=
utterEfficiency_params->BlockWidth256BytesC =3D mode_lib->mp.Read256BlockWi=
dthC;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1384               CalculateSt=
utterEfficiency_params->DCCYMaxUncompressedBlock =3D mode_lib->mp.DCCYMaxUn=
compressedBlock;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1385               CalculateSt=
utterEfficiency_params->DCCCMaxUncompressedBlock =3D mode_lib->mp.DCCCMaxUn=
compressedBlock;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1386               CalculateSt=
utterEfficiency_params->ReadBandwidthSurfaceLuma =3D mode_lib->mp.vactive_s=
w_bw_l;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1387               CalculateSt=
utterEfficiency_params->ReadBandwidthSurfaceChroma =3D mode_lib->mp.vactive=
_sw_bw_c;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1388               CalculateSt=
utterEfficiency_params->dpte_row_bw =3D mode_lib->mp.dpte_row_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1389               CalculateSt=
utterEfficiency_params->meta_row_bw =3D mode_lib->mp.meta_row_bw;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1390               CalculateSt=
utterEfficiency_params->rob_alloc_compressed =3D mode_lib->ip.dcn_mrq_prese=
nt;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1391
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1392               // output
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1393               CalculateSt=
utterEfficiency_params->StutterEfficiencyNotIncludingVBlank =3D &mode_lib->=
mp.StutterEfficiencyNotIncludingVBlank;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1394               CalculateSt=
utterEfficiency_params->StutterEfficiency =3D &mode_lib->mp.StutterEfficien=
cy;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1395               CalculateSt=
utterEfficiency_params->NumberOfStutterBurstsPerFrame =3D &mode_lib->mp.Num=
berOfStutterBurstsPerFrame;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1396               CalculateSt=
utterEfficiency_params->Z8StutterEfficiencyNotIncludingVBlank =3D &mode_lib=
->mp.Z8StutterEfficiencyNotIncludingVBlank;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1397               CalculateSt=
utterEfficiency_params->Z8StutterEfficiency =3D &mode_lib->mp.Z8StutterEffi=
ciency;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1398               CalculateSt=
utterEfficiency_params->Z8NumberOfStutterBurstsPerFrame =3D &mode_lib->mp.Z=
8NumberOfStutterBurstsPerFrame;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1399               CalculateSt=
utterEfficiency_params->StutterPeriod =3D &mode_lib->mp.StutterPeriod;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1400               CalculateSt=
utterEfficiency_params->DCHUBBUB_ARB_CSTATE_MAX_CAP_MODE =3D &mode_lib->mp.=
DCHUBBUB_ARB_CSTATE_MAX_CAP_MODE;
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1401
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1402               // Stutter =
Efficiency
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1403               dcn5_calcul=
ate_stutter_efficiency(&mode_lib->scratch, CalculateStutterEfficiency_param=
s);
7f7d7ea1fa51515 Aurabindo Pillai 2026-07-22  1404

:::::: The code at line 1131 was first introduced by commit
:::::: 7f7d7ea1fa515157162d0d21245925551ed103a1 drm/amd/display: Add new so=
urces for DCN6

:::::: TO: Aurabindo Pillai <aurabindo.pillai@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
