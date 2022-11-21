Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BE87E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Nov 2022 07:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669014326; x=1700550326;
  h=message-id:date:subject:to:cc:from:
   content-transfer-encoding:mime-version;
  bh=W3SPrEs3LU2CsbV3InDe6y3mQHPQoxGnuaNDbEzG+j0=;
  b=SOxDRY5l0jsZD53/eGT5nSianSDHq0u2aj+Hi04FuwxTCyjlazwTyrXT
   VztAeXrKvBDHURfYdwKUg36mNNn88S2A2BI81uiy33SJm57+CUzHiMx1i
   cxa33ZtRQ9pwiVilvMwXLtkLBd/PDnO3yKxfcglAqqDGY1FNK1dbqu9Uu
   NC8F4WGQQ4urgiX2Jmw0xsRMsVDU3/YZx95gquzdcZQ+h6+QNUoM30BSi
   eGA7WUdY6p/KHZB1/FJ6cEYEBfby3bs4IKNJu+rO/HsjsKYhslJ3f5wUb
   a/avWLeTimYTzn7kkj255CDt0GtnI8ql5ZXLp//nUfzolCeld+c1YA/H/
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="377748660"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="377748660"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2022 23:05:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="635084916"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="635084916"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga007.jf.intel.com with ESMTP; 20 Nov 2022 23:05:26 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 20 Nov 2022 23:05:25 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 20 Nov 2022 23:05:25 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Sun, 20 Nov 2022 23:05:25 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Sun, 20 Nov 2022 23:05:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNb1fHnkXH3iLt78Ex+dWDpOUgpRi6wntkum4YN8Xr+O7Zdju/8L0OxjqvHSR8jIhw6xrQHIwJ5SVJavL9I6br2qgtBMPMs6fUFVTYv7jgJnVUxVCq3Eyz/hJMQSHN7MnNOqArqhC6S/fTLU8exQsY8t8FeJGFzKYg9jHOdpZ6q8o2xnyJB9KAbWKtBRtEAnb+HBr4pWidzGUQVP3Qv8DMDx/ZD9/9ILlOcMKxLjtReISfgfpFs0ywg1YFMHzFacM3LRW0WeZ/4+GCHK00CPQ6hMd3glfnkqloIrrcwdeY163t4+/npUW7L6ENL72zaD0wEb/SQ2W1SeDu6y0f1oWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7k5E3jqU9xLwTsi9zX7gwq9gCjaZhlMyLlBuUcy6HyI=;
 b=lGMQdadMnYOV+weDlKwOpi29lOr1GK0j27dUkZPIw/tPG+ZGeTlfUntHktt5ABJZcpWA6OASeEN2jWpPcy/VEFraqbGaz8gOkEBGA8bcyyLUCE0nB0iFYn3dfmpRpvSn9SEo59EVxCgAGrMZhxQsrZpKhLsMjmxpWclOac25XQPg0IgzF/EZEuDk5XTz8TxDrtvjiJR4l2blwM7Ws/SA14J1majw9O+7/c4IkuaMVt586lEtEYp9poF545XIcHQUp24Rsv0a1FQ0pu+whjl2s3ugb5QXa1YuJDxRMSXYiOMvN6x3esK9rSnIHsD5q7Gr/L4tj+k2NmWaq4pCpBD4dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by IA0PR11MB7696.namprd11.prod.outlook.com (2603:10b6:208:403::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 07:05:23 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::513a:f91a:b65c:be1d]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::513a:f91a:b65c:be1d%6]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 07:05:23 +0000
Message-ID: <4b6ffc0a-4461-5fb5-6b47-769e0433a2c2@intel.com>
Date: Mon, 21 Nov 2022 15:05:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.0
Subject: [djwong-xfs:iomap-write-races-6.2 39/39] fs/xfs/xfs_iomap.c:
 xfs_errortag.h is included more than once.
Content-Language: en-US
To: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: <oe-kbuild-all@lists.linux.dev>
From: kernel test robot <yujie.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0179.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::35) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|IA0PR11MB7696:EE_
X-MS-Office365-Filtering-Correlation-Id: c2fd30b2-f484-416c-b52c-08dacb8ec144
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ByDnUo1oF5NZF63rsA80X+O0/Zl18w0wYBPq46eI+w+lr2aT53Esckca1Pqc4mRzip5jFFy1siQu29GNsK1xu+wt4IcsbHqefdU3GF8yseCvGr1bSo2uGXLaNc1bDHqT6C9N2SbCSVTwdaiS7m6z1dnQmTGttXr4BsjCYGpFMQFhnzxULydis3lhONq7zYireKDMIlF30wSY2/r/vJNR/d/6OHWFHyDfPq3jAWZbjRq3yxtTR/S37Hi/0rkCsjufsu3lztJNRGh7U0ucQ4hFO2qTIoUicXKnj4hmSNYccYIaFkkLKVo8MKo+26hM/lJsayG/3w2v5hcFNOMqZAusD7P99lzJvw6WgVzZYrD4lj1bLNO2jSfwmFahbriAQxGY/33KNw5hXodoXQrv1SDvJMnfTGJq/I/+z/EcixyjEsO7EVoNBD0IPGyDHb5ZDJMJmfR4WMwMVUYGdwBZ0rnV0q7y4hExEIiAU+PtjamAFd3YLfYp1x+cIYJrQwBKGEYAFMtUc1tk49h3FL7Ozi4F/O6dhN8AbxXrDvsdePQ/Uy2KKQsdpc/JBvpdGTNPI1Jf/nxxyr8YQcnfXFRmoHvasi0f1FCetyTmgohb0pCHxKEJ5PP4JfVUkVCeRuGQIGjn7C0F66qCKbZafMecJsrR+RdtcaitG6WBcmkI+jgN/gw3I09GCU3kNtY1043cyXh5LXbYI+EP+UcSu2NXeiRtc4+xKp3wyZl+dm992WdXhHG979pP/rTEMZp6eNvSJiXEa/VuQIu2ESssxYDCzI51NCf0ruZNnhb+AUv1jhjIMno=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(396003)(376002)(136003)(39860400002)(451199015)(38100700002)(478600001)(966005)(6486002)(4326008)(36756003)(8676002)(66556008)(41300700001)(82960400001)(66476007)(6916009)(316002)(66946007)(2616005)(186003)(83380400001)(6506007)(6512007)(6666004)(26005)(31696002)(86362001)(2906002)(31686004)(8936002)(4001150100001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEJ3Z3ljSUJ4bFloYSszdjhoL3NUc2Zmd203YUxRWkxLQVV4bVF3aGdNd2wv?=
 =?utf-8?B?VDVyZVAxZnlaNEVvRkcwTlQ3Y1ZSamt1MEUzMjN0WUJ1cFFud3JTL3d3ZVhK?=
 =?utf-8?B?OEplT1Jpcm9zZVBzY05oYy8rZWVzVnlCdnpmeDk4VVZZOVlnR0xVdUFzd1V1?=
 =?utf-8?B?R1VCUnFITS9iRENhc1lqQmVuRTRTc3dncFQvd0UvSFliTDlWdnBQdlRwZDA0?=
 =?utf-8?B?c05ZMDhqNmU1a3p0bC9OVjQyL3drR3VpS3kvM2ZsWlNicUxUMDR4K1BPWGJn?=
 =?utf-8?B?OU1vUXg1RXhZeGZsZk0rclBZM1gzT09PUDJEN1dmN05vWWVPYTVhZzJCVXBH?=
 =?utf-8?B?M0tqcHdyaVF0Tmw5Mnk0alBpTE9La01PQjA2enRxZDVVcytWa3d5K1VRWGY5?=
 =?utf-8?B?NzgzdjJha0R1a3QzNDFVSTY5WUd1TndWNGZtMnM2Ty84U0x6R0lRQmlTUENL?=
 =?utf-8?B?RkpqUDhUNUdQa0lyN2NUYk1yS2hqd2UwYi8vQ3M2TDRUSDQzR2VtRTRFOS9h?=
 =?utf-8?B?QUV2ZzZOaFE0MzUrYTZZaGI4NW9HcGRpd3dSYmtna2M2R2p6QzJKbmEzUUVp?=
 =?utf-8?B?QWtHaGFUT2wzYmsyVWI2RU5xMlNRaGJwN0poN1BPNVp0UHN5RnZQOWN2NVky?=
 =?utf-8?B?TGhsTlNZVkNvS0FMdkl5UWxHa1VZSFBHd25HRWt3TjVGVDJIL2hkdnJJU3Bi?=
 =?utf-8?B?R0IxUS9KenZyVVNCL01MYlU1aXM0UnZUemlXSEErMW41MWtQMWRKYU81cGxP?=
 =?utf-8?B?UzVJYzBhVkwxVFRvZGx3ZHd0UDM5eWtCYjd4QUFZQ3hQYmRibEtTSGNhalda?=
 =?utf-8?B?djA0QXMyVStXa21HRnVZdVFhczcwR0RIa1pCNDFWaHlYVnU2bVpyRFdYSi9W?=
 =?utf-8?B?SjVJNTRLU1ZtUXZWeEFkMVdCbE5MVVlld1QxTlpidVNRRi9MLzIzcENnWWJI?=
 =?utf-8?B?UW44Q1l1eW1jNE9iSlVpcjZ3dFoyOVdJQ1pONmVpUHFEZGwreis5TjRMWnBK?=
 =?utf-8?B?Z05kbGVVSHZycStZVzJlZ08vQmJabVFRYVhxRUhGSHQzTGdEMlJlQnhMOUZQ?=
 =?utf-8?B?dFozQmc4cjdVSFRIZlhsWWpYMDNjc21GQklyTWVrVkFTSWVNVlJDMTR3Qnhp?=
 =?utf-8?B?cWtKa1laUEI1VnlUL0lkZ3g4dmEwbzM0eXRTL2ZnVUk1SmJodjYyOU1MRzI2?=
 =?utf-8?B?VXJRcDdUaHRzbU8veURNWC9QZFBmZy9SS0JKKzJVbDhoRWdSMUV2OGVWMDJm?=
 =?utf-8?B?YzRFajNZYXdvZVpQbkM2enR1ckY2ZFkzdU1BK3pRdExqcE0xV2d6RUxadjhL?=
 =?utf-8?B?T0llakZlQlFaRktoMGtUVUdNNEJaSS8rand4LzRLUDNteStkd1hVNHVLbFpo?=
 =?utf-8?B?NkpPUEZHcG02MnhZWE1sQjBkZjZuY1VmWFk1UmE2YzlHRk9iRG9oYThOeTBZ?=
 =?utf-8?B?aFBIeWVhQUNJUUhZNnovSlljeTlvY3F4ZXlHbE0vMkhHOERkU01oNERTTWhx?=
 =?utf-8?B?TXV2dVF4b0RPUjBITENMcUdlK0cxLzFWUDVIZmhnQ0xsaHIwMVJrVHhsOFEx?=
 =?utf-8?B?UEZhZkUvTmtsamI3eDhxYWl1aCtnZjhucS9tZ1Axckt0SDZVb3NhUTFvWmdH?=
 =?utf-8?B?TzYxYnhnZkZ3Ti8wM0IwQjJtTDhQS09iazhZb2ZVck9wL2d2QVl1bXdRS2Zp?=
 =?utf-8?B?dHRRSW12SjNidzJDRlp5Y2xVUmJUNzVnK3o0RFJ6Zm9VQmlHN1VXbUVpL0Nl?=
 =?utf-8?B?RHNiTDBFQS9uaWFJcGdXM3IvTUxMaGtkRHQvZGJ0NUhXN2g0aXhKekh0SWc4?=
 =?utf-8?B?SW93MTFYdEJpMS9sTmM2SHZqNkJrOERUaGNLeUJneW1qdjZWNTdJRkFSMmdU?=
 =?utf-8?B?NkUxeUlyeU9MT3g1R0VLVE9sc2tLaFozZHQrQTlDKytaVlduSEdRclhQRXFI?=
 =?utf-8?B?L21BMkN1WjVPQ0RoMk1PT2t3SSt3SmZlS3F1VzNOc2VFelhLUklaU2hHRndt?=
 =?utf-8?B?QjNaRVBId1ZPS2F1azU1Lzh6ZXZ3U0lub0xtVUNteVMrZ2NiZHNtUUxLc2hP?=
 =?utf-8?B?S210dVNoREtFNXVNYkp3cjhxWSthSXpaSnRiWktTdXdIaTB1ZmpPb0NoY1B4?=
 =?utf-8?Q?4NKV1rVuoT54Uf16Y+FwrUH7J?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2fd30b2-f484-416c-b52c-08dacb8ec144
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 07:05:23.1049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WsTqBG3g0Qh8F9wB1bcVGxNpyRY5d97jug0TKA7n94pexTr2UvnQ1kbXfPvTx0j65NjBUeQYRYaOqP+PzGe0xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7696
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git iomap-write-races-6.2
head:   ae19972d368b6a3d9ea239c6c77411ce0ecfcc00
commit: ae19972d368b6a3d9ea239c6c77411ce0ecfcc00 [39/39] xfs: add debug knob to slow down write for fun
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

includecheck warnings: (new ones prefixed by >>)
 >> fs/xfs/xfs_iomap.c: xfs_errortag.h is included more than once.
 >> fs/xfs/xfs_iomap.c: xfs_error.h is included more than once.

e9e899a2a8c3c (Darrick J. Wong     2017-10-31 12:04:49 -0700  @19) #include "xfs_errortag.h"
^1da177e4c3f4 (Linus Torvalds      2005-04-16 15:20:36 -0700  @20) #include "xfs_error.h"
a4fbe6ab1e7ab (Dave Chinner        2013-10-23 10:51:50 +1100   21) #include "xfs_trans.h"
^1da177e4c3f4 (Linus Torvalds      2005-04-16 15:20:36 -0700   22) #include "xfs_trans_space.h"
a39e596baa07c (Christoph Hellwig   2017-11-01 16:36:47 +0100   23) #include "xfs_inode_item.h"
^1da177e4c3f4 (Linus Torvalds      2005-04-16 15:20:36 -0700   24) #include "xfs_iomap.h"
0b1b213fcf3a8 (Christoph Hellwig   2009-12-14 23:14:59 +0000   25) #include "xfs_trace.h"
a4fbe6ab1e7ab (Dave Chinner        2013-10-23 10:51:50 +1100   26) #include "xfs_quota.h"
76a4202a38869 (Brian Foster        2013-03-18 10:51:47 -0400   27) #include "xfs_dquot_item.h"
76a4202a38869 (Brian Foster        2013-03-18 10:51:47 -0400   28) #include "xfs_dquot.h"
2a06705cd5954 (Darrick J. Wong     2016-10-03 09:11:33 -0700   29) #include "xfs_reflink.h"
ae19972d368b6 (Darrick J. Wong     2022-11-08 16:37:17 -0800  @30) #include "xfs_error.h"
ae19972d368b6 (Darrick J. Wong     2022-11-08 16:37:17 -0800  @31) #include "xfs_errortag.h"

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <yujie.liu@intel.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
