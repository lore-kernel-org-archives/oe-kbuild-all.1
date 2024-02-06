Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323E1139D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 01:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707182952; cv=fail; b=prJpQJG1Dla2OteWv6waew7UddGFRSCzK2Rz1w8Ysx6eWRcE6iOhdzTX409cVFQu5L5dkCiPqdHeND+MgsAMQa6uuBN9FIW21qalWg9Ik9mAlo7AllPpSi769s6K5mLjAoz5XDakmTheqxSsfBG6d0LtbYyn4z+6Et2HFRZa91g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707182952; c=relaxed/simple;
	bh=j7uJdwMr6fGpvLV9mSzCjqW3xBP2s617LXwYz9vI85o=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=cv1TMqeJOCQ2ZsQaG2RC/90xQ7BU7XDemmn/HnHb7xhMRd5QDqxDTkHJYTscjU0A6SBiApD+qVrKX3Gk+12pPyF7TF5xSMtWh2xEmBlOvv8GT6HjSepbkRxCywCW8q8OhYXfQsSaEari6ER34IH+4tCH3lsaV4+8zTNvTaPETDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RUvnz+hH; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RUvnz+hH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707182951; x=1738718951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j7uJdwMr6fGpvLV9mSzCjqW3xBP2s617LXwYz9vI85o=;
  b=RUvnz+hH19jBtJFZ1wAOtFYNtCuYgLd/4ij0hWjoNQXSPuZEFVK6urcN
   VcqZ5LjIAUj9NqmrDO/5/k+TTVrIReg7pCfjSolj+zie3njoBwbuSmWuC
   hAG8kUVGwfULrjO+Bc4+HpN5MKQu9/b0t4IhtwfUfwaIT0bKateTMhp5C
   FbxFyFrPt/RZenRZjHkKMWX0TOAUvYYWccta3hXlrvr60GZ45XaQ/rfyB
   B1w//sbj3xsEz1KpnDXBHBMGnl29vkKcN+5TvwS22VFrAqLXizMn5qfbi
   gCudSEBkUCm3Nf0vHYJ15rrr7IcrEXyx4xYxN59Y/xbX7pNIQ2JZttSyT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="900009"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="900009"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 17:29:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="1183573"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Feb 2024 17:29:09 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 17:29:08 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 17:29:08 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 5 Feb 2024 17:29:08 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 5 Feb 2024 17:29:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hD1GOW9hXtj5Gmthv9KbtaRJHcQFzuKay2xYZH4rXC95bM+ODul5eTTcMTpCHT/KiinIRvvnszEL2Pk1sX+UuDVbj2oSWzkoiFb5jqSUEHDUfNUTPOI5oYa/CQFP2Ib2u0NWUZY/4RZbm0RhyuZAxYmojOK2JJxNCwRHlHbvTN4ir1YBNfxSIvvG9i2QAkGT+8fGzeZUPrkzVJ/yboHX1N2c9rc1AGpmdTclgnngtiudsww+z5X/CzvK+BukMxEkth93FA7aSYMlV7yCnOimNMMInKSi0oTt9uAJxYWSxPJp+WUcWkDmokiPztnTDWOGeHe01DW6L5nzyA2gGXbbUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3uyhqcL3p2c8SoTiuGD+o/Kjx6E1i4+kC2RkvZTYKE=;
 b=IJ8jhTv08lyQTUk+09CkbXs50C027Ce0WvYaW+iAd+Fq6HkOHZV/qkS+exTKbmewVTjDCA1x1zN8hieT40P/ujFUQna1TXRMghdb/loBF0A9j5dp9renV9XmITBdM+BEJ3VPafEMj54L3GnKZShRfD3G9cPt+W8DKek6X7ORnDCqiGT0KOeItgNw+gzgwhXsFefFtVgFbcF/k7CXAH+LsRpl7alksKU+1tMyeRIK1RUtF3NYwSL4/RKb9RBLM+nBFVSdIlzl+fArT9mklE+6H/Zg3CPpiSDuxqjcyFHq8cvYUB9LRC+goaiGsVnDi732Z0wUWn7cLIywHgb6DlrnFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by BL3PR11MB6458.namprd11.prod.outlook.com (2603:10b6:208:3bd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 01:29:05 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca%5]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 01:29:05 +0000
Date: Tue, 6 Feb 2024 09:22:05 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Nuno Sa <nuno.sa@analog.com>
CC: <oe-kbuild-all@lists.linux.dev>, Nuno Sa <noname.nuno@gmail.com>, "Rob
 Herring" <robh@kernel.org>, <linux-doc@vger.kernel.org>
Subject: [nsa:dev/iio-backend-axi-dds-test 4/20] dtbs_check:
 Documentation/devicetree/bindings/iio/adc/adi,axi-adc.yaml:45:5: [error]
 syntax error: could not find expected ':' (syntax)
Message-ID: <202402052154.jOLwUwf5-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::13) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|BL3PR11MB6458:EE_
X-MS-Office365-Filtering-Correlation-Id: bb7dcb1f-5bcd-46c4-954e-08dc26b301ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DGiwEKw8tgJB450HO3PCNp4+jcwP8Uy76fnUOASetwjPzp2dmsYX21+H1vwIUMaNy+wdy1WZwUkhWeEydnaff2ob3RNq2u6MYgVNUvUDd7drFYR2hXHiCf0hVwKy8ilcIBnmFcapeiHro47pwj4uDC2WJ8HO7eyK3l85Q6o7F4GGUyC7D/zmWyn6TXw4UqREst65REQHIfL2XDf8xAVV96Z4uhBRop+xjDn7AGp4qxFAboyu/eKMpE0jPeRsHymAPuQcIkKij6FFSpq/kSHvblbxp5Q7f5M9SLtTMyRDBMK4pqFSuxFwFiLu13DAZjiBh0se5OpejbiognHOfXBJDAj7cchULOGtG6TgNhwCpzDJs4j299rurP7pEuAfOWt+eBOl/XL9tHhLpstGEFDdTpAUlllZ7d5JbVPhj3yKR1i6U1USx3jvoAYlhm75o1PpLuNoDrJIBnojj4nRcsLD2WqLe2OEEABs7NOCIpRFQi8W3JPdhYW+CIb3D2sYKaoPt66zikIIx1USoqvuRFkJ3qQj7d8xSzoeUCfWjiTwWYH6OVervHRJdFPEFEn8yBI80zmOpzZ0iLEgrv7gxZm3BQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(39860400002)(346002)(366004)(230273577357003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(316002)(82960400001)(38100700002)(83380400001)(6506007)(86362001)(26005)(1076003)(41300700001)(2616005)(6512007)(8676002)(4326008)(8936002)(36756003)(2906002)(478600001)(6486002)(966005)(5660300002)(6916009)(54906003)(66476007)(66946007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?geY12xHAv7kxYx/BPvwaI3qXrL6XakNYC/0uwTHZxSb42wjER1pB1LwJRrRe?=
 =?us-ascii?Q?o41DeT2l5uqfw99lZz2g01uOcWV11F7tPnM7nV2oa5e3wTLLMn0yPpdYE4UC?=
 =?us-ascii?Q?kxvrVpMiP6wYxAQjClthXKF4W0uxwekR3jyN4fq7QnZKy4XZ1wbr+efcfdYe?=
 =?us-ascii?Q?zAO/KOulH70K+K0YQSgbHAn3oBq4GTntxK22t0KzMeRUnUfeTgx+Hm1ne/eH?=
 =?us-ascii?Q?/VPMJDzpqfszJeh9CAlE5LdMXkRNwn0HjwT0diGNxrnJpd+hQUgFGWT0XNDl?=
 =?us-ascii?Q?GfwnIXo/TXZw8RXyHqnRLliWJ3NstufA97Wej3IfSO4VO+FgLlfL+6wH25ch?=
 =?us-ascii?Q?kcRo9h9JKNdLLmPw/GfYA75XBV2u8tHkbG+8GwcXz68Qw1euJCWRWWG+HinY?=
 =?us-ascii?Q?R/XLR/zDYqf0BagmOQbwp3uI0IGQ136D9qyBkqdNb9JcAEkM+Ou1Nb+aD+XX?=
 =?us-ascii?Q?eVFrhX3c0rDNe9tz1sW1b22JO7R+653xSsDHLKOcV0oQqIN/n3wYYL3nmYso?=
 =?us-ascii?Q?1PxTmLCvNhdCV705kj8G3a6oSAYtQuahh+CMx36e+ehUEKetJVn392mD70wq?=
 =?us-ascii?Q?YwEZ9OKqQdaNA02z9SKzZYGsyq9fRpjSVqgHFHhe1nYrk9iJFs4DA8wT+tIO?=
 =?us-ascii?Q?O95SdbV/SvxIdz5uine0eoJqEi+ZFyqGVQLP0N00Vy3Y5j4bJk/qjZxij1E8?=
 =?us-ascii?Q?0aoE95DPIRJnPUo2ibIX2XMDuBVLb2dw/qOkDxG4vsDkcB+rPiwITzB00pcQ?=
 =?us-ascii?Q?dpnXl6FFqly4FSNi+7/XAOru6SdJYxfGbsQ0qnuPUPgjsQnXYeg9jfslV6cC?=
 =?us-ascii?Q?m1kSkYRewW5/C/mN01c+FNiaRUmObNcs2+HjG8ktGq91dCGH+v7436Gb8y4f?=
 =?us-ascii?Q?LssGOiOpgysZdFwwwJpqbV149tOl7QmK25NQBsaO8Z64SAF8uUNNanjH/5zn?=
 =?us-ascii?Q?Mlo3DoPKnBmpQDx4f+xJd/1vqxLgSVQWPxl3lflLUYg/LlOJFpTzLL9BkwrD?=
 =?us-ascii?Q?uO6moNd5bAfh+HMkC2C0nNTmVHMplPDOgN+yj0kuiqX2W5/NFNinU1fFnnAv?=
 =?us-ascii?Q?M5WNY8gdgVxpjh4W2Ss3PM68W163v4XlTk5gINlxxVKDxjh5toL0ITx3C/2g?=
 =?us-ascii?Q?bl8EcPYDRYuqjU9UsKH/tlyXHWduC9xn65q1TX56KyNOtfsmiUqMZ3yGzigO?=
 =?us-ascii?Q?TnOW92Zfh48r75NBeWzJq4f4SQPQZl2ch48cMoeX9oI/ftA8M3MYn05SmWch?=
 =?us-ascii?Q?/oPOgDpI6aSixDFhmTZdpRHXWy/CrAvNE0pTpWOVrZ6wsrdhTutGAW59Togz?=
 =?us-ascii?Q?0mzMXpNVcLN6Poqf5GGviwC5xLJjSlpdoEBAGPZjND22JoxPUGoCKnanbrK8?=
 =?us-ascii?Q?UHuToJbuhykNZ5hy1xE+aEsBYvPJ3pTYuZZFnT49pYKmY/TSh6vstF3PJtZx?=
 =?us-ascii?Q?cjddBppeT/zv/hGK54d69vypcXNtz1XUHXZZSUnVvv45vxJ711FBMRNo3qRQ?=
 =?us-ascii?Q?yFUH++De0qN1Ty0S5iNo3JwbI2VVKXpHFdEMgtvghc6MSZgf2B7kdeNl2izo?=
 =?us-ascii?Q?sC6uyoNFmMxAzzNh69gIJtqUjnXSoQOMxzlYDR7J?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb7dcb1f-5bcd-46c4-954e-08dc26b301ec
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 01:29:05.4946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T6ruuY6S6kXJVPl8KwK2pyCqSUvESSvlqgNSgIJPret+zV8hXDiEOAp2eCEYZMfWfLcOsGsfOuniVisPsulxPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6458
X-OriginatorOrg: intel.com

tree:   https://github.com/nunojsa/linux dev/iio-backend-axi-dds-test
head:   56a0faf5df7548936623a26c728ff3f0e970ef6a
commit: 7db35094b2038ea8752f86c2a3e2a36b1e57e2b9 [4/20] dt-bindings: adc: axi-adc: update bindings for backend framework
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240205/202402052154.jOLwUwf5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202402052154.jOLwUwf5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/iio/adc/adi,axi-adc.yaml:45:5: [error] syntax error: could not find expected ':' (syntax)
--
   Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml: properties:honeywell,pmin-pascal: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
   Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml: properties:honeywell,pmax-pascal: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
>> Documentation/devicetree/bindings/iio/adc/adi,axi-adc.yaml:45:5: could not find expected ':'
--
>> Documentation/devicetree/bindings/iio/adc/adi,axi-adc.yaml: ignoring, error parsing file

vim +45 Documentation/devicetree/bindings/iio/adc/adi,axi-adc.yaml

96553a44e96d6f Alexandru Ardelean 2020-03-24   8  
96553a44e96d6f Alexandru Ardelean 2020-03-24   9  maintainers:
96553a44e96d6f Alexandru Ardelean 2020-03-24  10    - Michael Hennerich <michael.hennerich@analog.com>
96553a44e96d6f Alexandru Ardelean 2020-03-24  11  
96553a44e96d6f Alexandru Ardelean 2020-03-24  12  description: |
96553a44e96d6f Alexandru Ardelean 2020-03-24  13    Analog Devices Generic AXI ADC IP core for interfacing an ADC device
96553a44e96d6f Alexandru Ardelean 2020-03-24  14    with a high speed serial (JESD204B/C) or source synchronous parallel
96553a44e96d6f Alexandru Ardelean 2020-03-24  15    interface (LVDS/CMOS).
96553a44e96d6f Alexandru Ardelean 2020-03-24  16    Usually, some other interface type (i.e SPI) is used as a control
96553a44e96d6f Alexandru Ardelean 2020-03-24  17    interface for the actual ADC, while this IP core will interface
96553a44e96d6f Alexandru Ardelean 2020-03-24  18    to the data-lines of the ADC and handle the streaming of data into
96553a44e96d6f Alexandru Ardelean 2020-03-24  19    memory via DMA.
96553a44e96d6f Alexandru Ardelean 2020-03-24  20  
96553a44e96d6f Alexandru Ardelean 2020-03-24  21    https://wiki.analog.com/resources/fpga/docs/axi_adc_ip
96553a44e96d6f Alexandru Ardelean 2020-03-24  22  
96553a44e96d6f Alexandru Ardelean 2020-03-24  23  properties:
96553a44e96d6f Alexandru Ardelean 2020-03-24  24    compatible:
96553a44e96d6f Alexandru Ardelean 2020-03-24  25      enum:
96553a44e96d6f Alexandru Ardelean 2020-03-24  26        - adi,axi-adc-10.0.a
96553a44e96d6f Alexandru Ardelean 2020-03-24  27  
96553a44e96d6f Alexandru Ardelean 2020-03-24  28    reg:
96553a44e96d6f Alexandru Ardelean 2020-03-24  29      maxItems: 1
96553a44e96d6f Alexandru Ardelean 2020-03-24  30  
96553a44e96d6f Alexandru Ardelean 2020-03-24  31    dmas:
96553a44e96d6f Alexandru Ardelean 2020-03-24  32      maxItems: 1
96553a44e96d6f Alexandru Ardelean 2020-03-24  33  
96553a44e96d6f Alexandru Ardelean 2020-03-24  34    dma-names:
96553a44e96d6f Alexandru Ardelean 2020-03-24  35      items:
96553a44e96d6f Alexandru Ardelean 2020-03-24  36        - const: rx
96553a44e96d6f Alexandru Ardelean 2020-03-24  37  
96553a44e96d6f Alexandru Ardelean 2020-03-24  38    adi,adc-dev:
96553a44e96d6f Alexandru Ardelean 2020-03-24  39      $ref: /schemas/types.yaml#/definitions/phandle
96553a44e96d6f Alexandru Ardelean 2020-03-24  40      description:
96553a44e96d6f Alexandru Ardelean 2020-03-24  41        A reference to a the actual ADC to which this FPGA ADC interfaces to.
7db35094b2038e Nuno Sa            2024-01-23  42      deprecated: true
7db35094b2038e Nuno Sa            2024-01-23  43  
7db35094b2038e Nuno Sa            2024-01-23  44    '#io-backends-cells'
7db35094b2038e Nuno Sa            2024-01-23 @45      const: 0
96553a44e96d6f Alexandru Ardelean 2020-03-24  46  
96553a44e96d6f Alexandru Ardelean 2020-03-24  47  required:
96553a44e96d6f Alexandru Ardelean 2020-03-24  48    - compatible
96553a44e96d6f Alexandru Ardelean 2020-03-24  49    - dmas
96553a44e96d6f Alexandru Ardelean 2020-03-24  50    - reg
96553a44e96d6f Alexandru Ardelean 2020-03-24  51  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

