Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736A8144D15
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 09:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712826660; cv=fail; b=nUNVrVXsYqgLy/Wr04XyuXFtuDn70ZbDU3ZOYIhlOdtDZltEm/wxtnumpKyy0SltQJoBaInkOAhI+DlUSqxXtP16x0k9Jl++gFSZ7PYlSbKHs84O1o8qArIYZStK0n8KqvAkvjIEGwDW5w94/q5EFqyZjc5b5JO7fp9Fdt2KrRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712826660; c=relaxed/simple;
	bh=EO4JrjGbfEBVZIVxPLeDb2UwtOq9eGa9APru/2kugsw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Iukvw49vAEkiSLAGq/o4P+CS9z+Nh/zbqGQfGGeuKhugtnfaw7lnrGiGH+7Kd3dYs7aoh5m9qIZnkgKbZ9XPDAEWm8QAsJWPHINk9i+NydB+Zj5P0OV2bOI4H9/vxMoPdYtR9eamfvQMkA6zpzKGXYx8yCjt40Uyp5oaCIHxBg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bYx9E/KT; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bYx9E/KT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712826658; x=1744362658;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EO4JrjGbfEBVZIVxPLeDb2UwtOq9eGa9APru/2kugsw=;
  b=bYx9E/KT3ekLw/iPwV5BBj1Tl15Yz+jHaY5kmaSTjBS7c7nnw631qp8w
   6SjdPhxXJoQOBjF3ZKBBECAKzBegiu2FcUhNknuHE0e+9g4ys0UacK7lk
   oOxKWDy8XnObqVx2YANRYKnS+7FFqS5AyTCyByIvgE+NniRXFimzkjljS
   Nrwj0FZCyPPMcjp480ecXBwDDhwAkBzITST1qV9Qf8OrWaH5BNXeU7VyH
   FqFdPNEK04KeOTCr1+NcisOkWAatiIwFbkQfBI3FpRUaGL1l1tqllWDwJ
   MZOVHIP4dyHnQAFUm5bpSJaDuttTAk3NfpRuHbMwK/Oa3f6hCFnMT9IYI
   w==;
X-CSE-ConnectionGUID: q8dgH5NxRK6zijexJVSwWw==
X-CSE-MsgGUID: 99lF4GtwQLGqyOwvutV/ng==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18935310"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="18935310"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 02:10:58 -0700
X-CSE-ConnectionGUID: Q8iQAq2GRi6He8EnZ0fo3A==
X-CSE-MsgGUID: kZpv8M5dSP68plHbEn/yFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="25358435"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Apr 2024 02:10:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 02:10:57 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Apr 2024 02:10:57 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 02:10:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJA6q7r7wiUhCWWflGz12eRAEo2I+S1hxUHWmkYSnCBE5z2VRTHZtWrSkcfW5W3wrTMWBLvBWyFX+BRExJMAncOEiHESHWkGd1HQ0XOWLXwfiRZYW5p4OmU+oKOciI6mmLJ6ZOkVFOjXpftdQHLT6Gpms7bni60Mj3Z2IFqGsREh8WsNUNuN31yWBDEcBKwuEuUnM9uxxIBKl2ZJCEFn8ADWlBhfhM8GyIDg07kmL3OdUNgeG8uQgep57xMB/ImjDgJNcYTQnlW0cBR7Qw/hCpxwGY7S+Wu26BMUc9QzMoMqNriRA/t1VIsaNdXc373zhKdzqnf3AV0E1Byl04d2zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7F1usKOyCiB0C1yxSgkfB42lebJ78agVKCfjQ3Q7SA=;
 b=IWLbUlZ24nq1TsefNxGL2y6XN+Lc3G8fKpK0MrMnpC4aTrVWTDSYrA6CIJfzWOOxiLDqOvnnb9jZcD00gl/jeAuIamdP+1/rbBRzp+0IccBfg5egA0L38P6MhbxAxSjvxzh5cwJROY1XFpkuK08XValQ7RkCsXPXLwB39qlEdDsP7pqhGE2coxaJAItij7TVyzSl+LtI2LnAnoK0fGeX8LZKQ4n1BACyA5jt+rFZYWwo0TPKw4pTpZ7D3fcrK2+VH1zINrWi29i/9pKWV/+g60Hx4YuvhGJ2iMole+pFb0mqTwu6pS3KqiVdmEqZ/xnUDXgqotbRoUubMMlfbnYq8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by CO1PR11MB4980.namprd11.prod.outlook.com (2603:10b6:303:98::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Thu, 11 Apr
 2024 09:10:55 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::654c:d66a:ec8e:45e9]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::654c:d66a:ec8e:45e9%6]) with mapi id 15.20.7452.019; Thu, 11 Apr 2024
 09:10:55 +0000
Message-ID: <3b30ed42-858e-4f5e-b3a5-2e3e9c92f7e5@intel.com>
Date: Thu, 11 Apr 2024 11:08:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 2203/5042] WARNING: modpost: vmlinux: section
 mismatch in reference: bitmap_read+0x128 (section: .text.unlikely) ->
 __setup_str_initcall_blacklist (section: .init.rodata)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: kernel test robot <lkp@intel.com>, Alexander Potapenko
	<glider@google.com>, <oe-kbuild-all@lists.linux.dev>, "Linux Memory
 Management List" <linux-mm@kvack.org>, Yury Norov <yury.norov@gmail.com>
References: <202404102353.Cv1gUjk3-lkp@intel.com>
 <Zhav9krPj3qBjpuP@smile.fi.intel.com>
From: Alexander Lobakin <aleksander.lobakin@intel.com>
Content-Language: en-US
In-Reply-To: <Zhav9krPj3qBjpuP@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0048.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::10) To DS0PR11MB8718.namprd11.prod.outlook.com
 (2603:10b6:8:1b9::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8718:EE_|CO1PR11MB4980:EE_
X-MS-Office365-Filtering-Correlation-Id: aa980c2c-4bb9-41f1-4ba4-08dc5a074b17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XDSsPP/MKF/6eN59fCHTvbfFlPEdIIEmZcN5y46htWXJzGhRwMLEX8xi+jAyk9ETJH3bCL2irBegWoaeeFIOmVgl4nktCVRzW+Urf1I1c7OKt9uYYLyQb48WgItk734i8d990jT00OH1uXj7KIsbVeox7p6pohyzTriBYD09smrLMDwF56Z/dP37v52bVtiAfcfExMQt82TsbhGtYkJjjhn0AAxGjXh00dlBKF/q3/Y4DKH67+RkOkACIuxsidOZDBOOkkd8ElK/LxdTcryJtfIoC167CsIM/RNKu2pUw7NoZfbolJzQEeLpH9niVkv/N9eKVIBJLoaN2VefGKklVnlsBRuck8NAySWy26c6eWD9qzc5rbCuI3BKRq6e5B+YyeclWhBWYBlkZF+1VK+YvCTC4uQmH1w6rlBD/2m1YrfMI1+sqHda82Lu288HKw5lYz/MyQHt1LOL/L01xidUyFPsPfQXcIzYRxk/ijjT+DPCsjqT/O3FdkvafIwRpzvBC6XhAoFSls/cgvSBpY/G+ziQck8LP+eLbNnD+kIu41My7WeuZpn7IzTGvEVpijIabfWHSDN3MLuoE+QIGriJmRsOOhoiooHNkdKpwZ/K3wcxAUQBV7F3D9WcS1SWS/7/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cENaNU56bnRZSWhkK3o4bEFodU5OWGRmMkdhM0JGVDJhMWg3MHk1YWRWWHNS?=
 =?utf-8?B?WGE1dHFBeStDRWRXaEFiQUh1Z0oyRlVGbTZjWW5NdTREZXZyRzBTUjVnMkxB?=
 =?utf-8?B?SHlYRmY1SVp0TEhFZEs5ZGV6eGR5Sk9OQ28xTnBDbERkTEVVM0NtWitRWCtq?=
 =?utf-8?B?NWxkMElWeVk1QThXbFd5TC8zc3ByOGI0MzNESkVxS1E2ZStnS2dmbFo3aHV6?=
 =?utf-8?B?QXpoNWNMcnQyRmc2Q2FzYlNKYTVyS1FRRGJhdGtIRUdhMkpvTzQyMk83QWxr?=
 =?utf-8?B?aTBkakRpbXk1NzNZRXBkZ0h4ejdjdzJVQzhNSmxiNFZkeU9acUVSRGlOb0RY?=
 =?utf-8?B?ekQ5RlFTY2ZhT2JLYTNhNTdSQWJpUklRcWM4NDBXSGdZUlNjMnRpa1d4U2JH?=
 =?utf-8?B?UTVnK1JDQUR5c0xJYkZtL0pzTUJUTFJXVnd4aW50dWNmKzVBR1JQTFp2cm1W?=
 =?utf-8?B?VUU4Mk5oUnF2b0JUZlVsOWJZM2JvWkFNTVBVSzEwM2ZIUzk1Y0pHbGFiaEZU?=
 =?utf-8?B?dENOWHM0b1U0NEduUWVIU3ExSXArbSt6Ty9hZFdYbWxTSHY2WnhhM1htVWhO?=
 =?utf-8?B?ajJiOUlVcVJicDNpKzd2SnpyS21BS3hOOGMyZHBzZmtKa3JjUlQ4dEtxa05u?=
 =?utf-8?B?Z2pjVU9ydUN5cWpacHVYTmRQdm5aNFBWa1dwRTNRL0lFeDNMQm9VdFYwa0xY?=
 =?utf-8?B?WkdYWEw2SnRjLy9yUEdBNDF2SVN0TGZCU3JxMmJJNjBqWjdpNjduajhudlJI?=
 =?utf-8?B?VnJDS0Y1MnBvTFhvSWJyaHNVTlpHL29JTUppbVhPOWFhc1pRUS91ZUYyS1JI?=
 =?utf-8?B?OHdlby9EUUd6OE95eERPdlZ4UnRmYlJWaEdqM3JQNHhBODBUeW8vZnJwbFpI?=
 =?utf-8?B?Z0hHc3pFZU5Mb1gwQ2F5Q05OVWY5QnRXbTdBZDBaM1ZLRDFDMWQ2a0o2dmtG?=
 =?utf-8?B?Y0lJWmRiQnRvZXp0SmpDdHN1SlVjMkZkM1J1TjlaRnI3YnlFdmRWYmZ0NG5J?=
 =?utf-8?B?c2M4ckZZSXR6Nmd5MC9ZL2hWMGdBeXkvTzNhWDVYcXNqaXRQSW5tVjFvaFNH?=
 =?utf-8?B?RXg0dDFPVlQvMXp3OG1qckg1RjZka25Pdm10eWtJbFFLSFlteTEwY0I5SjMv?=
 =?utf-8?B?clc2VUhRN3NUeEpYMXJmZVlSUmVMOUsxb2Q2b05DWWVDcnk1R0k5V2dwQnM3?=
 =?utf-8?B?SjBENXRWb1pNRFFOUGhkTnFFK05XbXBVRGZFQ0dSeW5Jd0FOWjZuMGJRSWlD?=
 =?utf-8?B?Q3F1ZWxtcmRaRmpWK1pxSE9XVWUwbG9pQmtwMVROdDVYWlZwSWs0dHpWQTQv?=
 =?utf-8?B?eE80MDVnb0hab3hrWmRhTXN5dGxVa3VlN1hudkxWdkhjcGdkbzZWWlhXUXg4?=
 =?utf-8?B?VnNtVGsrWWJQOWpJem5kam40aTdKQXFvSG9EUGpsbkc3U2ZwT01GR2JDd3Aw?=
 =?utf-8?B?YzFXdDJ1OEkzbmwzU2dJV2UwbUlxNkh2RW1YMTliSkYrODZDZU9IQ0tUQkV0?=
 =?utf-8?B?YXduMmhJUWhoUVRsVTNTdVhnelljVkRGWW0zakhPclNuN2RHMU95cUdqL0RV?=
 =?utf-8?B?OEd1WGJqck5rZk9Nb0lkQlF2S1F2anFudW1qeE1ZZkpkbUtpUXFFM21NNnZS?=
 =?utf-8?B?OFpGQkw3REQvVHlXZ3BiRjh5YmhYeVA4YjB2V1VPREJWMDdsZDU0cXZFVzVm?=
 =?utf-8?B?SU54MHBOeWM5d0xITFAzandnc3B2a2Q4emsvdjhBK21yTjJjdFBwbi9LdEhk?=
 =?utf-8?B?Lzg4S0ZxdXhZTVFTRmFMMjVhUzJEek9tbzFPaTEzWDF1cXlybG8rcFZHNlpx?=
 =?utf-8?B?SUg4K1hnc3JpdEJGcGllQk9rNENZUmtMZW56R0pYblk4QjlUM3duTG41OG00?=
 =?utf-8?B?a0pjbWlkaHdkRFpDbTdxZWhiUFVCTUVQcHJUbGduQjdPVnAvNGdFeVU4aUhO?=
 =?utf-8?B?L2lhRU84dmhOUWp0T3pOb05DR2RWUVRMYUtRNUZNeUM4R0kvRHFUWWd0LzUv?=
 =?utf-8?B?N1VuaVZ1Q3BpdmhCR0RKSXRSOXNCMlZTbC9PRGE0QlVWdk5GK1c4WmRlQTlU?=
 =?utf-8?B?WWxkRktQdk9ZNlU4Y2ZZRDRMcXRuUnBPVFEwYlk4Y1ZzcEpaUDUzYjdGVmpi?=
 =?utf-8?B?dHFtbzJNMUlXMlRLeEtMSlZVQnY5dG5Fbnh3YzdLOGJ2UE5aekhueHBVM243?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa980c2c-4bb9-41f1-4ba4-08dc5a074b17
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 09:10:55.2953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t7LY+OyernD/kkTO+mXuSk6tQhx2b6I3o82uZb0uZTm2B+/eRCVKkAsQc2dsXU7ueD40EeG3Gm92nRtOBQt0V6/w9lTTW1RU9OLA97kHALk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4980
X-OriginatorOrg: intel.com

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Wed, 10 Apr 2024 18:27:50 +0300

> On Wed, Apr 10, 2024 at 11:22:16PM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   6ebf211bb11dfc004a2ff73a9de5386fa309c430
>> commit: 991e5583647d33ee3a9c89248974ef98b9f539a8 [2203/5042] lib/test_bitmap: add tests for bitmap_{read,write}()
>> config: xtensa-randconfig-r012-20230725 (https://download.01.org/0day-ci/archive/20240410/202404102353.Cv1gUjk3-lkp@intel.com/config)
>> compiler: xtensa-linux-gcc (GCC) 13.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404102353.Cv1gUjk3-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202404102353.Cv1gUjk3-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>>
>> WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
>>>> WARNING: modpost: vmlinux: section mismatch in reference: bitmap_read+0x128 (section: .text.unlikely) -> __setup_str_initcall_blacklist (section: .init.rodata)
>> WARNING: modpost: vmlinux: section mismatch in reference: bitmap_allocate_region+0xb4 (section: .text.unlikely) -> __setup_str_initcall_blacklist (section: .init.rodata)
> 
> As pointed out earlier, this is unconfirmed bug in GCC (GCC developers
> point a finger at kernel code and vice versa). Can you reproduce this
> with clang?

I'm unable to reproduce it on clang-trunk (19).

Thanks,
Olek
