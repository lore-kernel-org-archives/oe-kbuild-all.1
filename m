Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1A17E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Nov 2023 01:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NRhK9z37"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700097371; x=1731633371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iTwdNiziZD0d6YPI0BbrdpUPZE/qdsngBVCc63Kgi0A=;
  b=NRhK9z37S8OWO6DStCZ9QIumZr1VnCezOem1/V8BDtZXDm8tEvMRo50A
   4TGM5C6w6Ja1MUkuNSDwcNuWeHjmvXwP7QY5F11jMikzPsLHmcQRHMshk
   6BhwHd0Oj8WY0Q4weXXqilCGe0wjT1aPi7PGuxZJ7nJOntyTFRIaJRvTz
   tchpeuomcF4V9MjFxS+stdehqm/Iz4tOknDlw5Oog/haOKRScnJI+4VVe
   hre1qCh4fKGlJcm5Q4TdWx6NOjkMHvtMDYXmPxsZH+jypXAWM3BMkpk8+
   MYONUMqZXeK3Rx33f1qLjGuJZ90H67GtlipH6KoTAQJAMZ2smjv3ZNGoa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="422081834"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="422081834"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 17:16:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="908950093"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="908950093"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Nov 2023 17:16:10 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 17:16:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 17:16:09 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 17:16:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cgYc94AGXhCVT63Vze5m3upgGeyPi7rGc0gP+oF90q7vqqURKqoGzhsYSSDtSZT5EvTm8C+OGVm4V+hsOEuHxcRPch5gsh8irEK/2YFBOAcTw3UGYupejtuq7ykiC5/q5XGrNap0oqeN5nDbYgbGfFvHpUx+FU3LmyycLapRUI6ftT1qPzClH6awqIqgGNLEOYGT4mOyZK91GRa83pv1hmfPqaeAptbaYc8CNuW91wsZx2nlIxIvlsw/gR3ux/JFl5o7aZ4YMgGqBWWjcc2O6JJM+94oHK36ZxhPuYGkjdhJbo8jopt7HzfkhuOY5aXHXQTPl6bjFSMKvOIQ8/8MiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbG8QBCRM248ZdBtCGsMBb3j1Lel+lRsbucWYr3AHzk=;
 b=dJmJbplF4VR0U4IRZKyNGq68f5NvIWPpSebDEjSzL36y3USs59k8OXIIXZtErFUc7stshbgJZeybaxqnWmYtBaypxYHKUbt7rN8eaO1E7mm0Q1BS7W1FjV2aI7D81F25m7fL9Xw9g3Aa5u4Zf+oWO00LNm7pzEPyp8WSK1LbGLWFCKqNRP1vvhur4fkLugKpZKZcMhzpOI73GGuA8t/eTxU/Zim62RD3LjxVXFRI+i8k92sulCbfzcExLWMJtxUJ2UMKzqKJ/PvcAPSOTNQ5fEgoX+4q+71BaWL/eXFCZv0McQEwjOFQaIPLBCmYmi1/sm14eL2f3rcQGjouYjVrng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by IA1PR11MB7776.namprd11.prod.outlook.com (2603:10b6:208:3f9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Thu, 16 Nov
 2023 01:16:01 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 01:16:00 +0000
Date: Thu, 16 Nov 2023 09:11:21 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Sebastian Reichel <sre@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-doc@vger.kernel.org>
Subject: [sre-misc:uti260b 20/27] dtbs_check:
 Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml:
 measure-delay-time: missing type definition
Message-ID: <202311160714.FRS5bWnD-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::18) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|IA1PR11MB7776:EE_
X-MS-Office365-Filtering-Correlation-Id: c5b61c24-d3fa-4bad-f9cd-08dbe641987a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h2S9P1LxC7aHDxEhnRJD1KV1+Oz9AsnxWF+j30bcBNl8uIGLzhtb2n66ACry8J05pzyu2JJLOsQ79hmgKR9jg9UlNKhHrxdL8XzVmCaFtdaKkYNmyAaDP6eSLoHYRORPQc8zrSVHKSWzc7pL6pY6GaW7c1PAdbvCq10e/xnZMELz6+xAZBdpad08JkPZ0ghilzbzeNxloFEb0WNWhsY/OvlNqvw6sgwHjr8wppVEIn1Rl6G8hYGVvjNWOeUL62aGfrVaDtph+r/eKjGFz6qXG3H2hHdSKQv5r7vnK1OX9G4UvFWXstCHJZBpLHEPvrLdkRZUzpOfcbxAkCDLLyww/S+v+bwbJLqTwXL/waXB21qzjLCnPc64Pb5cPwH8CcdfXNIoIsO7iIJDeL6+LH5I9PW8iQJrm2RwiACDnhTYvZJoNl5jK6Lsin80z5WiahveKXr4o1kZbXern5592LTWbyNhfkwP2rG8Z8zQWLaZV50vR4czqrbOqa/PAxgpcNQuzVyFawny1rO8NlXaiHmSFHH6h0YwWp7rEIideno/aWc3PZ49kb+rJBP8sPBM1tOY0oBWPLDXk6LggdLJ1WSpUA4+59+Ayr6Q6oJuiEdxszTt8QhcalpUEaYt+Ixnc3CoW0odaMWDYj6jf44UiIoZ4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(396003)(39860400002)(346002)(230922051799003)(230173577357003)(230273577357003)(451199024)(64100799003)(1800799009)(186009)(4326008)(2616005)(86362001)(6506007)(5660300002)(8676002)(8936002)(38100700002)(6666004)(2906002)(478600001)(1076003)(82960400001)(6512007)(66556008)(66946007)(316002)(66476007)(6486002)(966005)(26005)(6916009)(41300700001)(36756003)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?di/atmW05eZEGSwVRceS1FDD0NvUoSLYgrS8NmJW2aPjfCi17RwItILcXlxG?=
 =?us-ascii?Q?jbsKUuCRZxBtNDBfRA/SG6qXbSIDe+9BZyoa9d5mS5l8Pwosog1adOw+3a1I?=
 =?us-ascii?Q?z4LZlC7+NsBFZ2dmJRVbjTizFfywDvIGxUvtWw2EJ8Rz8TPZMAWbSCjT40tR?=
 =?us-ascii?Q?w5VfyTS4AfsDlI2fvHu33VaAbbyfdr4C4L5L5o4kkxpn2FkRFE18ygXfp2FS?=
 =?us-ascii?Q?bJTL9RVZYlR1+ZTNGHJ/rdRXtMCCg3oF//TZLkXn6LgKZOz2viuDDoi/9Uuc?=
 =?us-ascii?Q?6nWqUM+aSHtJv/xS2Pc+WEwNJyUUWUv+xsBETW6iIzmSZSUlVRs92NFnUIlq?=
 =?us-ascii?Q?/E8glU5iYrHCbwLjWd4cTH3lckoQ62y55FszTX+/uXAnI36ElBw0f2xOl93q?=
 =?us-ascii?Q?xQmGIJVu+BCCKI/fknKeNPD89BlsPAym/eS2RkapqM90um4lcshvD4ebFJFV?=
 =?us-ascii?Q?84nOa4z34vopWmohrqZ9p7xD7bcsrH54JK8kX7YiPqOdATIYHOV+cFFcUKD3?=
 =?us-ascii?Q?zwaZui/CUUA2wuhM2mCXK9ahDLGPjRsz+8tfZCATHt+SbHqkMjuixBCpGq03?=
 =?us-ascii?Q?jjoo6RxjpVezs69QKsqS6WDqjyZp07+oAfyUG3kDhElrSRTpzhkfldm6RP9+?=
 =?us-ascii?Q?5ZBQ3VkRqIqwp5pjsZtoyKlKsIA1X3oS5thc7uTHaKN/0Den6PEcvSqwJZ79?=
 =?us-ascii?Q?md5YKvkJ/vN9s1eR5FMBwbtV5NOgSwmNzgHBZxT7NPpKYcBODCmlKGEgN8rH?=
 =?us-ascii?Q?woiwFclJze48zJVBM1sD7vej8FPlJw6G4AglkArVNGE/tB6D/M97UqXIwrNu?=
 =?us-ascii?Q?7IL2nOioTediD8cJigtqz3VEPd0Bgr8v9ZBWO8LQ45kL6Y02nYOYMxhaM2NM?=
 =?us-ascii?Q?kcLMkJONl2iTvmocYeQ0KTKHXmtzTdYiGfeFvW521DhTS/LHXnfVtd+0xRhc?=
 =?us-ascii?Q?twJiWn3Ff9n6LTtEt/aLAreKRIK8cifYz2jRkfDadZM+XpxCWBT9mDgjwZC9?=
 =?us-ascii?Q?ewhaXMTy2ZIoyJb2OuxwLp8NeTCG5XKghugmA7+SDaCawakrv31JeGKx6LsM?=
 =?us-ascii?Q?lBqJu3SBSX/Fi+6IvKAEoT2yQbewowBpiBiLM7LU20A60CM6Qeohgq7Sc6S8?=
 =?us-ascii?Q?PjAC5kHa8K+kvivjG/1YExEd31G+Mk7DWo3B7sNzugERqVmAm1CKnUO9t6fV?=
 =?us-ascii?Q?7BGba1ny1dwVvwJqt9bXdWEwQ1RV3ZkQIkIfHmKqvRKEr0Rao+BuPqYCdMNR?=
 =?us-ascii?Q?J8eAZAW5t46jV9Ue3cvHO5648x7llikzXQWXFaPQTDoYgXBLcQDcN/qBWr42?=
 =?us-ascii?Q?O0puauNaqajb9JCHHeTynOKaX+o5cLIo4YGu3agsd9X8vMgziDsSGmuhGUmL?=
 =?us-ascii?Q?tTZHKa9RdaGwvEJFRXZfuPmDjaE6V3GyKfTwndj+0Jf9dwCirTA/Hko/PIkZ?=
 =?us-ascii?Q?FU5y7h9BCD04wU4pUX9jsABrdgVd3izuN+X+2IC6TJxgovnaviXLBPQFwKPk?=
 =?us-ascii?Q?7tWlXdYaNwlYH57kz/NWHiJAS85nyxrmhpPnf0oQ0rIBqTsYUFKENeLbnksn?=
 =?us-ascii?Q?axsvIlUQB8D7aSeP2/gecafH8HRQOAvRexqlbC1w?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5b61c24-d3fa-4bad-f9cd-08dbe641987a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 01:16:00.9206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZhmhhP5JliRKVce5wijLMfEQxHXP7vn5cH1EAgV6lYP7oNGxJeNXzAfoVSmaA7Htywe2143/gVXnWjwodk76CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7776
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git uti260b
head:   c7c89303911ada7c2765aa21f95c2d83778eac68
commit: ac71cd35df41222b775999c8c3c3aa0b1a8e4165 [20/27] dt-bindings: input: touchscreen: fsl,imx6ul-tsc convert to YAML
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231116/202311160714.FRS5bWnD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202311160714.FRS5bWnD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml: measure-delay-time: missing type definition
>> Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml: pre-charge-time: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

