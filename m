Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDBC2CA4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 03:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707189631; cv=fail; b=RFkKzpt2x4kc8xe+OVI18uOonctpm1AgBg7pnQtSDIQB1HWR3fExOv1cLEOQM43i2UU8tcNGvdItt6L5w/2tMO9xzaXj6d8DWEYsmg8mx41wAqquwGGcw5N8H1AtH8IINOgR9tygrkQJ/NrY+2bz7avw6PGt8c1yxAf9VHtNams=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707189631; c=relaxed/simple;
	bh=Xs94HVeOWkxbnjJjwmVvkxMjHSrAoG6/rPczIdGYwsg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hWh/GJPRAT7kWVDTfIU83ix/RHqUl6BT0gg0RlpQbLDt3AzhaL9HW2st7MAGViGe7uJBaCFhvuYVLbMSLso5Req/l7YIXOa5+as2wOm+ShG30zMxu6hxrRvPK3I8DJfeTprobhDs1J/jsxdcJeDBH5xuZ9EyTNMfX1gvw0qfTQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LFLLH6/Q; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LFLLH6/Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707189629; x=1738725629;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Xs94HVeOWkxbnjJjwmVvkxMjHSrAoG6/rPczIdGYwsg=;
  b=LFLLH6/Qr4V8qC05AEhV3YltfqeRODyeVCKkQnSZAExwHc0WOmDP5MkJ
   evKHMNAsJwjoza+0HGF1D0pbBDsGOwR7ftKJeZylxai373gztsJvyC7eX
   3EctsJlcxa5neeiX0WYFxut51kZC3Z4ff/BTwGMn9ERzeroCz7JYSqLJ+
   Eb192jUC5s4yKRG+XVn5xw60/vrSXHc8mnPRY+7PrH5sW1Io3C8wEZQIq
   INtbLqnJ0kPDr5run/L9QWQwWh/tg8jyHkX5+IQVVeC0cfBWSOjFmhiKf
   7JwWFxUUnGEZSAA/XrFep7czl3AMWMJW0vzhwxDdjHTOkUT2Dzbwn65L5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="12011117"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="12011117"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 19:20:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="1216277"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Feb 2024 19:20:27 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 19:20:26 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 5 Feb 2024 19:20:26 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 5 Feb 2024 19:20:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Junk+Q+a7XTPXhf5BtnYIh8QDbOd/g5pnRjmI/LW61f2kZ6b8K7HaXgivN6hMCbgXPV7qqiZyTKrqlVroFX1qaRj6Iau3noMr6OEM2bWms/vZxrk+mwAQByh9er87AuivJTk0wzrt8hRharEs7WP3kUiWg6hlXtTFOVWjDVEk+L4+Ugau5EyBIQfgs4ZugGNkEQPoI9BXta8R8TEk+YOtHc/w29v5ATW1VDOcUpsMYXv4b6bBevVM8VUAoU4X5GthH9pxMp9AYxJcKqIWc1VSBAW5ntgwnEkxxfPbs2hwHks/1ulORSKrQxBIaN3bFX5AERE4UZB/A21vgr2z47/NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mj97NtimuN7jMclV70FSBX8yMkoFg2p9DscRmFdFO0g=;
 b=fAEqNNDITnj50CDj4TXx0In6lE2LrJyIeWXvW+QCfSG4C/v7Hg1hYf3ZuSNG8JCfQjSF/UlQIZixWyD0DYtS7gGV1Wt2JgB4UCk6DPD0ZV/oWik0sb4jpSyPUwHk2Wyhe1lOVhAVw9orb1fnagj7XodYZO1LPQos0EjdfySguxOQ0uleOy9jER/EyIDztIh4xye3bEgJxutnQnO/6snmDYNTLRim8e5jHljL21+kajIavXfTNzzIxhH4f355BvET/Y4/n/c+o9KyC4N1XGa0+vhOS9GeR4hJcxH3mveeryyPIVQC9Z9aiqOpFnX3DgJtRqaGOC0k+thsuZDKVLDBzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6153.namprd11.prod.outlook.com (2603:10b6:a03:488::18)
 by CYXPR11MB8754.namprd11.prod.outlook.com (2603:10b6:930:dc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 03:20:24 +0000
Received: from SJ1PR11MB6153.namprd11.prod.outlook.com
 ([fe80::fa4d:d2f5:1434:f75f]) by SJ1PR11MB6153.namprd11.prod.outlook.com
 ([fe80::fa4d:d2f5:1434:f75f%7]) with mapi id 15.20.7249.032; Tue, 6 Feb 2024
 03:20:24 +0000
From: "Li, Fei1" <fei1.li@intel.com>
To: "Wang, Yu1" <yu1.wang@intel.com>, lkp <lkp@intel.com>, Shuo Liu
	<shuo.a.liu@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, "Pan,
 Kris" <kris.pan@intel.com>, Zhao Yakui <yakui.zhao@intel.com>, "Sun, Victor"
	<victor.sun@intel.com>
Subject: RE: [intel-lts:4.19/android_s 2641/30000]
 drivers/vhm/vhm_ioeventfd.c:287:5: error: no previous prototype for function
 'acrn_ioeventfd'
Thread-Topic: [intel-lts:4.19/android_s 2641/30000]
 drivers/vhm/vhm_ioeventfd.c:287:5: error: no previous prototype for function
 'acrn_ioeventfd'
Thread-Index: AQHaV/6diIBRJfKKF0ufBxeUDEolMbD7VDLAgAFShZA=
Date: Tue, 6 Feb 2024 03:20:23 +0000
Message-ID: <SJ1PR11MB615301E192B8C655442913A6BF462@SJ1PR11MB6153.namprd11.prod.outlook.com>
References: <202402051429.k6XmQ15I-lkp@intel.com>
 <CY8PR11MB7135BA7BD719A95D992B5B58C3472@CY8PR11MB7135.namprd11.prod.outlook.com>
In-Reply-To: <CY8PR11MB7135BA7BD719A95D992B5B58C3472@CY8PR11MB7135.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6153:EE_|CYXPR11MB8754:EE_
x-ms-office365-filtering-correlation-id: 9449184f-7833-4476-421e-08dc26c28ebc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a/Vg0/hlyYdBiNXw+Sj/GNSB6BfPc0Mhq5HL55GX1Ll9mF/Ee4fBKerTEbq1KbWgJmfYRcMhIp6Jlhu8AakUmL+nKInVNBrYhngXgxJMS/p1AQQ253uGiDmC8fDjp2W8nlVdZzlr5X0lAdHKmQIUyHtIW8xZJt2jtc2JIDk+/J0Sffx0p077nmo6OZww2FnYH7Ba2LD1loPo4VM1Z6wdGx6KS7Pgulj2J+49zilLI2TIQTc8btGGYanwT3fwyZI7AOa0wOHBbVship1qOxXcs5H3Xkz9YciHU68p8OhW+aShshQ24lEfWRdJqEvGpY5jYe2vSovsCW756+Ed4iDlQxksy/YoHVY2sSQzjJP7WaI9Wn9KgFu4o6ZirnMmzMqWMkKDkJ73f/KO75mbLuVLR+nnNybernr9MjJDuG2ntg+iK6x+qYnv4n0nZA48qVMUV3W3443jI/YujLIv+/eUICaLdBD/G+Sp+jFyQCW7cKpINdYix/oByZVYIlI8+jfLZ4Z0Wt6VfUoYrR4ofOzY1aTxDXFI//j6hsZT5WlyfxW7lqUlHHl5JseYBACMmr/OwSe8EVVSzZGv0t9FkOPeUQ8QNo6jzz7QV8hGElHkccrJgvVFFrxUrG/dQmHlmGcO3UGG3ehmUfIujlinxKvClw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6153.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(396003)(376002)(366004)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(66446008)(41300700001)(8936002)(8676002)(26005)(4326008)(52536014)(2906002)(966005)(5660300002)(9686003)(478600001)(7696005)(71200400001)(53546011)(6506007)(107886003)(110136005)(76116006)(66946007)(66556008)(66476007)(38070700009)(64756008)(83380400001)(6636002)(316002)(54906003)(86362001)(33656002)(82960400001)(55016003)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sIlDIHgXyGBJVMjqKnEwXROWz/xRtq+LQ3acVpH8nHq2zli6sQankscOIArZ?=
 =?us-ascii?Q?YuTjFcNwrGBpyEuqfGqeCvPORcbiYCVxqCGaMe7Xtd2GgGak0evfr9HF1M78?=
 =?us-ascii?Q?xoyaq16aMpX6p4QufHm+8fqGeU/O54Fkryoc2agyr7yvPlvTd7sR3ZHi6Eee?=
 =?us-ascii?Q?QamFqXsAr3oBA5sm+oPNw9C82Xwqd3mTTtzRsmw3ecVKZ/VlfzIlAIUNO7ZQ?=
 =?us-ascii?Q?lsq4twID31m5vHKtCjxMqHSKjlQ6DhYsdoAEoY1ZM9AmKeiM3rXrHruqhebs?=
 =?us-ascii?Q?7J7xJ5aU9PHB6L4Tj5ERQrztUHz9C55u5xBwiJk8qSL4nS13Wyc2sWQW0uLb?=
 =?us-ascii?Q?JQzws2Eic7ChM2uf9HicdDe08w1DFZszwl/Mew7cy5/HlCCG9rU5nS1BJY1b?=
 =?us-ascii?Q?2sl68bNc0P9TowIPsFW5h8x0F1ImHI5/sZw8Ik5/+zHtn1k848Ks1eJ1c/0F?=
 =?us-ascii?Q?z7NvZhMNTOPTRLp811pUA+QQK2SYdvq87xv73AEFtNs566XBy7Rq/yAH/jAl?=
 =?us-ascii?Q?GaxLW3Hu+MpELFVRkbIdS1X0g7FJRXWBYzFwF+NmtL7CgJ/v0DwDGCED4HO8?=
 =?us-ascii?Q?+rpqJdi7FA/2IIwaywinl0/KdeM6pcyPEuF2HhaicyvyM+JKw+9prkZNhetN?=
 =?us-ascii?Q?SPsyyB23NRpiODPZQ8dYL12PUTlFCYXzlI1rETEf1rgFwqghbWj3pDwmM2RS?=
 =?us-ascii?Q?5RsoLEkQOmSux6yqrWvRmpfOrKl+GLZ6hjdetxt6iV7crWBwS03SJNNfoXkL?=
 =?us-ascii?Q?BgyMoZtHjFKP6oY342mj/VZR1+9LpMjp/Qq/xs5iOKoQeqz17lL5vbryhKrt?=
 =?us-ascii?Q?mGiZm1557bTWdNKug/mJMYwjodfuSTH88jNDFfcM8crwneh2Qg+eqXFHpu+I?=
 =?us-ascii?Q?zefS2rV3QWx564HIQuIBwHk3Y1pBWlaGNuOiJFWG781x3/Q0gx0dT3PdvOlm?=
 =?us-ascii?Q?XnpzRY+wZJX9gRGo1xfnuW7dILPfli0KsPmys9OKRGo0EzzPgRchp0rsf8wh?=
 =?us-ascii?Q?ZNbRPXyszoQj6QzfswSqXo1Z9Cpfr30cxywNadsaRrqGedyYIKLZx5IChY+B?=
 =?us-ascii?Q?3ZpAM4D5Vsxa4zTC61nC/gXgcZDQAaJOdNkYfXnIcgLow7vLk57i25NqS2ii?=
 =?us-ascii?Q?FLaxERbiEVGHQK1j6Jh7LUUVVe1onFwsZS77cDszhnbdaPIJDMuzNxoU1YzX?=
 =?us-ascii?Q?ONgETyg4Z+KBdYjDYYb6I5Vj1NkDs9Wy4X/iYHKpcmFpozNKY7MyfHD172Oa?=
 =?us-ascii?Q?8K6fl4d7DWeCVeqKLVQR6inDh8/rO46zsW9pF0DLtyWsZMippB5Pw5ILDTqy?=
 =?us-ascii?Q?Qw600mS/sTBrP1UOI/Nl1I3AttkA8bGfzNAAsHzDAaHtvhCvB6kLK1X0dXJQ?=
 =?us-ascii?Q?4mqYYtrS8IgBV8EbwJX+TEWIYaMyDkmj/LsVVK4N8W/zFyP3qrSBnaJsYwi8?=
 =?us-ascii?Q?0CRa1XYWyTF/c8NskumbYDEDpH55FMFza1CDKARXmSZjPcCQvnb79IDeMCIK?=
 =?us-ascii?Q?Lo7VC5Z+JfWK6ilqZUaG45FJeWoomCpep2rEeX/iqgWIbOTFwjhfuMGBL/Gh?=
 =?us-ascii?Q?GZgxGgrTqLVaW8BWjW8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6153.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9449184f-7833-4476-421e-08dc26c28ebc
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 03:20:23.9504
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I5uNZeo1euEyrSrNT9+ufp4kBGMptpH/ybTro5fPdD3d7mcNFqLViBnRFOYD+kECjmBckVQ/36XPpikgo5kefQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8754
X-OriginatorOrg: intel.com

https://github.com/intel/linux-intel-lts/pull/49

-----Original Message-----
From: Wang, Yu1 <yu1.wang@intel.com>=20
Sent: Monday, February 5, 2024 3:09 PM
To: lkp <lkp@intel.com>; Shuo Liu <shuo.a.liu@intel.com>; Li, Fei1 <fei1.li=
@intel.com>
Cc: oe-kbuild-all@lists.linux.dev; Pan, Kris <kris.pan@intel.com>; Zhao Yak=
ui <yakui.zhao@intel.com>; Sun, Victor <victor.sun@intel.com>
Subject: RE: [intel-lts:4.19/android_s 2641/30000] drivers/vhm/vhm_ioeventf=
d.c:287:5: error: no previous prototype for function 'acrn_ioeventfd'

+Fei to help. Shuo and Yahui have left Intel.

> -----Original Message-----
> From: lkp <lkp@intel.com>
> Sent: Monday, February 5, 2024 2:43 PM
> To: Shuo Liu <shuo.a.liu@intel.com>
> Cc: oe-kbuild-all@lists.linux.dev; Pan, Kris <kris.pan@intel.com>;=20
> Wang, Yu1 <yu1.wang@intel.com>; Zhao Yakui <yakui.zhao@intel.com>
> Subject: [intel-lts:4.19/android_s 2641/30000]
> drivers/vhm/vhm_ioeventfd.c:287:5: error: no previous prototype for=20
> function 'acrn_ioeventfd'
>=20
> tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
> head:   f2b228e8331cfde18e95b9fdeb61f16ae51d0c48
> commit: 7f8e6dad0b3be85a4b5e193de231eb063cfadd8e [2641/30000] vhm:
> add ioeventfd support for ACRN hypervisor service module
> config: x86_64-allmodconfig (https://download.01.org/0day-
> ci/archive/20240205/202402051429.k6XmQ15I-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project
> 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-
> ci/archive/20240205/202402051429.k6XmQ15I-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new=20
> version of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> | https://lore.kernel.org/oe-kbuild-all/202402051429.k6XmQ15I-lkp@intel.
> | com/
>=20
> All errors (new ones prefixed by >>):
>=20
> >> drivers/vhm/vhm_ioeventfd.c:287:5: error: no previous prototype for=20
> >> function 'acrn_ioeventfd' [-Werror,-Wmissing-prototypes]
>      287 | int acrn_ioeventfd(uint16_t vmid, struct acrn_ioeventfd *args)
>          |     ^
>    drivers/vhm/vhm_ioeventfd.c:287:1: note: declare 'static' if the=20
> function is not intended to be used outside of this translation unit
>      287 | int acrn_ioeventfd(uint16_t vmid, struct acrn_ioeventfd *args)
>          | ^
>          | static
> >> drivers/vhm/vhm_ioeventfd.c:398:5: error: no previous prototype for=20
> >> function 'acrn_ioeventfd_init' [-Werror,-Wmissing-prototypes]
>      398 | int acrn_ioeventfd_init(uint16_t vmid)
>          |     ^
>    drivers/vhm/vhm_ioeventfd.c:398:1: note: declare 'static' if the=20
> function is not intended to be used outside of this translation unit
>      398 | int acrn_ioeventfd_init(uint16_t vmid)
>          | ^
>          | static
> >> drivers/vhm/vhm_ioeventfd.c:455:6: error: no previous prototype for=20
> >> function 'acrn_ioeventfd_deinit' [-Werror,-Wmissing-prototypes]
>      455 | void acrn_ioeventfd_deinit(uint16_t vmid)
>          |      ^
>    drivers/vhm/vhm_ioeventfd.c:455:1: note: declare 'static' if the=20
> function is not intended to be used outside of this translation unit
>      455 | void acrn_ioeventfd_deinit(uint16_t vmid)
>          | ^
>          | static
>    3 errors generated.
>=20
>=20
> vim +/acrn_ioeventfd +287 drivers/vhm/vhm_ioeventfd.c
>=20
>    286
>  > 287	int acrn_ioeventfd(uint16_t vmid, struct acrn_ioeventfd *args)
>    288	{
>    289		struct vhm_ioeventfd_info *info =3D NULL;
>    290		int ret;
>    291
>    292		info =3D get_ioeventfd_info_by_vm(vmid);
>    293		if (!info)
>    294			return -ENOENT;
>    295
>    296		if (args->flags & ACRN_IOEVENTFD_FLAG_DEASSIGN)
>    297			ret =3D acrn_deassign_ioeventfd(info, args);
>    298		else
>    299			ret =3D acrn_assign_ioeventfd(info, args);
>    300
>    301		put_ioeventfd_info(info);
>    302		return ret;
>    303	}
>    304
>    305	static struct acrn_vhm_ioeventfd *vhm_ioeventfd_match(
>    306			struct vhm_ioeventfd_info *info,
>    307			u64 addr, u64 data, int length, int type)
>    308	{
>    309		struct acrn_vhm_ioeventfd *p =3D NULL;
>    310
>    311		/*
>    312		 * Same addr/type/data will be treated as hit, otherwise
> ignore.
>    313		 *   Register PIO[0x100~0x107] with data 0x10 as ioeventfd A,
> later
>    314		 *   request PIO[0x100~0x103] with data 0x10 will hit A.
>    315		 */
>    316		list_for_each_entry(p, &info->ioeventfds, list) {
>    317			if (p->type =3D=3D type &&
>    318				p->addr =3D=3D addr &&
>    319				(p->wildcard || p->data =3D=3D data))
>    320				return p;
>    321		}
>    322
>    323		return NULL;
>    324	}
>    325
>    326	static int acrn_ioeventfd_dispatch_ioreq(int client_id,
>    327			unsigned long *ioreqs_map)
>    328	{
>    329		struct vhm_request *req;
>    330		struct acrn_vhm_ioeventfd *p;
>    331		struct vhm_ioeventfd_info *info;
>    332		u64 addr;
>    333		u64 val;
>    334		int size;
>    335		int vcpu;
>    336
>    337		info =3D get_ioeventfd_info_by_client(client_id);
>    338		if (!info)
>    339			return -EINVAL;
>    340
>    341		/* get req buf */
>    342		if (!info->req_buf) {
>    343			info->req_buf =3D acrn_ioreq_get_reqbuf(info-
> >vhm_client_id);
>    344			if (!info->req_buf) {
>    345				pr_err("Failed to get req_buf for client %d\n",
>    346						info->vhm_client_id);
>    347				put_ioeventfd_info(info);
>    348				return -EINVAL;
>    349			}
>    350		}
>    351
>    352		while (1) {
>    353			vcpu =3D find_first_bit(ioreqs_map, info->vcpu_num);
>    354			if (vcpu =3D=3D info->vcpu_num)
>    355				break;
>    356			req =3D &info->req_buf[vcpu];
>    357			if (atomic_read(&req->processed) =3D=3D
> REQ_STATE_PROCESSING &&
>    358				req->client =3D=3D client_id) {
>    359				if (req->type =3D=3D REQ_MMIO) {
>    360					if (req->reqs.mmio_request.direction
> =3D=3D
>    361							REQUEST_READ) {
>    362						/* reading does nothing and
> return 0 */
>    363						req-
> >reqs.mmio_request.value =3D 0;
>    364						goto next_ioreq;
>    365					}
>    366					addr =3D req-
> >reqs.mmio_request.address;
>    367					size =3D req->reqs.mmio_request.size;
>    368					val =3D req->reqs.mmio_request.value;
>    369				} else {
>    370					if (req->reqs.pio_request.direction =3D=3D
>    371							REQUEST_READ) {
>    372						/* reading does nothing and
> return 0 */
>    373						req->reqs.pio_request.value
> =3D 0;
>    374						goto next_ioreq;
>    375					}
>    376					addr =3D req-
> >reqs.pio_request.address;
>    377					size =3D req->reqs.pio_request.size;
>    378					val =3D req->reqs.pio_request.value;
>    379				}
>    380
>    381				mutex_lock(&info->ioeventfds_lock);
>    382				p =3D vhm_ioeventfd_match(info, addr, val,
> size,
>    383						req->type);
>    384				if (p)
>    385					eventfd_signal(p->eventfd, 1);
>    386				mutex_unlock(&info->ioeventfds_lock);
>    387
>    388	next_ioreq:
>    389				atomic_set(&req->processed,
> REQ_STATE_COMPLETE);
>    390				acrn_ioreq_complete_request(client_id,
> vcpu);
>    391			}
>    392		}
>    393
>    394		put_ioeventfd_info(info);
>    395		return 0;
>    396	}
>    397
>  > 398	int acrn_ioeventfd_init(uint16_t vmid)
>    399	{
>    400		int ret =3D 0;
>    401		char name[16];
>    402		struct vm_info vm_info;
>    403		struct vhm_ioeventfd_info *info;
>    404
>    405		info =3D get_ioeventfd_info_by_vm(vmid);
>    406		if (info) {
>    407			put_ioeventfd_info(info);
>    408			return -EEXIST;
>    409		}
>    410
>    411		info =3D kzalloc(sizeof(struct vhm_ioeventfd_info),
> GFP_KERNEL);
>    412		if (!info)
>    413			return -ENOMEM;
>    414		snprintf(name, sizeof(name), "ioeventfd-%hu", vmid);
>    415		info->vhm_client_id =3D acrn_ioreq_create_client(vmid,
>    416				acrn_ioeventfd_dispatch_ioreq, name);
>    417		if (info->vhm_client_id < 0) {
>    418			pr_err("Failed to create ioeventfd client for ioreq!\n");
>    419			ret =3D -EINVAL;
>    420			goto fail;
>    421		}
>    422
>    423		ret =3D vhm_get_vm_info(vmid, &vm_info);
>    424		if (ret < 0) {
>    425			pr_err("Failed to get vm info for vmid %d\n", vmid);
>    426			goto client_fail;
>    427		}
>    428
>    429		info->vcpu_num =3D vm_info.max_vcpu;
>    430
>    431		ret =3D acrn_ioreq_attach_client(info->vhm_client_id, 0);
>    432		if (ret < 0) {
>    433			pr_err("Failed to attach vhm client %d!\n",
>    434					info->vhm_client_id);
>    435			goto client_fail;
>    436		}
>    437		mutex_init(&info->ioeventfds_lock);
>    438		info->vmid =3D vmid;
>    439		info->refcnt =3D 1;
>    440		INIT_LIST_HEAD(&info->ioeventfds);
>    441
>    442		mutex_lock(&vhm_ioeventfds_mutex);
>    443		list_add(&info->list, &vhm_ioeventfd_clients);
>    444		mutex_unlock(&vhm_ioeventfds_mutex);
>    445
>    446		pr_info("ACRN vhm ioeventfd init done!\n");
>    447		return 0;
>    448	client_fail:
>    449		acrn_ioreq_destroy_client(info->vhm_client_id);
>    450	fail:
>    451		kfree(info);
>    452		return ret;
>    453	}
>    454
>  > 455	void acrn_ioeventfd_deinit(uint16_t vmid)
>=20
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
