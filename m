Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB1C2116
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Jul 2023 18:07:06 +0000 (UTC)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36295eu0029626;
	Sun, 2 Jul 2023 11:07:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=s2048-2021-q4;
 bh=/FlVigYi4xeoy0Urdh9mD6toOdXBkFRUN0aTMGzgQ+I=;
 b=VNgOlI3Wn4GFU0BI1bMkJoISt/Ips4PH8XkO73y0WdZnxSzrLSrdHZ7umUwqOzCAWkNq
 B14CGs/DgAL0hfeHnCWCHsSx30MKXYn1U61o+lPFAetI4mWTO6s5JiKATlvounk00wCt
 xq5ULLb7PNbyfUaVnMdDS6ajgvWi/X9BrJPqiTffIq+94ZdEXR1WxIuUAvXFGEfHVHEm
 +9386FmROlSFCCZdMtaHj3LBM9mst/GeYWUnyXG5RE0Oz0bjGydeGQxL83HVZqrJkmyc
 mPOcnLlf9XlxA+V1E5wvu7Omk8WJIaNmUKhufuwwzfaNiSLaJSc3Or5FSahxKAOz8Kp6 gg== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3rjkf50r4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Jul 2023 11:07:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JCNxvDbUrGl/ieI2ItMgvMsZgn/7Qg9CJQvXrXiVIVNOlpRz5avV5KBtpPvrCNpJm2x7BzFjfq8I9EQjhI+DyVVCG4ARnnjRWeTN1QkqeMSExx+lfbft8D9GpyXi1tKmCg8UZ6+cmsCV/EA56HgI1ennrncTnfQ23c+K+ARPATG8pekDAezoDc3lCvlUB20apAATLEJuINm9TpvORF1T9yFuOWTz4nBW5VeLWiPTlGxVw8Vp5lWc9GmncLLPMcZT1/rJjXF+pdyb+9nNysxEP0cr8BaMW2o3xGX7g8Co1pjlhw9FhOLfUH8+lsyTlbqMwqqWekWTpBtWz4vILt7zkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQ3TZuuJj1NgXYHSDIF0gIshhLp8lnAXCMHqHDoZypo=;
 b=iR113MjkAkp0n7FUTycg3Dg5VedC6f3vJuc81NjlLXpJrc2BFddC9XUH4YYQTYPt9jcK+BBQOiiYbJ3UYWxw4hzK1uASccebX7fM1KIhBEOJ2OfX7XEwQ0MMqlpEiHYMY8UAToeAx4OZQT9etrWUspo7rSBNlGUu2dSBqy/Pv4V7u7RuO2Wi5edIydiT5QstfZVYZcg1rqTPWIcorZghBuZN6mG/3oka88Cv8fBVJ6iTkYz7Y5c+EExehsxrQv1mQp8r/5x+3xDw/sk/W4HYM4/jv6xvOleZIDXvzAgUOHe5PRzUmPR2u+y7A3tn++er4jquIK6pM2ugZpbk8LDTFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from SN6PR1501MB2064.namprd15.prod.outlook.com (2603:10b6:805:d::27)
 by SA1PR15MB4593.namprd15.prod.outlook.com (2603:10b6:806:19c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Sun, 2 Jul
 2023 18:07:00 +0000
Received: from SN6PR1501MB2064.namprd15.prod.outlook.com
 ([fe80::428f:acec:2c1f:c812]) by SN6PR1501MB2064.namprd15.prod.outlook.com
 ([fe80::428f:acec:2c1f:c812%7]) with mapi id 15.20.6544.024; Sun, 2 Jul 2023
 18:07:00 +0000
Message-ID: <ffbbf440-6108-000a-bfb8-5662329392b4@meta.com>
Date: Sun, 2 Jul 2023 11:06:55 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [RFC PATCH bpf-next 02/13] bpf: Add verifier support for
 sign-extension load insns
To: kernel test robot <lkp@intel.com>, Yonghong Song <yhs@fb.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <20230629063726.1649316-1-yhs@fb.com>
 <202307022221.ZvtBGOCA-lkp@intel.com>
Content-Language: en-US
From: Yonghong Song <yhs@meta.com>
In-Reply-To: <202307022221.ZvtBGOCA-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BYAPR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:a03:40::29) To SN6PR1501MB2064.namprd15.prod.outlook.com
 (2603:10b6:805:d::27)
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR1501MB2064:EE_|SA1PR15MB4593:EE_
X-MS-Office365-Filtering-Correlation-Id: 31b3f87b-d84f-47ea-939b-08db7b272149
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	htXyB5MZyVcTyIy88CHug+ka4eRj9HvHG4l8wR94/h6+QzcpH3UYTNdt/o5JcqBZ/kXrFyoRQukdNwvWjKuHt8OIEAc+rdiQaG3VZxlQfbAhokx89PYEh1OAcBU6onDPhyqiluDV3c9WZhi/GDNGpy9FYrAWJdo1o7YxqSrepje/DUOafHQzNUcFzoFx6gcUX/WEhMZBX3Z4jseNMTDZC5JY8q7PyoNGc1djo/TWlc8PPoyDBHvh/APAknoKNeOJIyROec75OiIb1iQxj/d1EQ2aQF6kVcI/kZg7LU3P5uSNMQDdDfWjeBJAkRj54epJH9OlHtymSAAYaMPEFkqg/hQJrCOrkIGkFJLFUnHOeAHWjnGZaiIp242KRSPYxeunl71Pwdye+t2DriiqWEjxVOyNmqmQuMI78v29bVE1L0ln/rMAoEWe+OYjAKduejG4H9NJcutNcVXycXkme8cbxP3aipSa5kiIcTVL7JHk8Ahl0oywATqqRHgJICCOUKFefch2ubxBdcUKFfUNBLEVXb6WR6zdCO/aEk3s+4h7gDX8+Cuuh1tX3GQkv/ztjDqrFaan5k8x092qVGozT3DKQVTvs1J/udBlpMd6opobSCoMxvl89xoCb//6ufk5vCN0BzzUFxryoQCaGhg790iYCQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR1501MB2064.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(366004)(136003)(376002)(396003)(451199021)(4326008)(316002)(31686004)(66476007)(86362001)(66556008)(186003)(66946007)(31696002)(53546011)(6506007)(6512007)(83380400001)(966005)(2616005)(2906002)(6486002)(38100700002)(6666004)(5660300002)(478600001)(8676002)(110136005)(8936002)(41300700001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?emtianZjTzQzc09QaXVHWXJFVjRydllnbjJYRVBHdVhzdEJlZmQ1RnZ0T2dy?=
 =?utf-8?B?bWRvYWUyUmdtaUhyVzl1cVFLVFlvZWRxSVdLbGVNOHVnQ0Jma2JIRWo4RlVj?=
 =?utf-8?B?YUh5QmJKaFdWcG1DdzA4blBBNjZnenV4OEk0TWFOVDBHeVZiTnpJR1BiQUYr?=
 =?utf-8?B?WTVZK0phNkhQQys0Z2E3S2pQNC9ZRExxVkFGMGo4c09ENWlIaWpYdnh4S2Rq?=
 =?utf-8?B?NWx3Vmtlbm1QenB5RHlNSG9IVkN3bzJKWGxPdFhBZmpyTnVnSXhEc05xSCtD?=
 =?utf-8?B?eEtqNDNGOEZNTHVqSE5tMXFSUVJCNGhXeGhPUUlpQ3FyZVQrb2pPRUJFdzNX?=
 =?utf-8?B?RlowUmJucURNMUsrWW5HajZvbVRjYkFCcldZdndPcHBFZ0FudldmT2phTXdP?=
 =?utf-8?B?bXl2STcrdElQS0xrSVh2Tis4OEdEQ2REd3gyOW53eWxIQ0FxOS9IcXFtY3dj?=
 =?utf-8?B?NGg5Q2xYR0t6dkM0dFZMbDREM1dKd3pJY045SkRxUVlCMGdPTzJhTVMyUlJw?=
 =?utf-8?B?M1VvRURCQXM1cjBJdTY4RHJRL0gvajc0VStUQjRLMkkvM09iQVpUcVhSTTl0?=
 =?utf-8?B?alF3VDlwOG13dlJ2aVYzeWwxdnRYMWZINmRtZlBFblFJeHlPZS80K3BmY3JR?=
 =?utf-8?B?Qm45cEdNVWM3Q243dzJqQmpGcjN0bzRLaHF1V3BsMVc0cVRlMS9Kd05uLzBq?=
 =?utf-8?B?TjAxK3M3aW4ySUQ4cmZ0OTM5cjV5U1FYRkdJM3d0d0MvYW9RbXRidEpiYzIr?=
 =?utf-8?B?M3E3U0h6Yy84aGlEaFFPQnE1UEw3Q2xKVFFzYXZZZjlINFZ2KytITjVmUUFy?=
 =?utf-8?B?R1FJVjRobElidHZTQmNRNzVwc05FTHRyMloyUFZUc01aK01GTDRMQi9zYjAw?=
 =?utf-8?B?THhuNlRQRGg1RFFNUStkblRVQzNlblY0QmZ4bTZSS2VKVllYL1RYRzVoN2Jt?=
 =?utf-8?B?M2JrR0daRHZJMmxBSEpYYTZEWnQvYmtPZUN4eDVsWll2OVpaVjhCeUFWQ3hj?=
 =?utf-8?B?VWxpN29jS2FMdkhSaENDZzQvRjdhdUpMSUtxMk42WXFUbUl0clpsYzNmOWxH?=
 =?utf-8?B?SCtHSlMzNWlxNEVacXhYbHNEMzBGblBaeStGckpzemQ2RE1DWVpmNzVLSVpJ?=
 =?utf-8?B?MWZyaXVpYmFOaW1UZFhpUXVwSTRZSk9WWnlWbFlOYXJOSVFmeEFzTWs5OGtO?=
 =?utf-8?B?WndPWjBXc3drOXlFK0Z5WXNYK2lXaXczNk5JNG91bXZCbWs1SG1kbDlrYmdU?=
 =?utf-8?B?amhEd0JraHN5bnFUOHpUanRQay9XVU9LeEE1L2Zvd0hyOHNTYVN5eGc2dkxT?=
 =?utf-8?B?K2RyU3J0cXh1SnBodDFVbExhdkI1QjZEbXVaR043ZDVTdEZIQW1PTkNJZFNE?=
 =?utf-8?B?VW5KUkxFdlhCaFp5LzZaMXZnclowUnUzblV2NnI3YVY5SlB5OXZOVXBCakxH?=
 =?utf-8?B?UVBQZE00WEhUSUc3aG9oUGFjOG1JdlRFdEV2SFpGQmMxLzc3T0UrWFlOMktF?=
 =?utf-8?B?TlBoWG9pRTJUOXpUTHVwYTU3Vzlubm9xTDFRSTBacjNLcGtzYzRTdG5VR3VH?=
 =?utf-8?B?a29jTTc1S0JJT29XTG5JL000bHBVMVh1dGhNWGtBenhUOFNaQmtYYVpQc1Nt?=
 =?utf-8?B?NWhYU1dML0VmQXIrV0JYWFdhaThGR1Z0aUhidEVNZm45UWJhMVdaWENqcTB1?=
 =?utf-8?B?WTgrMnIzN3hBc1p4Y2pzZmRLUGlzdTBkQVV0a1VoVWJJQ1A2Uk5GbkJad1ND?=
 =?utf-8?B?UFhkQ1dVTGFGZUczZzRMc1NVUlFycUtNZWhrTEVydHNkdjF1cjg0ZUw5ZUMy?=
 =?utf-8?B?ZTVvTG5uSDE1Q2RDRzlnTUhheTBDWllwSDVJM2VDWHBhMHlBc1RpejJONit4?=
 =?utf-8?B?UnduMUd6NGl4ZTNHaDRTNHRLZG5kdVRYVVV5eXg1R2JxUWxGSyt5cWdOUGZk?=
 =?utf-8?B?dG5KaWxxOG9Va0pRbGpnY0dYekFQQXN6MnVtRHRzbWZiV1JmVys0cVh6d254?=
 =?utf-8?B?dVhMZXM4VzMwSlE0b1VpZHg2WG1CK09VdFlpQ3dWMXNqNzQwNUs0ejhUVTZZ?=
 =?utf-8?B?Z1Ivb0t4UUN4SE9na0RJTzVLTkppSW53RHpBOFg1RmZFQ0JVZXFiSTJGTmFz?=
 =?utf-8?B?M1N3c2FDd2FLYUwwUHBXVnRhMVFSVUJjNUxvdWpMYnJ1WW9Vd3VON3dzQitV?=
 =?utf-8?B?Tmc9PQ==?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b3f87b-d84f-47ea-939b-08db7b272149
X-MS-Exchange-CrossTenant-AuthSource: SN6PR1501MB2064.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2023 18:06:59.6889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1tXyW/4Wy90S0NhiJBju7EE0v/+gd74FNjf4wcrX1JrBFh+tm6OQ6lwrdeoJbWkl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR15MB4593
X-Proofpoint-ORIG-GUID: mQyqjGeEE4fRuyJpmVIFNyU79oqJV4oi
X-Proofpoint-GUID: mQyqjGeEE4fRuyJpmVIFNyU79oqJV4oi
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 2 URL's were un-rewritten
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-02_14,2023-06-30_01,2023-05-22_02



On 7/2/23 7:28 AM, kernel test robot wrote:
> Hi Yonghong,
> 
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on bpf-next/master]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Yonghong-Song/bpf-Support-new-sign-extension-load-insns/20230629-144251
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
> patch link:    https://lore.kernel.org/r/20230629063726.1649316-1-yhs%40fb.com
> patch subject: [RFC PATCH bpf-next 02/13] bpf: Add verifier support for sign-extension load insns
> config: x86_64-randconfig-x061-20230702 (https://download.01.org/0day-ci/archive/20230702/202307022221.ZvtBGOCA-lkp@intel.com/config )
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230702/202307022221.ZvtBGOCA-lkp@intel.com/reproduce )
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307022221.ZvtBGOCA-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>     kernel/bpf/verifier.c:18560:38: sparse: sparse: subtraction of functions? Share your drugs
>>> kernel/bpf/verifier.c:6322:86: sparse: sparse: cast truncates bits from constant value (7fffffff becomes ff)
>>> kernel/bpf/verifier.c:6323:86: sparse: sparse: cast truncates bits from constant value (80000000 becomes 0)
>>> kernel/bpf/verifier.c:6325:87: sparse: sparse: cast truncates bits from constant value (7fffffff becomes ffff)
>     kernel/bpf/verifier.c:6326:87: sparse: sparse: cast truncates bits from constant value (80000000 becomes 0)
>     kernel/bpf/verifier.c: note: in included file (through include/linux/bpf.h, include/linux/bpf-cgroup.h):
>     include/linux/bpfptr.h:65:40: sparse: sparse: cast to non-scalar
>     include/linux/bpfptr.h:65:40: sparse: sparse: cast from non-scalar
>     include/linux/bpfptr.h:65:40: sparse: sparse: cast to non-scalar
>     include/linux/bpfptr.h:65:40: sparse: sparse: cast from non-scalar
>     include/linux/bpfptr.h:65:40: sparse: sparse: cast to non-scalar
>     include/linux/bpfptr.h:65:40: sparse: sparse: cast from non-scalar
>     include/linux/bpfptr.h:65:40: sparse: sparse: cast to non-scalar
>     include/linux/bpfptr.h:65:40: sparse: sparse: cast from non-scalar
> 
> vim +6322 kernel/bpf/verifier.c
> 
>    6241	
>    6242	/* check whether memory at (regno + off) is accessible for t = (read | write)
>    6243	 * if t==write, value_regno is a register which value is stored into memory
>    6244	 * if t==read, value_regno is a register which will receive the value from memory
>    6245	 * if t==write && value_regno==-1, some unknown value is stored into memory
>    6246	 * if t==read && value_regno==-1, don't care what we read from memory
>    6247	 */
>    6248	static int check_mem_access(struct bpf_verifier_env *env, int insn_idx, u32 regno,
>    6249				    int off, int bpf_size, enum bpf_access_type t,
>    6250				    int value_regno, bool strict_alignment_once, bool sign_ext_ld)
>    6251	{
>    6252		struct bpf_reg_state *regs = cur_regs(env);
>    6253		struct bpf_reg_state *reg = regs + regno;
>    6254		struct bpf_func_state *state;
>    6255		int size, err = 0;
>    6256	
>    6257		size = bpf_size_to_bytes(bpf_size);
>    6258		if (size < 0)
>    6259			return size;
>    6260	
>    6261		/* alignment checks will add in reg->off themselves */
>    6262		err = check_ptr_alignment(env, reg, off, size, strict_alignment_once);
>    6263		if (err)
>    6264			return err;
>    6265	
>    6266		/* for access checks, reg->off is just part of off */
>    6267		off += reg->off;
>    6268	
>    6269		if (reg->type == PTR_TO_MAP_KEY) {
>    6270			if (t == BPF_WRITE) {
>    6271				verbose(env, "write to change key R%d not allowed\n", regno);
>    6272				return -EACCES;
>    6273			}
>    6274	
>    6275			err = check_mem_region_access(env, regno, off, size,
>    6276						      reg->map_ptr->key_size, false);
>    6277			if (err)
>    6278				return err;
>    6279			if (value_regno >= 0)
>    6280				mark_reg_unknown(env, regs, value_regno);
>    6281		} else if (reg->type == PTR_TO_MAP_VALUE) {
>    6282			struct btf_field *kptr_field = NULL;
>    6283	
>    6284			if (t == BPF_WRITE && value_regno >= 0 &&
>    6285			    is_pointer_value(env, value_regno)) {
>    6286				verbose(env, "R%d leaks addr into map\n", value_regno);
>    6287				return -EACCES;
>    6288			}
>    6289			err = check_map_access_type(env, regno, off, size, t);
>    6290			if (err)
>    6291				return err;
>    6292			err = check_map_access(env, regno, off, size, false, ACCESS_DIRECT);
>    6293			if (err)
>    6294				return err;
>    6295			if (tnum_is_const(reg->var_off))
>    6296				kptr_field = btf_record_find(reg->map_ptr->record,
>    6297							     off + reg->var_off.value, BPF_KPTR);
>    6298			if (kptr_field) {
>    6299				err = check_map_kptr_access(env, regno, value_regno, insn_idx, kptr_field);
>    6300			} else if (t == BPF_READ && value_regno >= 0) {
>    6301				struct bpf_map *map = reg->map_ptr;
>    6302	
>    6303				/* if map is read-only, track its contents as scalars */
>    6304				if (tnum_is_const(reg->var_off) &&
>    6305				    bpf_map_is_rdonly(map) &&
>    6306				    map->ops->map_direct_value_addr) {
>    6307					int map_off = off + reg->var_off.value;
>    6308					u64 val = 0;
>    6309	
>    6310					err = bpf_map_direct_read(map, map_off, size,
>    6311								  &val);
>    6312					if (err)
>    6313						return err;
>    6314	
>    6315					regs[value_regno].type = SCALAR_VALUE;
>    6316					__mark_reg_known(&regs[value_regno], val);
>    6317				} else {
>    6318					mark_reg_unknown(env, regs, value_regno);
>    6319	
>    6320					if (sign_ext_ld) {
>    6321						if (size == 1) {
>> 6322							regs[value_regno].smax_value = (char)INT_MAX;
>> 6323							regs[value_regno].smin_value = (char)INT_MIN;
>    6324						} else if (size == 2) {
>> 6325							regs[value_regno].smax_value = (short)INT_MAX;
>    6326							regs[value_regno].smin_value = (short)INT_MIN;

The above codes are intentional. if this caused compilation warning, I
will try to rewrite the silence the warnings.
Thanks!

>    6327						} else if (size == 4) {
>    6328							regs[value_regno].smax_value = INT_MAX;
>    6329							regs[value_regno].smin_value = INT_MIN;
>    6330						}
>    6331					}
>    6332				}
>    6333			}
[...]
