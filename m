Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C989D65B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Apr 2023 06:14:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=isnxCws6iZrPnWbw7Y7JVU3YL5AzPsIg/sWEOFOuVCId8Z5gpZy3WZsETe7di13GfuMoeZwFOm16uv+ebDQxNrs1iDYvj0qo3plDi0/AaImTNipqiN1rlo3nQQnJujrP6OVYFoxaSl+6O7+heL/hDKn7vc1NMctVPwjL/WvhuZX8RueTDhn9wVzk9TWbr7Z9xuTmw3Gsnr3sibAoq9/Ada5gP3fo4k23XU3VK5UfYn62eT4UW1tnporEl4ttV8Hl2K2oLUlQURs+nEuQAO9lWtSBTv6b2WiCLseuik/9/Il52TjSUnOlwO9I1tc/UwLDVUILU2zUp4haJ/l9OHQgBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hI68/cJhnzRwoK8Wq+l6JxodED80YHfxvxWUcJpQknk=;
 b=IJ01KJsukD9jvRjlGr2rzXP3cV0qaOVBfzLTlHIEofHa5TTDpvZuci6JZUxIHQ5ov6XFoVG5VGHjJT9VzIaC0XhyTJ+MwWUcYyAJ5Wt3yAEdl1PCLdmfY+7Qe8Hk5sTRQH2KJehLSHaiMpwkrIqCtsB5JA0E5yEM0/f3x8whpw/lM1VjiMKqqgwqyblRQqUnYobfEd3USyoJwWJPnC2krYaOXoYWIjmVbencq3CtqkIasZSKJOucx+lY90d7dzgCOE0hdYHKGi0K5JGhMb1NjNMRNMjvu9mUdDR6PYX+2bzNsuX/bY6XNNAuW80KIojupExmrzqWeaq3SLaiXIcv1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hI68/cJhnzRwoK8Wq+l6JxodED80YHfxvxWUcJpQknk=;
 b=h8kPlpRtpn5jVAH0O54PDzW9auj85/lx0LZd3OgkPuc8i8e9lc0NjMr9zkSglDxraCXzxrQHSRhRewjU8ve1Pbx3u2My/zSX826bsSCpqKkgFOAki/oNeFjrye2SmylvCYq9bQOh5Be1NfVDK/RIfwwbgWxEv2J5ZZ+3ZgtWph5Q9r+7wCTeCzWoGZGb23FmnbnNYo983UT1WUXksYRLLSAJ5MNrqlLxUfF2kU5sgDVkZBv3UCesuoUdZUw/cxnxtsmSxxhntYePcbo3Ob1dZ9pNL1i9A7ev62Ac38hsC4rXAJVjywoKlz2kuGPi3i9K9YKFcTZzhZXQtdUmsyqGaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB6288.namprd12.prod.outlook.com (2603:10b6:8:93::7) by
 BY5PR12MB4100.namprd12.prod.outlook.com (2603:10b6:a03:200::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Sun, 23 Apr
 2023 06:14:00 +0000
Received: from DS7PR12MB6288.namprd12.prod.outlook.com
 ([fe80::8b45:1076:977e:8fe3]) by DS7PR12MB6288.namprd12.prod.outlook.com
 ([fe80::8b45:1076:977e:8fe3%6]) with mapi id 15.20.6319.022; Sun, 23 Apr 2023
 06:14:00 +0000
Message-ID: <1387ef31-0199-c03a-6dea-23059f8acaf3@nvidia.com>
Date: Sun, 23 Apr 2023 09:13:53 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [jgunthorpe:rlist 24/28]
 drivers/infiniband/hw/efa/efa_verbs.c:1301:9: error: implicit declaration of
 function 'rdma_for_each_block'; did you mean 'rdma_for_each_port'?
To: kernel test robot <lkp@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Yossi Leybovich <sleybo@amazon.com>,
 Firas Jahjah <firasj@amazon.com>
References: <202304181904.gJUqVZ5N-lkp@intel.com>
Content-Language: en-US
From: Gal Pressman <gal@nvidia.com>
In-Reply-To: <202304181904.gJUqVZ5N-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::17) To DS7PR12MB6288.namprd12.prod.outlook.com
 (2603:10b6:8:93::7)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6288:EE_|BY5PR12MB4100:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f67db51-2c41-4433-8a6c-08db43c1edc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2WIs24Qv8cpLo1MEZcwJubH6ShG/t68qU720pxvCYr9SQqSEwcfA8W0QIcDjfltHXNNwq6WK7Mg8/mdt1I0AnDYu+fb4+1OPRQk/DwGRqMNNB5HzUPqkb0Rfklm2eVBv5uidx6jT7gDMk6KjrsBTm/QqX9SB/aWaRfDkNg51guGH6tqG2K/Pd+d0mTsWXkzVufhbXWUXOvhvUR0M07U3XbOWwJa1y3/RfghrA2l7ACR6dWtPtoHgKubULDjocrGqtGGfWPR3iBVgqwIxwJGFElGqaE6qnobFclttEWydz0lI4u9sFXeZpYmlj/CiMDPexbOQKpeVhujexESy62ByJwY8rp8+9xIeFNQ0sDP9qQtssD5tIl2ALEzcqtrtPfFbKadcI1OCdD2LJ+iWqyOzsuWNbkikbCmrrnSC/6hvDlp0gKF/XKnJh51vX4GaX3sBd7v2iLe92O1YLEUNqd/qtMqJsSANiUinQypqn3OSDwIznQXk0SpmJhHsFYfT003py8bEO+V837XIWt8Y9VcKjJKefwWZFLBg2nayUUnz4rbcYNF/lG54QfEL2CuE4uJYNFTWG4Rx0+H7P8UlLTDv8DrwJ3AxuTUXVWXFnLdnZkhTNw5mogGgJP0m/Rz07tWYqU//DtqDueC5feulO25NJKmGe1JxXHEtxKz6TaG9LRo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6288.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(39850400004)(136003)(396003)(451199021)(478600001)(31696002)(110136005)(54906003)(6636002)(86362001)(966005)(36756003)(186003)(53546011)(6486002)(26005)(6506007)(6512007)(6666004)(4326008)(66476007)(66556008)(316002)(83380400001)(66946007)(2906002)(38100700002)(41300700001)(8676002)(8936002)(31686004)(5660300002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEE2TWxkdmZpMjZCN2laT1phSEQ0emMwbUNYdHdINTJLeVZjaXBKUEtEaW93?=
 =?utf-8?B?WjhPVXI4Y3Z4UHRGcVFIZ3h4ekdQKzhMbzFLekEvdVBtTEJHbGdMK3hJU3Vp?=
 =?utf-8?B?bFpZRmNvY3hIaXE4M0JPR2NzcG9NVzVRVzhUSTlMTU1TZk1WYUhSMENvMmVU?=
 =?utf-8?B?STZXZlJ2VC9CMWNKYUxKZERQVjFCeVYvT01nV2ZyQVQ2Z0xhZEptdlBTem5n?=
 =?utf-8?B?aXFTekFZbVNpMFZYTHFHdlNCRndjWlBJMHVWUjkzRVBEOEhzdDV3RFk2YXh4?=
 =?utf-8?B?d2crTmtjS1lPN1A0MGFEVENZcytJU3R3Vkx0ZXd1c09VdGJ5aEdvTzd4MDBT?=
 =?utf-8?B?aTdXS2trQUJ6dmhPckxET25TS3o2dmtiVjNBUFZjbXN3UlFTWHB2cllTUWJC?=
 =?utf-8?B?RlgwM09hNHhqNFU3TUJaNG1zQzMwVFZlQ200dy9YY3h2UTdlRUdmcXBTemZ1?=
 =?utf-8?B?bnY5S0NLWUpnV2JXZkRZa1lqQlQxY2VWanJGRkU3M0xoK2laTTZRM1JMZ0N5?=
 =?utf-8?B?NzVTd2t1SUQxRHhmOHVwM3g4aVlsTVpoaVhZWHRGdkp5enhMUVh2TDRLZFZx?=
 =?utf-8?B?QS9EcEp3VVlsQ0V2Qk5LNjN4c3ZCVnljNHBYU1g2eVNHVFV1QjNXbStYTWlH?=
 =?utf-8?B?M1ZvbHMvT0w2KzhRWU1VdllhaVYxVHFLOFpWRmpVdktLdkVWREdGaUhTNkN2?=
 =?utf-8?B?MnlSQytyMW02TzM5UHZncTFjNmRHS2ZWWTlrMStzTVBLVUljbUllVlhoTjRT?=
 =?utf-8?B?UmdqRCtEbjdManJzT2Q0bk1VM2twSzVLUXhBTGw1ZDIyNngydVEvZWJ1UFBY?=
 =?utf-8?B?UFFnQXl6VGY4cjVkUTR2c1pYRDgrZkpGaFRBeVYzQUNtQWJlc3BOeDVTb0NZ?=
 =?utf-8?B?UnFpVEZtN1crRnRXYlV0eFpmaXdURSs2SGIxbHFIMEhBTWJFRjdYMjF4WGE2?=
 =?utf-8?B?bkY1WFpZRnBmeDZnRndJS25GVDR6Uzl2anltUUE1eG1MbS9pTFVXY250c1k1?=
 =?utf-8?B?aXV2SFI4YU5PZUVsTFl0cWF4aEV6ZG95dkJPMUlDam80UTZXK01iaVJUbDgw?=
 =?utf-8?B?ZXdMaFFGd1h2aHFQeTVXTUFaenFRM1lweFpZUTB1ekhlWTJuTlg2cUdFajVy?=
 =?utf-8?B?YUlNci9jdy9LTTUyU3YzQkl5RDd5M1NvSVpNY2dlNnVTNGZTVlJZOVRrWVdY?=
 =?utf-8?B?RXdnTisrUnUrYVJsanR4WVRXYmVGQ2pIbmhYZW5KcHpPcHdtZGtLK3VLS3dk?=
 =?utf-8?B?MUFNd0tYTkxZa0hlei8rM3M2RkxEVzF6N2JFMHJ5QURBdEF5NXBPaXlJN1Ni?=
 =?utf-8?B?UDhqTWhvK3FqVnczOUVjRkh6a3JSaGdIeXhLa0dicHB4SUlMcG8rbVVsV2Vs?=
 =?utf-8?B?L3E1ZEZieERLT2M3eVd4VVFDZHRURjVkVXM5aHRHNklxRDMyeUtwbnNVUERm?=
 =?utf-8?B?UHFNbXhPelU1SUJNbkFxMDByeGpiajVydmdkdzRSZkFxNjFlY0JLVmFoL0dn?=
 =?utf-8?B?Z3lHMW5EQmh4b21kSi9GcVRNSmU0VFdwZnNEdFJSeDFQR3dGMUk5dkpHbWh3?=
 =?utf-8?B?MGljQnVFM290eGZ1YnMvQlN0Uy9pbk9SWGhQcU5yZy91V1ZJVElWMU9IODhz?=
 =?utf-8?B?QktFd0NMOTNnSVBtVG5mNjBicmdWeXByVXZUdHRtOXBNbEpCeThIVFRPMkJy?=
 =?utf-8?B?R2sxZk9heWN3NzRFbkFkMEJxMlVBdGJVVWFBRDh5SjJXSkx4VWhvSGJOUnM0?=
 =?utf-8?B?dFBnS092V2h1bGp3bzhxcGFJMTZvaThkbnZNb01hOXhjYklsaEV5UTdpZUQz?=
 =?utf-8?B?QWVxeThYWlppaHBKTTlRMlRpUVQxNlRkTzRJUUhTMHQ3cHh4YmVVdGIzb1ox?=
 =?utf-8?B?ZTZ1T1ZYYlpybkM1djVkQmZSRmNodmgxZmZFRWZUalFnZlNIbU9UYmxOMVFL?=
 =?utf-8?B?K1Y5Uk1iYmdNVFl4cFBFa1RLRlBVcWtXUnFPYWIrdWtSM0REVW1SOCttejRN?=
 =?utf-8?B?QWE4WWFVdFdXK05oWWpnZVJjQVl3bXpBbTlwYWFCV2habkJ5SDRrQ09Ubnh2?=
 =?utf-8?B?bVdjdjNzY0VUcWoveHRUMld5cjUzd1Yrc015K3Z2NTE2TzA1TG5DNUxEV0ZR?=
 =?utf-8?Q?I7J770fG31sx5O9J4ccPyp/qd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f67db51-2c41-4433-8a6c-08db43c1edc5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6288.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2023 06:14:00.2117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7VTcnROJrgezbqkBJmk8y08extVU8vkoSJphXcrOOAYBBdg5TFZ8x7Aocxj1zhiU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4100

On 18/04/2023 14:17, kernel test robot wrote:
> tree:   https://github.com/jgunthorpe/linux rlist
> head:   a7cd9881872ca2566ca744155c307ca414341e04
> commit: 887d4845bf1627a914b5cc123f145cbb97f42c04 [24/28] RDMA: Switch ib_umem to rlist
> config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230418/202304181904.gJUqVZ5N-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/jgunthorpe/linux/commit/887d4845bf1627a914b5cc123f145cbb97f42c04
>         git remote add jgunthorpe https://github.com/jgunthorpe/linux
>         git fetch --no-tags jgunthorpe rlist
>         git checkout 887d4845bf1627a914b5cc123f145cbb97f42c04
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/infiniband/hw/efa/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202304181904.gJUqVZ5N-lkp@intel.com/

Jason, not sure what is this tree/branch, but seems it broke EFA?
