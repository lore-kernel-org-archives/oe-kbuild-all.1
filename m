Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1432676DE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 01:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763430414; cv=fail; b=HE7DY7AjFqn8dFZmf9/AXo82v5TgrX7jMZXh/AIF/Y9jKLmBSHuT6SpD8K/fKbwPypE5JK2dXe/UpUZ4FU/xw0nY+ZMcsWOXv3uLDnMptxKOVKPKREE2t33DptGaS8FBYlWSbsZ70y60mRkxee2jy0H2lZFs6h6pOI8qQWxR6R0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763430414; c=relaxed/simple;
	bh=hFIb8qyvD/jpZmtjW6CRGj2Y1TVzmOgV05NaN3Jctnk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=PQhGZVsCe86ke2nqUGxVNJnHVEsS83jkNo4/DFQ4z8ggkVRyWrbgvpeZscqWw4onAGSLJc0J4kmtnZ01tK1xE1LkfxqQRCi6clOXY64RyBgoyWUDD+pP7k95eXhrxg3uSyH1Jav72/d0yJUbKl+AuzXif34pbJhDOIkrvgxMJDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jO+UNooL; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jO+UNooL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763430413; x=1794966413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hFIb8qyvD/jpZmtjW6CRGj2Y1TVzmOgV05NaN3Jctnk=;
  b=jO+UNooL0CrR7jfSmB/e7At2Eq86xI/dJesLXZl4HIe7SQc0oUW3FJnW
   xi7PCbdLdzjWJ2SBjbN7Lmw9eyVD1uf2sK0cyYojrpnEgbi+DVurHp/8q
   zwtiqDoUoa0TtCiA9GsS/qMhSndZ9aJlP/31dX/IP0dqa74LWzLp4D9wD
   U/EJRldypfjSIMpGAPAvIQP+a88RzcvIfZOWkhqAQ4jcKvO1Jgmpy3SS0
   X4xBxs/u0Son1Ns9q2gBDLpgIU2QyAf24bpg4trnJRaSIRJojgzYKq/LE
   hwTerQgqpmVgiTP5iTf4jtXSPujWl1HpCE8Olwf1UelmEBipjFvMhJSyR
   A==;
X-CSE-ConnectionGUID: YWX5isYyT3W+GzsEF2eMjQ==
X-CSE-MsgGUID: uYfC+GphRFi5HpB6W9417w==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="90917666"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="90917666"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 17:46:52 -0800
X-CSE-ConnectionGUID: bLkIMkjOROKavdtsV/gy2Q==
X-CSE-MsgGUID: cbFBJb6KRCek73iELQH3bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="195541547"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 17:46:52 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 17:46:51 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 17:46:51 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.60) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 17:46:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/KbFeE1zH0hskgK8QX5rC4AMNg2eCe1M+3WlPQ8xDVIhvE3eJQkutzMtMYiIhFXxss+I04P8jH2HuXQM5GlJtJkcEE1cBND7By+2/ksvw3Qg3n8l6GO+2Me5Ars7XSWvIPTPPDCkVRPiJLkgbCxHMFxLmQHiXOFiBdqAvH6dD2wcPSUBXSzpnJlwB0duqLWs9IUASmJqanm9F+V6EMZBEk9/pfoyB2Od0z7BpYLpMB597fWE2QHmzN5vr9Z3NU1KF69CL9VNduqZgFIEFUrULzJnLN+qBDzcpFUfns2CMDEgjtrE+x3QzPyKtLQnj0bBQBm/Ujy4VhjdWWWp5P5dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NoTv/b+Yr3SgVg1W0sT9ukMlH5F8D0+O8jwoa2722ok=;
 b=J33gssAEIkNgHnD8VCY0RmKiBdaw5oonHftrYD8bg6Dsu4aVNIr8a4Lr1DH+i15jRJVndW9fvbCzwCC4Yp/LBsftNGKp2qKzNGhzwtRdc1WUqVgMaPptG5GEtJL+BHzcbW6wwb3X9uHbNv6cz5/FyJHotb4PLZd4Y1MgpOs6UG1usj24Zqi0pCATwl0eYdv6wbGHOgmVkgy0wrD/wXZkcneTJbHG52eSRIOfpqRgDM3h7xNdFMwCkBirBKfPVEBojbNB8gmgL4dI9tdIzJFMZq9BzPNfusw3QV3LR1GBTHEpNp1+hJLD02FKSYjpxvOkJahncz/IAA/nrxL9qgVisA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by SN7PR11MB8261.namprd11.prod.outlook.com (2603:10b6:806:26f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Tue, 18 Nov
 2025 01:46:43 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7%6]) with mapi id 15.20.9320.018; Tue, 18 Nov 2025
 01:46:43 +0000
Date: Tue, 18 Nov 2025 09:46:36 +0800
From: kernel test robot <lkp@intel.com>
To: Encrow Thorne <jyc0019@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [clk:clk-cleanup 3/3] checkpatch: WARNING:BAD_SIGN_OFF: Non-standard
 signature: 'Reviewd-by:' - perhaps 'Reviewed-by:'?
Message-ID: <aRvP/FHy12+Z+gsd@rli9-mobl>
Content-Type: multipart/mixed; boundary="/FOwviHrpHacfLpD"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|SN7PR11MB8261:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d3ab67b-d018-432c-3eca-08de2644536c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|4053099003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eeTJCuXyJF2t1YsItgQcXwxkptqvRV5LJHe5iiT4SRkXVHRr5HDn+WmmpX3c?=
 =?us-ascii?Q?HHSvity4Bj6Hg5Jt0J8mNsmZfXSI+6dLaXyjL3K9EL84is3s3G5SPQ39UOT9?=
 =?us-ascii?Q?MjOf6GUXbmQ3uFy/IiFAG54lLC7O/lnX1iJrIqQ+YNSCHwlQoloP/qkMPmxf?=
 =?us-ascii?Q?mWuCsTkXr0iAtGMG2TTvAmsnDv3sXsTouWqXPY9h6y2S/j0EJcRMNpxGMYwM?=
 =?us-ascii?Q?5el9v+A2CraBt67Y041Shk+YnisNiOg2YWsTX2I2AvLp6ijnSWvBVy0GRDta?=
 =?us-ascii?Q?1cuJBq3GSszSpH453C99/ovGJlp95QbWgS/8YnMzV5GliqZk+a3QB3zBU3if?=
 =?us-ascii?Q?eprILxCX0ZzcSm+gEcNkl093wXjLeY4vcyhPO+uaxnDNEYrpF+OaBbwtRVoz?=
 =?us-ascii?Q?lqpHHdtQqNQpwQD5wG5jZeYusdAn8YpESZZ+Hyu50z+LAIG40xAY20lJUnws?=
 =?us-ascii?Q?SyTrRXb5tvBI5eka5El+cYJhxbkl3+NOBvUoMW7lFUQ8gSlgNhZe2q7i1LOP?=
 =?us-ascii?Q?GeGUU1A9KtfGBHl3KqizaB58weFbyBWKy9TCN/PwGw439qTT3Iuu4rc1UXA/?=
 =?us-ascii?Q?0OZGVN79+3HbvEmQ8vkxqLc0tfWx72J/OoNGhXDTUp6nzpgLKiC2c0HOPtPd?=
 =?us-ascii?Q?lA0rqNqGaAKQyYuD8WJUdxQX21sfYR6NWFnJ2GnZtQTdruvGXynVo5Vf4tMz?=
 =?us-ascii?Q?pTuTOTc+aZmodvTEUS3Hfev/MNriTb6vZrQAuI+EjX+tjwI6t/4iGVuTVWOy?=
 =?us-ascii?Q?zHtcMJMQLexxnkslu85yKfTfsma327CU62CcXoRAE9kQcMUrXQWXpUPJ3cWj?=
 =?us-ascii?Q?8HTRsFRAY3oARdnJM+sHnb1/RzDPvO57wL68HZlV7DWPvPkzNKDY6gMfkQQm?=
 =?us-ascii?Q?kLz1HcW0t7meB7eVZuMRyLwZeT5FeAkAPDFe8xQk28HMFDsKq+Yh8HQYzEzh?=
 =?us-ascii?Q?XUVQmHwpv+olGquKSQeFXPdn8lYu27zE2IKEvjc9QH8CdQ/LU0/hx1V73D2J?=
 =?us-ascii?Q?kzRsRoQG0pXvb3R+8pc6/ww36vp0T6QwEuLvgh9BiHDoJc5Fw6JXjfNx2kFf?=
 =?us-ascii?Q?DA13kT3gq7CGhEWDOSJAg/rjte3XSLp+KB6gAJLiEbhhUTtcEj67uXMW/qsM?=
 =?us-ascii?Q?BTaDWpOsQrwe2rZdztZWV8AKYOro/Tm5w63i7PMy7D9OZgWTPBGbqXPzDaTm?=
 =?us-ascii?Q?bJHjCLn6OsD7Wt2Gm9L333rtBxqjBA4O+Gdp9CSSG/QLs+222Zzy8UT7zhSd?=
 =?us-ascii?Q?GXh+kfnGFs9bMXsaoVQyeFL6MS2DmHBw5CpuRKESw39zUDTqWzhTc+d34Um4?=
 =?us-ascii?Q?wG9aOwIy8tspYuyy2ZzBcB5K37R7ISMqE0FNTJVl47j3H4ljNhTYFWgmzRVS?=
 =?us-ascii?Q?yxT443cVryyAanscd7cy9zP3/AnOLLLrgFm+60hdd6MMP3otkCqTAu0ajc69?=
 =?us-ascii?Q?i2Naxp8EhB2ySJcN/u/+kU5nwGTfsr7cMLRdIUhv85nxK28IIBj8JQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IO8xJAVTUK0HF5fGgOgP74q2hKJyfPaoRl0iKrjeoiB8xR46u2VirIqs+3V7?=
 =?us-ascii?Q?wMmATaut4X5WeEfl6q47zZlZpT8vguaXYjr4t/s8n8rwyPhP1Oe0u6x7AO0l?=
 =?us-ascii?Q?shPddy8mD7C0xPYagHX6y6OV3wLoAqx1y/eqtZvApn6hlvq71d5tIm7+LNOt?=
 =?us-ascii?Q?s2TeWRqGTUBrt/++U4yU7xmyecMC0PSxg48mtl8wvI74mSAA/oLM9IGajvzj?=
 =?us-ascii?Q?j6+rMQ24wHiEI7PyolsiIy26F0lOu4Mki/b4hhpEmhdFwJIl2x+Dt1fSJqHg?=
 =?us-ascii?Q?Awr9EIVMlXCff8/HG5bXZk6pokQ+lEaXv2srUjpkm4LLcZ7IPixA0U6TzvEg?=
 =?us-ascii?Q?QL9ZStrnAxHwrPvKCRPYiWmfeQtI9j69ZQnS+foHEyWTknD00Q+oWTbfXeW+?=
 =?us-ascii?Q?6+KO6FqIl2ILN5Ldsu/fm4IC4pY2mafP6Lv047ML2meUuf66wGwucmuKavju?=
 =?us-ascii?Q?yXSwjmDpsRsRueld++VZNu41kiNY/sHM0wMXi+iscN5fjeKEnZ7cZ0e+mQ7F?=
 =?us-ascii?Q?TrcCjRUm7hH5XatNG9C1cyaKE4+x6zLNmQC2GulxhtR0kjO6DW+1iDkJfczH?=
 =?us-ascii?Q?UyapfwB1CnGCwsSx0Nh2Eev7fKpnWsKRTS/z675FE//1wQCSa4lbzKxB3dnF?=
 =?us-ascii?Q?YSKMWqM4N/BbEFiFnxzeJ16tPac8ct5UjK9mJuw7PESPhKVmaWmoDw38bVyM?=
 =?us-ascii?Q?MWmg4dzfFhunS4Ftih5xbLgbnnVkiDMZo67hQzTlXEjcryfTQpfo0vF5v4VM?=
 =?us-ascii?Q?t/1nXZBhu3nHHf3geSQ74z57w9bSSXc9uSgSRmlmQ6iRHT08E1wD3vFnDLEm?=
 =?us-ascii?Q?SIXGxn71QjKtWWky++xHUAamJglfkk1vhcnxgOULoqMYCXoJvkWDOkFfSQCU?=
 =?us-ascii?Q?A3EUo82btSnwYQUCw7XELX1b56a1mJ7iO2L6XlaY9rX9upj1AANazZHeQqKq?=
 =?us-ascii?Q?+JjORHZ1nWvUGNAaTcjugjnxkGb/863j9PQnqXXyeCb1pCbIDuVaSVr5hv0P?=
 =?us-ascii?Q?b9/XjhOZc5T5/mx5If80TlCJhNTADHUcRxltkdtSrWG1uCpb4zXXf0KPII1x?=
 =?us-ascii?Q?/iYpiFO/8PwJoY5shz4+0XtPvVUYC0L/HFUYHvWcdYwKQc/oZaT/ufTqso9V?=
 =?us-ascii?Q?PzCd0UptAu6ZMLo26SP8QVu41OBBH/OCYC/FYk8e+O8eLlc9a46A+6DfA1Gg?=
 =?us-ascii?Q?2oHaDK0wu8WgFdbWmwwVBqiMxqPmVpVOCtbcKRRr2fL/+Y5HYc15JVVlir6m?=
 =?us-ascii?Q?fqJsYDCcW56QAEJHPRCuI+iaLAf/Pu/yQxSVaYGCv1TQ0SAGcEYF5wZr2ugK?=
 =?us-ascii?Q?awDlx4gq0o/y/D+61qX5q1i6Go+wj4OyGcOw8np3rcjMCIqHrpUvuCB1OIVX?=
 =?us-ascii?Q?A/DfC1pyZg7utJBggjMlRd/Rm1jaqZaD9L5+glYXkCoUJI7I8u633z2FvSWG?=
 =?us-ascii?Q?sdbPIuS0TYj9RxXJzETwbWGFh3wEdICCyzHKivz2Z6XIdMZ+W6f0XJcgL0vT?=
 =?us-ascii?Q?zHbkkOeroU8ZYsH0jmAbewSEgx1r4LzbewvYJ+ZAifn6DuINo5ULs+id0R2K?=
 =?us-ascii?Q?IazcXj0c3ALm9p2e8sBxqBIgwXO+NwvYPoGIOYuwELwlGSoMIKOlrgz9cJLN?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d3ab67b-d018-432c-3eca-08de2644536c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 01:46:43.3934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I2sdvnemR785cHJvyP2wJXQb90opx7VOg1XNxEDm7xFhKHcbYdpz60RY47+2ycrb7w5q+J0qFFoLmot1Jw5f4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8261
X-OriginatorOrg: intel.com

--/FOwviHrpHacfLpD
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-cleanup
head:   2e12d91cbf3d0105fc58d07b8a0548ebd7bb619b
commit: 2e12d91cbf3d0105fc58d07b8a0548ebd7bb619b [3/3] clk: spacemit: fix comment typo
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
reproduce: (attached as reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Non-standard signature: 'Reviewd-by:' - perhaps 'Reviewed-by:'?
#8: 
Reviewd-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--/FOwviHrpHacfLpD
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="reproduce"

reproduce:
        scripts/checkpatch.pl -q --strict --no-summary --show-types -g 2e12d91cbf3d0105fc58d07b8a0548ebd7bb619b

--/FOwviHrpHacfLpD--
