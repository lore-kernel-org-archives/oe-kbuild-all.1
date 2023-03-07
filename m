Received: from outbound-ip23a.ess.barracuda.com (outbound-ip23a.ess.barracuda.com [209.222.82.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D2C3D65
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 12:35:26 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48]) by mx-outbound12-28.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 07 Mar 2023 12:35:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xe11El1M4AjEb7pjVw67Bj/KGEUUlxZIP0mtW2lz+Ramac7Ld2KoTBD32ijcdDjQv1/UdyP7M2vVa5EmI7szORh3hlmBbDe0BfMy3wKTK5KvUwOK4d7pYCwFv3pqGk5Qf3WLTsqFpiXMBe12K7ARFWc4JUMjao5vFEYwgcjSvSEG1lsmylliU4tsn8nWYh45yBkWmZQysLe6SuQB4ue92jUT4Lc6YKFQr1N3nHqJ3Jwz3HBCZqTUmUV7Q5exxpRW3po8itfuAd0WbM3HlXVEmTTTsNY2AkAys/wC1kHCATHdTwdEo4DA8HZqa8+lZyDSXBa66tBWDZ7AIbXgPO1Vcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9a8GJLyRxarQiYLztDP2wNYrO1qoc1gM9a4xvNxR8A=;
 b=HNFxN/QsKMlz7cxbeAXK7rjm7m/Qw2IxnoZpVxKeabuVVDlSMUeFFqTZ5zjdJm+sLNYh0ecmsatF5zQIYKq6pJ9TbQXeyUHA1Iuu1gIGySzvuZzEa6q/8IzSOfzzsC9BBLrFz9TsF1D3Hhq04kpsae0euCfB9oX8CIC80ouiiAiZA+wP1OTqlVwC5RJHXwcrAwvsR+kqNeuUxFd6drULmUcQ0TlLTKjFKQlO3/OsgVM72Lj5wfvi9ofETsBo/We2zviLn85VYpEec1kvmSWc+doBJZHvwtA0aTuQhu5HZoSfqTOZp3/gypXSEufYpC78A4JFYAuo44YxOR0/I2L1+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9a8GJLyRxarQiYLztDP2wNYrO1qoc1gM9a4xvNxR8A=;
 b=EC2WflRW/52sBDYnuQ2HGBirPWKvu0U8YxZNI+Vkywr+jTln/tZEinnTeIJ7qL5adH3L1eZK/sWZ9eknIVe4IvdueEz0YLNpu19kybsiUv6ZwCxj7qVUKgo1brlyaUP0I2GTAb8MyMTFGHtC+UcosNwPMVlwPyy8jlvWyp0wJPvmPiYd17vhyuSUflE/nuz1gnFrXq1pK/ZxmHMSmkkFJN3DEnhYIxQxdTtYtv9+8fznFinWRLb8zb9Y3rSHKmIuedLpFv/qyyVvzA8ntyW4U6PHF/g5wCWk+gaGWSrBoNPa2xShC0TD9C6XhweekcuHtIMZL/wVvDmTcfBYj7EqRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from BY5PR10MB4370.namprd10.prod.outlook.com (2603:10b6:a03:20b::19)
 by MW4PR10MB6395.namprd10.prod.outlook.com (2603:10b6:303:1ea::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Tue, 7 Mar
 2023 11:02:28 +0000
Received: from BY5PR10MB4370.namprd10.prod.outlook.com
 ([fe80::88cb:a839:2d87:1124]) by BY5PR10MB4370.namprd10.prod.outlook.com
 ([fe80::88cb:a839:2d87:1124%2]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 11:02:28 +0000
Message-ID: <53a77a8a-04b9-221a-73a3-efb1917324e9@digi.com>
Date: Tue, 7 Mar 2023 12:02:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [miquelraynal:nand/next 2/4]
 drivers/mtd/nand/raw/nand_hynix.c:740:29: sparse: sparse: invalid assignment:
 |=
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <202303070644.Kvs6l6g9-lkp@intel.com>
 <20230307101118.32d36af5@xps-13>
From: Hector Palacios <hector.palacios@digi.com>
Organization: Digi
In-Reply-To: <20230307101118.32d36af5@xps-13>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR08CA0117.eurprd08.prod.outlook.com
 (2603:10a6:800:d4::19) To BY5PR10MB4370.namprd10.prod.outlook.com
 (2603:10b6:a03:20b::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB4370:EE_|MW4PR10MB6395:EE_
X-MS-Office365-Filtering-Correlation-Id: 231b0ee9-f967-48c8-f002-08db1efb706e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EYqF8sY/2i4Vq0Zyf/jHreh9vh/l2tndSgJAEAIqdt1rXw9VWQ3WRXt3V/ith7y7SOkF/LqC3Jgi7K+sV6259lU1Etxo71dNdw0HX8RsmuW4RAw/Ew6pf66URjqaUHfrym5icBUEnzHWds50qKSiYUT8I6X18Im99XKj1+bIoe7vNhkyU57PqNdLiFSRMJC0g34M5S6dGMAtTASTw3G0uSDclzduHkdh9wdSj0MtqygmQPPPeD9dpbFJf7oS4ljFSD09Xbit4TYTLHj4QL1X1h9JeDPdwEDHjwq5rzYO8gOxfcX6c+n5hkGj9l+oOby6rpea675IFCqbwP2H9H1IM0grnV61RCZ8mEaSNy8HjIf2Ib6Ww02GyuNqUuiYhLmA35GKbkCapJ3DkvxAOJrPY1LvQPCyEtrAKlkky35Ors5ZjQq7PEtYpMVmB6PJVlYtvzEnEBGJmGG59Cjfe4uiY7SaSFHVi478lCvt035xt4rsnlZUONKfWEgk9bbpxxKjfhDOg13Jm6AdtPrfsDQ+/B2UdgzMWgufyWJJFABuHB9OoOybdwT3T52RoCWxn6iHMwfPLcOb2MA9SQO8/iRjJA4wHcsnq0hmw1j5dDwkFYAwX0AlbIKK+bi/ZJL8QnMRiVgpLlBPaqJTGSGbWcuouS1rcdInDfg64ZM2GV95r8fEQ6AHrwTjcjPIzE/8sI1+Ey6KWOMr9+u1lX2sD6NKPt4M0FnhNz9JBy7p1CSOz5flHigx9uggqQwpWCOM1b9R
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4370.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(396003)(346002)(39860400002)(366004)(451199018)(31686004)(66476007)(36916002)(5660300002)(66946007)(66556008)(110136005)(41300700001)(8936002)(8676002)(4326008)(86362001)(36756003)(31696002)(53546011)(6486002)(66574015)(478600001)(26005)(6506007)(6666004)(966005)(2616005)(6512007)(44832011)(38100700002)(186003)(2906002)(316002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFZiMmRIZDRRS0NLMkc3ektJKzN6dDREMHU1VTA4VE5pbTFLUEFOZit2Q0JC?=
 =?utf-8?B?TUdtUGk5am5zN0hZTkRFR0VQSzN5NzRQZW1CVzd5R0N5NFp5TEE1V0tJY3hu?=
 =?utf-8?B?eDB6MlBzMFIyU0dvSS9MN1FQbHlIRGU0bXJWREIzUllVQ2pGRXdjaHM5Z3Nq?=
 =?utf-8?B?T1llWktlc0ZkRVFjbGF3K1lPeXNBWkt4QVExelZoRVhGY0d0dURuSFM3bjM1?=
 =?utf-8?B?SDdKekJPM3JuREZqUXYvRXNjVGdHQ0l0em5aTFFtNDBJVTZMQzIvcGtxcE95?=
 =?utf-8?B?SU9DNlM1T1ZJdUp0bG9uYytlaysra2ExaHd1RWFxT0JUdHRra25hdU1kaGFt?=
 =?utf-8?B?TEFtU0duUUsxRlZJWkFZMmwxRytpaHFMNVQ0b0NYaDA5ZE1NekExQkRoNnE5?=
 =?utf-8?B?TU5CRGdkN0JySFBPUzVCOEtubDBMSUI0ZVR5ZUtoSHk0QTRrVzJMeGxka1c4?=
 =?utf-8?B?UlhNRWU3eE4rRjc3VUFsbU9JMGVNdGhwRVVnRVN1RHo4NHBXZURhWk5mRTFK?=
 =?utf-8?B?bERGSGZSYkliY2xEeTdiZEhIYzJPYnVDUi9mcGZRTFNSaWtFbWEzNkp6S3B2?=
 =?utf-8?B?Z0xNSWpSUGdwZEE2bDVHcm03RGVDVndGR0JhaVpDbnREOFFNd3Z6MHByMFZG?=
 =?utf-8?B?SnExRkdSN0VlWFJJMVlkK3d6Mko2Wm0wbVA0cEh3UlVBTDVWWTBOSXNmeTdP?=
 =?utf-8?B?TzlZODQrN2FKRDFSOFdSSTN2V3pqZUxYZmt5alhyQjJqU0EzUDByM2NoKzRm?=
 =?utf-8?B?MC9oY2RuT3pyTUlRNFZhSVVvNmJaUmVGcjJlN011UFl3MVhCL0hPczdOdVRE?=
 =?utf-8?B?N0E3dWs5OGNoejg4TmJSeGRSNHRyalpka091T2RVb0grMmh1SE5nVjVPZlRL?=
 =?utf-8?B?U1YxQ0RqZWZsaWd6ZDVBLzFpMFphV0JQUEhQRkxrNUdaUE5uM1YyY2dxODlV?=
 =?utf-8?B?bmgxbjhOZ1ZXSDhCcVZSUjFHK1hXSzBtYU1RWEcxTlZiWk5rRmVDZVlHUjk2?=
 =?utf-8?B?aHhlcGxzdy9RSkVVVklkL1FpeE5rWW1ScHE2MlpnMWZBOEhESTlaV2s3TUJC?=
 =?utf-8?B?QytlUE80QkxBZ3RhellicFcyQ2JMRDU3anJOdUpNVjBLdllycFRMSVRGNHZ5?=
 =?utf-8?B?cDFoV2RzaVpucDloVTRaSWZOQUJNdGtCamxUaUo0K3RlUlRkelFrMnRuWU01?=
 =?utf-8?B?Z0VCN3hucnJIclFpaExXT3hRY1VJRVFOQjQ1eUhWdTYxNHZlc0xjY1M0YnRM?=
 =?utf-8?B?ejdadzduajk5SWZsSVIva1Q4Z0xPeFQyUTZ6VGVpeFVDcXVLOXA3MDRjWjBB?=
 =?utf-8?B?eXdkZ0JlNTBsMTVhYU9yUTErb0RwNXVQN3ZnZUtyV1pudi9XbHRtWkl4MDlQ?=
 =?utf-8?B?QXI4eHZlbWFDYzUrZnczQkIxTzIxRnFYeWd2NFNZSGR6THlXRzBEb1pzWWR0?=
 =?utf-8?B?WUlSNVpqTEVCSklzTTJ4MkJPUTVmbUsxMGlQdW9EWTMzT1diVys1blFNNnRw?=
 =?utf-8?B?QUJScm8yN3FBc25GUElWZVZiVW9wUWxHQ3hpZEo2bUhQbUQ1ZVM5bFEvYXB5?=
 =?utf-8?B?RXpEMlZtbFYxUXViUzFHd05yMlUwRmR4QVRPWWY1Q3FPbERtV2pPbStXYlhM?=
 =?utf-8?B?T25keXZyUkFjanorT0Fhb2hmczlRWFgwUHBMVnh1aFc2MWhxZitUSWQ4OHNZ?=
 =?utf-8?B?YStudmYwUC9Qc1FHMmkrUThxeEtOQmhsNVZlTnlBSXBOYlBrTlpTMmlnOXJO?=
 =?utf-8?B?QXBzWWtJMnNxdTZqM0YrWDRoZE1BS1p2WkpwRTRlcTc0ZTNNOEJOWVNMVmoz?=
 =?utf-8?B?NUhGYkQvcFFTQTdIZVZXYmtlTU5nVlVSWS85YjdqT1Q4UzZCelVZMlVXQWow?=
 =?utf-8?B?NEhOUitxWXhZWHFKLy95NmdPbFNNdk05V0d1bFpha01sZUVncHJZZVJ1bXZB?=
 =?utf-8?B?UTJWMHAvNDRMQTVzNEFPM21nK2ZvTTlUZWhFbXhRbGNuSnZScXJBa2cwZklD?=
 =?utf-8?B?VmlSdGpDRkdzNUdnSk83UWcyaU5aWTZYMFhjUkZKTTNNUnlHZ3cyYXVCMEpu?=
 =?utf-8?B?VEVjK293L2M1RlUxcVJWMEJlWTcxbEY4R1JxYjRPTExNNlI2RnhNV2w5Y1F4?=
 =?utf-8?Q?CPmPWZSZkFdEOXfFUax54fF8I?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 231b0ee9-f967-48c8-f002-08db1efb706e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4370.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 11:02:27.7968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04MiwMrdlToxd7vsDqPoHg+1N+i6bQ35IrWINWHh7M/P5DoDkDgQp8pSXgTk6oUdQszyANAu/a4xtoclVn7jDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6395
X-BESS-ID: 1678192524-103100-5445-2014-1
X-BESS-VER: 2019.1_20230302.1753
X-BESS-Apparent-Source-IP: 104.47.66.48
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKViYGhpZAVgZQMNU8ydDIMNEoyc
	Ai0dLIwNgszdjEyNLSzDQxLSklLTlNqTYWAGsPjcZBAAAA
X-BESS-Outbound-Spam-Score: 0.40
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.246625 [from 
	cloudscan12-128.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
	0.40 BSF_SC0_SA085b         META: Custom Rule SA085b 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.40 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_SC0_MISMATCH_TO, BSF_SC0_SA085b, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status:1

Hi Miquèl,

On 3/7/23 10:11, Miquel Raynal wrote:
> [EXTERNAL E-MAIL] Warning! This email originated outside of the organization! Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> 
> Hi Hector,
> 
> lkp@intel.com wrote on Tue, 7 Mar 2023 06:23:31 +0800:
> 
>> tree:   https://github.com/miquelraynal/linux-0day.git nand/next
>> head:   fa07e65008e7068b7d11d09dc932326ee1245ee3
>> commit: 2e3927b0ea56ffae4d05477691210b7b06f9b599 [2/4] mtd: rawnand: hynix: fix up bit 0 of sdr_timing_mode
>> config: parisc-randconfig-s053-20230305 (https://linkprotect.cudasvc.com/url?a=https%3a%2f%2fdownload.01.org%2f0day-ci%2farchive%2f20230307%2f202303070644.Kvs6l6g9-lkp%40intel.com%2fconfig&c=E,1,e8E6pVSfCmyYe6P8C1uxpRMvatzPmWHHZF4elQmnFNmaOxc3dpA5JSlJ6OXAxboFStuF3aK8ynr_bKFJCRr0cBFtTvagFJPmD9kZKL4fmzUyHUKT9DUeqHHSWgu6&typo=1)
>> compiler: hppa-linux-gcc (GCC) 12.1.0
>> reproduce:
>>          wget https://linkprotect.cudasvc.com/url?a=https%3a%2f%2fraw.githubusercontent.com%2fintel%2flkp-tests%2fmaster%2fsbin%2fmake.cross&c=E,1,l4j75gzkJ3QukxeYHfHdVo5ppuc7jI3pQezZ-DrvXUTfGPSrPXBP1cqkNu922e2sFUUYeytPdCpzTaZ86YNAx7RqvObxUeVBjURUJELM&typo=1 -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # apt-get install sparse
>>          # sparse version: v0.6.4-39-gce1a6720-dirty
>>          # https://github.com/miquelraynal/linux-0day/commit/2e3927b0ea56ffae4d05477691210b7b06f9b599
>>          git remote add miquelraynal https://github.com/miquelraynal/linux-0day.git
>>          git fetch --no-tags miquelraynal nand/next
>>          git checkout 2e3927b0ea56ffae4d05477691210b7b06f9b599
>>          # save the config file
>>          mkdir build_dir && cp config build_dir/.config
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc olddefconfig
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc SHELL=/bin/bash drivers/mtd/nand/raw/
>>
>> If you fix the issue, kindly add following tag where applicable
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Link: https://linkprotect.cudasvc.com/url?a=https%3a%2f%2flore.kernel.org%2foe-kbuild-all%2f202303070644.Kvs6l6g9-lkp%40intel.com%2f&c=E,1,TthPu-XTk0RVTLBc0NSr8Yta-Wzt4B8oXWEZwkC-43Pt8UM9fpRiWqkGSBMqalMa53pZuaRwPU4ZLreAfgVkWgCkF6Y532x-RYNqNHqir_Juxz705Q,,&typo=1
> 
> Sparse isn't happy, could you fix it and sent a new version?
> Please don't apply the above tags, they are only relevant if there is
> something to fix that has already been merged.

I need to do:

	p->sdr_timing_modes = cpu_to_le16(le16_to_cpu(p->sdr_timing_modes) | 
BIT(0));


to make sparse happy.
It's a bit unreadable so I was wondering if there's a cleaner way that I 
may not be aware of.
If not, I will submit this.

> 
>> sparse warnings: (new ones prefixed by >>)
>>>> drivers/mtd/nand/raw/nand_hynix.c:740:29: sparse: sparse: invalid assignment: |=
>>>> drivers/mtd/nand/raw/nand_hynix.c:740:29: sparse:    left side has type restricted __le16
>>>> drivers/mtd/nand/raw/nand_hynix.c:740:29: sparse:    right side has type unsigned long
>>
>> vim +740 drivers/mtd/nand/raw/nand_hynix.c
>>
>>     730
>>     731        static void hynix_fixup_onfi_param_page(struct nand_chip *chip,
>>     732                                                struct nand_onfi_params *p)
>>     733        {
>>     734                /*
>>     735                 * Certain chips might report a 0 on sdr_timing_mode field
>>     736                 * (bytes 129-130). This has been seen on H27U4G8F2GDA-BI.
>>     737                 * According to ONFI specification, bit 0 of this field "shall be 1".
>>     738                 * Forcibly set this bit.
>>     739                 */
>>   > 740                p->sdr_timing_modes |= BIT(0);
>>     741        }
>>     742
>>
> 
> 
> Thanks,
> Miquèl

Thanks
-- 
Héctor Palacios

