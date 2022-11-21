Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C34E7E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Nov 2022 07:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669016183; x=1700552183;
  h=message-id:date:subject:to:cc:from:
   content-transfer-encoding:mime-version;
  bh=DLZjKH6fR0WOAcuBiSwAlpXMdge70fhQzod3LaVa++0=;
  b=LoE/oOK1Lz/f+PQ+ZFKT6l+oBqJzv3dky7zUg/pQIUGdFxt9PK/RLYQJ
   5x8mR/JMRBRJBFvPY4HtNmiHKiLTlsMcWTXRD+tilVd9U6YySVDHFMesT
   mn3ibw8LnXruPbTWwu4mgvDfa1xWZzGsbWIn6kQv24EOq+EOPff7vhZio
   kGRtHJfzYe3ITSPbc0F6PMAxZ0MaY4oEfTFybPW5D3PRKZbcFQV6g0RJG
   8ocyOEPalTZjKZugVOJldLjLWtMnIZshX5u+3MsmdvZMYVHfyWsj/sS7i
   5maKR1UF1ZRodpyOTm82OCLsDQMzaqj/Sg3qI82SWLEBJZZL79P7HIiXA
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="314640881"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="314640881"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2022 23:36:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="709702963"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="709702963"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga004.fm.intel.com with ESMTP; 20 Nov 2022 23:36:22 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 20 Nov 2022 23:36:21 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Sun, 20 Nov 2022 23:36:21 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Sun, 20 Nov 2022 23:36:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzqOXbZZibZFGeFHGERq9G/Sf2wvddY/TQbS2L9aTxaO5563fVLIGnvXefK2vIN65zHBkrK5L5iyVttHqCVnKd03aMopQxXh+Bd0FY1wP13kM0baYjN9dkzYRruJFr36l5oHHFuXLnmB4ptGamjWrEdlE+Tezi0ccctdQPBKfoU74hy80sIZQKXeLz+LXdGQuw8GaV5wLt8kV21U9KU1hnU2TdUv2JC6TZtmG1FdoRmmNDuvOhQW6efkzlY9TywQuAIdFr7hutJfst5WGc3Nic9YZstqybD2sVRmalu0YilXI9Q1MVm+ZSyZnHt4BaDnu5GDQbohQayXZMNhjSsV8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tg0KH6GSkzHrY5WIN1bNMxHgpftQoyuGly80ygUkIsQ=;
 b=QBbX8szZ+ksZe0oUXlN3TZACEXnO013Xm+d/xCrYk/buZjIbAYY3p87KdtPNaI6/0z0veJdvhAo2zYckUraIUnJdvb4sKTpMxxIolMUqoiYHQ0pmJdDvF+RO9FJOLLGuqxpx5uLL6nw24utNj6Kd6geCsU5d3ZRT3yamWy1ScxFNyrmEkuGHO4uniIafAuDnnVLjcZltjKcxJ5LPFEBXfH7EQ6iS8fxdASjmxc2lqDbzSF5KNHg8GmSldrgBkgY2CEcAVP6gmIZhwsVIP7DmmwVp4o83N4FY/EWdqZo5USuf3bCKcKR2wMdawdHGVLcW3I0fKQCaOyWRQMAmyMirdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by IA1PR11MB6537.namprd11.prod.outlook.com (2603:10b6:208:3a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.11; Mon, 21 Nov
 2022 07:36:19 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::513a:f91a:b65c:be1d]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::513a:f91a:b65c:be1d%6]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 07:36:19 +0000
Message-ID: <135c1a41-5319-b0e9-0906-8ee9f6edf90e@intel.com>
Date: Mon, 21 Nov 2022 15:36:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.0
Subject: [ti:ti-rt-linux-5.10.y 8460/9999]
 drivers/media/platform/vxe-vxd/encoder/topaz_api.c: img_errors.h is included
 more than once.
Content-Language: en-US
To: Sunita Nadampalli <sunitan@ti.com>, Sidraya
	<sidraya.bj@pathpartnertech.com>
CC: <oe-kbuild-all@lists.linux.dev>, Vignesh Raghavendra <vigneshr@ti.com>,
	<nm@ti.com>, Praneeth Bajjuri <praneeth@ti.com>
From: kernel test robot <yujie.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:3:18::15) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|IA1PR11MB6537:EE_
X-MS-Office365-Filtering-Correlation-Id: 3749e6de-72a5-46d9-774a-08dacb93146e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4LJJ4BIOYPo8ihYJpzIT/1zB2Xauuu9a4foCfUjCqTnXOpnePQvmpQ3c6L9Ly4RMZwrilEeOz9GRXkBEKt7d3BoKfN/a0cvcnBzaMhrWq6V7cn0N+YlAhcUN1wua4vg6dXwur4+eGAZeHDMcvAv2zOH0iBlfprfX54/uDTMqfzgRKLhmLWbEDNV79yaxvSa5i0P8wIiPiKFVDBhdDaVdJbF3z5SF7DrvORt4qLok1fX8QFEo7qiKQodVgVOcSonDwmt9qPhI2P7l0K8Zm8//3JzMmjWku4/X9iEL3tA97I1KbI2wTrDpudIFIQ7JuM5yq2MxQ2Io8g1vgXk7PZY5N7MgalFMJr4PteFmSjeAkqRtlk/t20k0KhZj5Eu8YY/AJQZEnLPXVrQYkSiJKDtlgA7uP1JgE0pwtv6dzfYAzuO9hyStl5U81xhmpnK1Pu1u5aeKgF671aouNnQBMewiQo7XZQmMIcLNrIMhDavlNXv/pBihI72zDeQYWs3zdK+FVcYLZnFMHcl2fOTw+f6NTdU+7nCGWNOeSaayCQKcpSLKcAxDp0MUkF1JAMw+IziM82PgWraQ71A+tLh6QWqrh1tSv/rGS8OQ5dY4H04cc61LBUksjSkFiR8b3QgC4SImw2QlmQbbeAeiT/NJdWUvJ2OTOlr4b1VSoXLOlbvM/uX6exbnawjIeyGwHMT1leXpXA1TEUT8iMjSYsO6s7FifLy+h+dcLwTPbT4IFyTODnW1cPDJxiStuWi09EVR7L7OIz4/TlUMwPmxPPJn9AdYUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199015)(2906002)(2616005)(110136005)(186003)(478600001)(26005)(36756003)(6486002)(6666004)(6506007)(6512007)(38100700002)(31696002)(82960400001)(86362001)(83380400001)(966005)(8936002)(41300700001)(66556008)(66476007)(31686004)(66946007)(8676002)(4326008)(54906003)(5660300002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sk9QcUhDdVEyVm81cVQva1RtNEdCK2hkUmdQZkY4OHZ4cUxUZ215MlB5QUhq?=
 =?utf-8?B?bWhtUW0vZzh0YmJ2SGJCaE1XZGt4V01EUmp4NkltOGdUL0o5SEJNT2dLUVMw?=
 =?utf-8?B?M3lQRzcwMUQ5Unp3Sk51aFdROHVFdGJ1cTB3eC9tRWMybVJUMC9sMkxlTWFy?=
 =?utf-8?B?Mk5BbWlvZ3JRT0xvQUlnZm0xQmNoeWF3ZTV0M3RiU0xYTlhkRUxQUXY2b1Ex?=
 =?utf-8?B?Y2hnV2IzYlBZWTF6eGg2b0hJbTdlM01LdENybjU1L1hGTWpCWlVLRVFRUmhJ?=
 =?utf-8?B?OGgweUQwM1NSOHFoMXZkemNOZlByRjg4ZkRpd3NEazdGWXJpc2NYT0RheWJj?=
 =?utf-8?B?dTFFaTZXSzlHcEVKT1htb21vVTFDajRNRlFVY0hpeThOS0hwYVBTR0FEQUZp?=
 =?utf-8?B?ZHZJQUJHbVBuNlI5M3hQNHBJeTFrcFlySzMxVzQvYjBQR1lZZlplRHhVUUR2?=
 =?utf-8?B?c2hDSVhPcDM5VzR3NHpxUUIwUWxjVDh4S2hhL1VxMHFzTTF5RlgxNGEvWS9r?=
 =?utf-8?B?bnlnZU9XUURRdVlmSVVKbStGNko5djQwbjVGU1A5eGxuaWZnZHBURUg2WTRm?=
 =?utf-8?B?REFtd0wyUWZEeXB3S2h2cmRMWVdiaEFLT0tndWZwcjhsaFpXa0FzQXllSnVJ?=
 =?utf-8?B?OWJkNkwyV2dnOW5WUmd3Sm1DRVp4R0wxQXljQkFFa1B0MmVibWwyVUE4dU8r?=
 =?utf-8?B?SlhiemNScVh0WHArMTFyY2pjQXZGUXNnUE53NUp0UkxmSEoyOGI5dWNzTCsz?=
 =?utf-8?B?bXlNaTNGR0hPWkllaFh5WVptL1BPNTFHK1owMjdBZDFhdlVEbDdRMDZCbXgy?=
 =?utf-8?B?emlvUjEyckduYTVWV3Bvck1OSnZzb1hmZVdjNHhrdEJScmFWckZhY2VmazVj?=
 =?utf-8?B?SE5CZDNQUE5VV21iZzVIWjhTaGRIalVnT3ROM1FZTjYrand1Zkg2ek4xVXBu?=
 =?utf-8?B?cGtXVnh3dFFQd1RiNGFJUGhzTklYSXdwSGNiR2c3ak8wMkUvaThiMWZiOWoz?=
 =?utf-8?B?QXZ6M1dEWmJQSFdJSDhRTlJwTFFDUXpiNFF0LzY5bmcrUDFVWXcvTFJEeTda?=
 =?utf-8?B?MUJMMmdxTExyZTQ5UHlORmJ0OU96WEVKODJTRXR5RzJ2bUVzUDgxSjNtakFF?=
 =?utf-8?B?ZFJ1NUFVaS9wakw1THBpUnV5andiVTlBMnJlbjhTcVJmeXVhVEw4bzcwdnBp?=
 =?utf-8?B?NUkySjQzQUF4RXQrR1ZkNzkrSnNYTFBJZmV5SDh0VTgwOTIrY29IOHl6SE5n?=
 =?utf-8?B?LzN0MHUzTFYvYjc3TkZ4M09lc2ZmNXR5d0ZrZG1oSnQrS3pwVkdPNHR6RTZV?=
 =?utf-8?B?WnFEcjFLalZIc1pTMlI4bjhkN0N1a1c4cjVsQk5oRlZMQ3pjeitDbkRJVnRK?=
 =?utf-8?B?QkVHMjZmdXpQcTgzRW4vWW9iOXlhNFc1UEgxWnF1U2RQOWhwS24veDF2OFYx?=
 =?utf-8?B?Vk5WMjFiV09RYTNqQmhjWnhjT0U2ZE5lWldtcElGdkFwekdpM0ZqYUprVGxC?=
 =?utf-8?B?cWFFbCs5UGduMWFCWU5MK3kvMHJHSjdQNkhrTXhkLzJXU1hrNTMxQVY4UzFz?=
 =?utf-8?B?ZVhycFhBSjdxT2lsb3JLWkUrMnhEVTk0NUxKRmRiZUw4TkhYOGNISFo4UTNS?=
 =?utf-8?B?UnJxY0VUR0ZxZFNpOGJTNGtzbEZkbXFVUjBxWXhJOGZaSG9TdWpNdWZVaTNv?=
 =?utf-8?B?dS9PMDNZdUl2MkdWTDJxVnhnS3dZaVVmYTUvWTFvbzhlTnhVR3JtNTUrUDVJ?=
 =?utf-8?B?NkVmSnBrTmFBZ1d1OWtPVUNHZ3JKNHNzUE1yc2ZRczRDdUEvWk15WUt1eXA2?=
 =?utf-8?B?TnBXOFJLQWo2bzhCcHdSWUJ3T2piekhucEgwZVkvTUczcGhVZE9DU0x5eTZE?=
 =?utf-8?B?UWswN3U2c3B6K3ExOWlWQXVNQytpTjBZMVAxc1JtaGU2MDNRZ0dQcXdIYldT?=
 =?utf-8?B?bDZBZzBwMVhySHJ1dExCK0JWYVpPS1UzUWZCT1Jqdm5JRkhVNzloNWIvRHFq?=
 =?utf-8?B?OEg2bitVSXZWa2c2WmtMYmllbk1CdE1abmJqVk5vY3VLVXY4MGR4TGRUOVV5?=
 =?utf-8?B?YW9XZXdjTWZJSmd3em5MWThaTmg0eC9vblUxRXJEQlptSWhXelRIdUI1aTZV?=
 =?utf-8?B?SFl6bnJxeGlQN0N3Ny82OUFaMnQ2cm5Wb29kQUNCdElzM2V6ckhzazhuNWxZ?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3749e6de-72a5-46d9-774a-08dacb93146e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 07:36:19.2573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B6mRViVI0NbUFgp8PvhgeFoJLynRessyWwUQAVPBIrqL/0rUodZLiaKAx/Ru/B1iDafIB5+3gqAw5rS8R+UtNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6537
X-OriginatorOrg: intel.com

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.10.y
head:   4c9aff667ee7bb101378666e629f8bc55c150ee8
commit: f4b2488987a8152607348f34add9a6e858e18429 [8460/9999] v4l: vxe-enc: Add Device specific memory configuration
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <yujie.liu@intel.com>

includecheck warnings: (new ones prefixed by >>)
 >> drivers/media/platform/vxe-vxd/encoder/topaz_api.c: img_errors.h is included more than once.

$ git blame drivers/media/platform/vxe-vxd/encoder/topaz_api.c

f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530   21) #include "fw_headers/coreflags.h"
f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530   22) #include "fw_headers/topazscfwif.h"
f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530   23) #include "header_gen.h"
f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530  @24) #include "img_errors.h"
f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530   25) #include "img_mem_man.h"
f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530   26) #include "lst.h"
f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530   27) #include "reg_headers/topaz_coreext_regs.h"
f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530   28) #include "reg_headers/topazhp_core_regs.h"
f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530   29) #include "reg_headers/topaz_vlc_regs.h"
f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530   30) #include "reg_headers/topaz_db_regs.h"
f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530   31) #include "topaz_color_formats.h"
f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530   32) #include "topaz_device.h"
f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530   33) #include "topaz_api.h"
f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530   34) #include "topaz_api_utils.h"
f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530   35) #include "topazmmu.h"
f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530   36) #include "vxe_public_regdefs.h"
f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530  @37) #include "img_errors.h"


-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
