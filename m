Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A79B3EBF3A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jan 2026 07:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769238275; cv=fail; b=T1mYvwED55YpLSXHE2r7BhIXHya4fo5kXYx4e4VzANOISBThSxmSa77GuolyzZ3oAT7+6O+fJ2MtDlgXcTokimZO5Z45rigVskLX5iK4ezlGTMjR7VJJkNOZkXD/HD7WDaE2E07X3Jy5x4oMVezzaZFU5EK/E7eJ75AQTL4oAJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769238275; c=relaxed/simple;
	bh=14LTVKg+0yocakCXjS3DtUXn22MjALKDiUOQFnzOgaw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=jfrbaqBsnXp72GBGmc5oi4CRp4ZkiVX8nWzeEKi1WEHBzljJx1SVHYp2UAU5zaRu5ygxDoHGYcCxvhynCTKM6e9++GC3H3dLiYA2pB1Rp1LI3hOKJ9SpIwcnrWzrBDOvleSSKqsNi22FspZyvrcG+MmpPj+dvzt6rg7lUmTm9LQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dkdYIUmQ; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dkdYIUmQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769238274; x=1800774274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=14LTVKg+0yocakCXjS3DtUXn22MjALKDiUOQFnzOgaw=;
  b=dkdYIUmQOdNvqgEK/lGy9jNilL/JuYFsEKB4XQWV6igSx972hFsXWkjZ
   6+dYxZCr9YpLlKEYZihFM/R3O52I0Rwn5oPcpRQ8AUU+HdwNKVEyAErtP
   QBm+JnOmGCz32UnV85rYFVCztLtRIN+JW+FbSChQOOScULjB5w2xPh/yj
   UjG+ov5ISN1MCTSx7/1QaPe/H3jPDgqXOstIlBo0ZR8TmgtO98q+Iwk7N
   Og0LKq90uPHlZbjqYEMlZK7C9O2daCFoOWLnabIzZSWbI2Xcasiw/58oH
   M4FzSbpjkFeuEeGhxq2N65wyjCsw50331Z0ExfcuZ4/xr+LaiMw/u8M6E
   g==;
X-CSE-ConnectionGUID: 3WD5OqaiQXmCJGtjF9re2Q==
X-CSE-MsgGUID: 7gKsaWuYStOdCXgwJNOaFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="88057977"
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="88057977"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 23:04:33 -0800
X-CSE-ConnectionGUID: lq3hkMArRw2PwsptCgWYEw==
X-CSE-MsgGUID: 4uiyht85S7WjiZCAtKaDpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="211712683"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 23:04:33 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 23:04:32 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 23 Jan 2026 23:04:32 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 23:04:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N1mv+xPbYkiB1ElpYoiQWHSTOfvnmOBcrxpqqiNOYuy5/t4184aZotjRYuHTCanfeKelcvo3idDyb40B6P7v46J6bU+Zk2bHvxGV2MyvBszzeuUmIwK8afy8CBBkR95tG9O2LDIwGI0FhFqMW/zHwY3MFs11T3/gdx2dXJiobFLl4tJ1M1etdggJe+vHr0W5SlxTNKSuATAwGCWwd7gwatzg3SGsUbC1Mof2j+3XRj3i8V5QwuOhRDBBin2fLxTvpGY3tuOQQWN4gncrfqNmGH4h6D0OOuUs60t799OAfuhoZ4zvDA2I9fegFRhrtPj3DAS84KeuzYI5LXbI+yasJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6U8HOIpwAgnmGP5NVgDq6ftlbiNSHu/0Hju8poW2HL8=;
 b=USwMb/CZK2Fwqyalggu0UiZPjkDW8NPh0jPNff8H5ZfoIRCGoQwvV+2zn5OJXJxf/4DkDuT3zUaAtW5BlksOyOIXz2F+MEMx8zkIH97bvwldaUjUiHtbGjY67LDWygdmxHJFthtJj+nINOwdFxcbKAaGheJd0/B20ckSKnqzs+ljrT6dHN4orXNZE8/qvAY5rjb7D+8SOhY6BNVA7/yf1n7aQYVdJLR5lFbd8yxSlLpM3VjTDjT4aL8I6UHecNc1SSRmKc+yDZwzLNqygFFK+yyYWVbo0x/BbD9D22LOk+unX8Ytvy5YX5YmECe6u6YbkmaNU6k4UIy0SlfjDQkTHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by PH0PR11MB5807.namprd11.prod.outlook.com (2603:10b6:510:140::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Sat, 24 Jan
 2026 07:04:28 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9542.009; Sat, 24 Jan 2026
 07:04:27 +0000
Date: Sat, 24 Jan 2026 15:04:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jesse.Zhang <Jesse.Zhang@amd.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [agd5f:drm-next-6.20 3/49] checkpatch: WARNING:BLOCK_COMMENT_STYLE:
 Block comments should align the * on each line
Message-ID: <aXRu84S28YO/0iDz@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0152.apcprd04.prod.outlook.com (2603:1096:4::14)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|PH0PR11MB5807:EE_
X-MS-Office365-Filtering-Correlation-Id: 0637ab53-a345-4992-591d-08de5b16d057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IRFfJaOtFfGV+I++xClYoTIqt3oTj3C3TPPq6C3ZebeN4g7PlprVBvNtqRLR?=
 =?us-ascii?Q?Nl1IXvXakKaObw/rKJxhnF8Hpj891cmEQsMBnejT2p9zVnnr6ZZBbTBmGBUj?=
 =?us-ascii?Q?lqkIgQhQjXejZdaLTmA228nEgTrZFdvKfcaXS7Gaa1+FSX5U7oZiJyEKlLsb?=
 =?us-ascii?Q?/lGvxCnCCClzvdGCDGpKfQzvNZlkaK6b0u1L8BOOqndMgfKiur18qplVxM8I?=
 =?us-ascii?Q?orE6bqT1nEwEmr1eaOLCJ3uYHOlfHsAuGRBc3Za2zH+ibikrdf9yUR18PUDo?=
 =?us-ascii?Q?fYoy9J9neXGC1RbLT29ouArGuaF+oDt91XOiIjzBlKJp5rsZ+QaLQKPyGfd2?=
 =?us-ascii?Q?WnSyr876mG+bzC2tnZP2iE5ZJpU1FO9YFdOdvyLUu9BBdcqd7nGfhZR1oEcy?=
 =?us-ascii?Q?S6VI/XFruXcZmaBTSgGAwom3/WhJmPpY6yP3v4m1j+37KLxqbi85+1qKOxfh?=
 =?us-ascii?Q?tJueNTRZM2nf98fSN0qSIaj+StCgXGWwVpnBev8dNOadz7yyEyM640CbSfRo?=
 =?us-ascii?Q?usQq817LyZnZ+Slvurw87bu8pYJAdTmFiw3gdU02by/nSzV9DBQpJTR4ih89?=
 =?us-ascii?Q?XLiMGlIzLngy5/JqKSlDSJq6I4UOwhKBwVX9ZxoJoJgE9Aby5D8akJt+DF3F?=
 =?us-ascii?Q?i5a2pxPZRmrwU6XxC79MRJoQqUTP9voI8ISCQxIpWLZ9p+j8KMuljDZpFZwp?=
 =?us-ascii?Q?lyu6ofURQf2YH/T+6fKN/5RZW0plMnap6oW+IM9FeeHs5l956f1MiCHA/VUo?=
 =?us-ascii?Q?C7/AFuOEon+Deassd+W2HEV3qExyM+z+TWlF1WOneaDCgSfuDi5YVF7WeyOd?=
 =?us-ascii?Q?xJ3JMJEgZnB1S26IT7PNZEmHDxTdvBNNqyyojln5tw2xeelm73CDd00UqFV3?=
 =?us-ascii?Q?FyX5a+fWBkPLZdrUON/ivVVmIwvEWeUMy9kX9CLhr0cPnDn89PXb/wZ/7XGU?=
 =?us-ascii?Q?LrJIdf5CSb4Y05ryxiTWRydfkcGIkDXtb3OXbeUDXiuNBhXvjLk4qvpv+Ibq?=
 =?us-ascii?Q?zDhLab6NIwLXWtDPyr/oa+mcQ65otTBKOfHeOavryQScmVwPuCEKDhfjaJyy?=
 =?us-ascii?Q?L58rJXPOxFyWhnM7+hqFeBlcSLlGoDFJhTrI6zEWS+z3VYibEnIMqXVj+IdS?=
 =?us-ascii?Q?XC7IZtFVRmeyBJ8p9gMLoC0h/SjyltBuIfMvToktItRjt4KJeonPGWqKEXgi?=
 =?us-ascii?Q?jd05yflpkS/RXxO8ZR8NGEJmaIesyrIuciaJPZhlpFbXr41GhMVW2aeRVQKO?=
 =?us-ascii?Q?QukZnSI9Rbdl0TR9irB3cms+TBBANo0OKNNJGi7N2DUd5xjq+8cpRjs6ClTK?=
 =?us-ascii?Q?A659fjFTMn3Autlo3bhG6miGwCZJmsfbe9813Y5Xmwy2lT0olauas8pdRy64?=
 =?us-ascii?Q?dmUC1+4mtwwjSlMx/gJTTIe3cZlCnuzYHzDCtYufwtuCTPBRMltu0K/wqMTc?=
 =?us-ascii?Q?t0sRhNIKyLOs/Me14JUueWjErOt7Q2XmeN4ebppfQ9sO01w5YRwTw8fVADeg?=
 =?us-ascii?Q?0zdmoCh2/idD56Y50m7pBOaFRF/8asSoWCqC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AkCe2+wI2zU1Hxm23jMitqwjsjg4QECA3dmIE7sOjcvmt8vyMd2jCiMwBzH+?=
 =?us-ascii?Q?U5y5w2NrRKqy14lwVT6RhxELdYRqyUWPlJu4vwEGTCrBCcZmDAvhkY7p64Cc?=
 =?us-ascii?Q?xKa6ONnyeJPvT4sUXGpMuNpT43TSZExbXMttinkPBm+ebUHvVPHByb61Dy3X?=
 =?us-ascii?Q?wH/y/aGMgw1sL0snnMpoGoxam2rzSndWXNA5zSb63FHp1Te1LO1BxMvk23kt?=
 =?us-ascii?Q?CnWVTxD8sAeyYDIP4qIUmFnCBqVDS1SNgzcCCFF4qlVMUPLY6gsMP/CHPGjc?=
 =?us-ascii?Q?0ncu1jg0FQQff6R+B/ijTx5Ce6jKH2CZ8YOXfZ5ikNculqp7H/4ldaFyYxF9?=
 =?us-ascii?Q?HQ4ekk9QU/9NjDCGMDmzYyLOZ4gg0MU8nWVSgsR07VzjVzYu0mIWdKDLiPVx?=
 =?us-ascii?Q?u3Jk08pStuFK1YAlWXvB4nF84x/jW447XG4dEEn4xblMwyQ/GEZ6Jx1eU99c?=
 =?us-ascii?Q?JLUwSLUy8ukgHOMmrNTW8CGZrpYD4ZbsCmURxa2jN/hL0hthnInLjPDPoOb9?=
 =?us-ascii?Q?fOhgwfm6RBGAOw3dQMb4fscTSc8XZ6Y7tu8ssM85v37uAUBdyTr0MWJhRUsJ?=
 =?us-ascii?Q?vTra4tmFEtt+jVx7OLez29jiTt2+bn/Z/AjL7t5tsigaZL3YI3tsRdA93G87?=
 =?us-ascii?Q?1D9ttDp+kqM0wkWIvc1WdW5TdIPvakgsLDAN7PnHPy0FkgDj3r8y3HOpTb3+?=
 =?us-ascii?Q?iqf1u7jsuHP2wJDpBNZPsHF4y5G3o5x6hLJvOFI9ydIEv85k7vHp9rO407JI?=
 =?us-ascii?Q?68GgnoVYG2ESE3q8XmAZRG/dAz06nKp0/hs192vZYBWI6wEBaofhH48xEPPx?=
 =?us-ascii?Q?hDr3Eb2LW5o1B5fmKCUTwz7HCzAO9qfxYA6j+ngdrN7tULFJV8x5Yvy/xux8?=
 =?us-ascii?Q?7hPe99oQHh2dl1rNMW4677uLhRDiU6GMERVQnCiKxj7n1qGMuJlEsDm7Jw0e?=
 =?us-ascii?Q?l4JHf26QtnHnsOpxCuggsg+tMmH2U326rI8VkbnQWlKgBmVQwYauhPXEh+5+?=
 =?us-ascii?Q?wUxYySTfco8Xhf9+wOJ/l9m2bg5rYR3w8MzwrugGab3LXHthn6kw91QrxkcS?=
 =?us-ascii?Q?9fMW+xNC2NJoD+FrcnOpuvQensX2YKG3kD2aL4ctnetr7HDxw2QJsxmDAqO3?=
 =?us-ascii?Q?ff55LGB0iSfIE5kqhKG1TCAhq6oAA7lNGUTHoqSoBeQHCvH7a+zzPxI6gMHI?=
 =?us-ascii?Q?CBRJoQ+el+yyv/RBE0svXlAw5D/VX30fV687mCiw9V5fTdY8mb2PJBrLLrZN?=
 =?us-ascii?Q?AxtW7l68KsTsFPop+AxEqUCvBQLFqS9Qz1A7de9g8fB6tuK98vykdg/aDlsy?=
 =?us-ascii?Q?p8qgozaQ40FjvFEhSU3nwE15wDslOr8vtXzDz70xHLX0ipejxcvMsyJ2gd5n?=
 =?us-ascii?Q?+EP+55lrMfh5AqbPXyYEMJzPkIQ513rsvtNVLjQLDBfDZyOVHILnoBn8U4h8?=
 =?us-ascii?Q?O/lXxSsUJkgDRcv0We+cN7UeLSYYYWkm8lISEt6el4eMKtKmja3EchycP+Ps?=
 =?us-ascii?Q?gN4ok+glGl7ZzVbWGzEJ8A8hDjo6woROQiFav7J5jFQ+MnpPVIDAmL8IOYcY?=
 =?us-ascii?Q?IpemATi52DasTcP7Fj3v7j10+RCBHYQWjLNJTun+e5n58KVkodrmp+zavbNo?=
 =?us-ascii?Q?yN8S/FjQt3UGi9SSvhNFr5LKN+kBU7NjeAt8SqP/nOeegeVCycujJDJVLMNA?=
 =?us-ascii?Q?nXjsn3i614mNUs0fCySxEqbi+7jjTClwzUbQgo3yFI8OPVuUB01A2QPNMQVA?=
 =?us-ascii?Q?5g2rBpoUXg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0637ab53-a345-4992-591d-08de5b16d057
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 07:04:27.7814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BCN9WWmPNlQFHqoDUUhG9Oa7WkvakGyCygFvQrhmINyNpYF8Zui8QsJ1DntX6u74tq8WhjF4DvLiCU/PV3g01A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5807
X-OriginatorOrg: intel.com

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-6.20
head:   1412482b714358ffa30d38fd3dd0b05795163648
commit: fc3336be9c6297282dd7968a597166b212cb0dc0 [3/49] drm/amd/amdgpu: Add independent hang detect work for user queue fence
reproduce: (https://download.01.org/0day-ci/archive/20260124/202601240709.TGjsiLdg-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#68: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c:176:
+ * to check if the fence is still pending after the timeout period.
+*/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

