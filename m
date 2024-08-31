Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8D34A3C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 13:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725111070; cv=fail; b=HxfXYLieDxwigYHh+H9ErrjKedLBzQ3jAECsV6sqika50lFkFKTAkUcG+QH/XDtXQjiaLvNvTqS6DHW7Mu7Ny3VyH2/JkZHXLq3EDNzcaZV08Y6ykIHOmyKiqgMRpZGqFA8D4ueG5+4qZPc+7xIX9FOkrLUhw9zis0h0WpIBKio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725111070; c=relaxed/simple;
	bh=DZeXHngSW0dedCGdWHCfTkRfASnT+YtoO19dwzmRX14=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=UMWWp60HHnMslotDMC2cDDDbua6VaD5uVxhXwDgmkQE0HML4fRiZ7cHTSiuQs+xfML56rcb4wzTxTIo8avavp2evAOPuRYoqFZExFTyXKlGpz8TpHF6l7e1OGcCHittxAjyC3qhU1I651zaY/Cj7E3TOg7NRJopje4yGYqzL+L4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QYTwzDhv; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QYTwzDhv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725111068; x=1756647068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DZeXHngSW0dedCGdWHCfTkRfASnT+YtoO19dwzmRX14=;
  b=QYTwzDhvwLS9kAYqI+HdUqqRoNnIKuZhhUGa+dUCv5ipevtyez8WlCFB
   Xx7chM5Bkc7p4+7m7N2xZA3pVwQ6amB1wmwmwdwObrbYcW12QobEa5YK/
   yQN7PFHz9Erc0e6OZ4CUfNfdcPPB4D+zIM4stuak+AdHzd+86pjaAEVi/
   vXORzIOl+Ho9u1yfPSH1M8mG7LuP71jJnwb52vmDAjZNLuFEyLxJwMJaO
   m7fBzt/NxwTApfN9P/qAoCi2dMMV/+63Hc8MlO+6lz0nDDs9ZjsO/XOpj
   rffRWasf31c4CEkHegqF1FtsfNcwAZ8np5S0/WY93GylKd8L3yZNn96/H
   Q==;
X-CSE-ConnectionGUID: 5KNKfbAISVGdVEHC9NoYjw==
X-CSE-MsgGUID: DEl2XJf3QT2j2kMkec3sbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="27620610"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="27620610"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 06:31:08 -0700
X-CSE-ConnectionGUID: w7n4YbTZS1SbW3hWY/Lp0A==
X-CSE-MsgGUID: T00jK6eQR0qD76GZ2BaZ6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="64511375"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Aug 2024 06:31:08 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 31 Aug 2024 06:31:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 31 Aug 2024 06:31:07 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 31 Aug 2024 06:31:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o0mDUiqE+iOeGfHx0uBHideK8kEuT0db33E/3wH96bWnS95U44fxnkTEHZCDlt1yn32FemEjFS9H2FU0R0v9cEcPdjUKFBlX8pfaqSuTdxWbT1vBa0Jjw5mIAZXPpOy8SwZWbhcL6ZmDW6+KQzxbj7kAzrZ5baDc/EZDMpJpb81ioueMliJgPP29KRfdSydw1GUAASN/cNv5ZyhFyBelFumBJYsDbpLWOZTgbzScqMDRMhmIwQmNIGi+O2INUv2Zx7d2GlG4fEP2TttNzJU1NFYgdwaHPFi+nCU+qaH+zxARfOyW8NWqBPw3mKj9wI53P7Tg+GYUv1kefOUgEXNgug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0iyVi38GOKoLK980kdCeLv7umcw2aeJ2himvIxZvYE=;
 b=vXYosvfHzdsETl1orq2UMbf4iM8Ox3q+gLzFIab3JI1uCYt7p6kAPkmpaGQnvAEfEInuDJecd+MVUkTVqWunirW8xhMwj8Hr6vyl/VlBT3QBdRrIE5g8LEXRXizOa/ZMwsjOTcs5UApiw3aFoMjHpRSzQP1l/pMgaQcwWm++XVn0Svq/Mc//UvKEr//6ofvaPUzwc+2PZ2/ZmbhlbCPUTJnzmp2yd+KqykYfvQKJIP3lCkuCNWNmd3h54eHnroYjqbhw0R7sh0Zk8Q3cBh4OgPS4hBoEP3KLBui5SJWdpz8olmRqudhV9GIxTRowMFwhbKTY1OjLa9b9lAQzFUDmTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by CY5PR11MB6462.namprd11.prod.outlook.com (2603:10b6:930:32::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Sat, 31 Aug
 2024 13:31:05 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7918.020; Sat, 31 Aug 2024
 13:31:05 +0000
Date: Sat, 31 Aug 2024 21:30:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason A. Donenfeld" <zx2c4@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>
Subject: [linux-next:master 7819/8126] make[1]: *** No rule to make target
 'tools/testing/selftests/../../../tools/arch/x86_64/vdso/vgetrandom-chacha.S',
 needed by 'kselftest/vDSO/vdso_test_chacha'.
Message-ID: <ZtMbEt1TA6b4+/mB@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|CY5PR11MB6462:EE_
X-MS-Office365-Filtering-Correlation-Id: bf115add-be79-4185-f8c2-08dcc9c12a15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P6id+pKXqOdlhfLX6yujC5SQIHiVQoGJBiNdp+b0Bvaav5n6m1caWA6ej5bF?=
 =?us-ascii?Q?HTAhHrhGDUg8l3vvKkp9S4B3oS8m+Pd1FiZ1lwsozzkLo7uIM85TPbaqYhcs?=
 =?us-ascii?Q?pWdjvJLk5NF3O0EKpZheGMMzrPVTlwM2kYhKA/iWniWQle7eOk+vgj9csNsZ?=
 =?us-ascii?Q?KQ0UnEs0dXdBqewW/G1BZ8feLPiZiBmWrlitX37hu43OiKZU+gpnpMjiN4hb?=
 =?us-ascii?Q?R6YeWXyEdRvHbqjMWQeuhc4mbF4DCEkymR+TM7fcPVqKpJx/gE5tJt6bft4e?=
 =?us-ascii?Q?XZf9hQQXA6HPZ2hsZVBvo0PDQlvjNJrOQlyjY9N+VCSsQP4qqF13n71Am1x2?=
 =?us-ascii?Q?qa7UYaFRZfsOYpo4VVMNXXehnyinmhgmo6/jxKe++exq3gbN5+yoxNV4mvcs?=
 =?us-ascii?Q?uiB0Th8V/uLS0uKYG9zHcNoquzWxFIJKJNxptxJKty2rDImlouEQFaSOFJGU?=
 =?us-ascii?Q?qfP1C6y1wcvzvDty8SLmK1XtbqA8j47EBf9YzjKUmKBmKd2tzOuzM7V4Dl06?=
 =?us-ascii?Q?szJ4tfssvnfbkmjAfHxLzhJtpmlx/vOv7o7OzDV47UF8jj8EVHD4tIG7Jg3E?=
 =?us-ascii?Q?q0cRJwBIve9yl+YSQr5agC+SCT0lmCpQErWUjgu8+4Kf5b3kkBhdpDkToJ6w?=
 =?us-ascii?Q?/sD02yzzbKwcwL6Tw1W479h8aNkLG/gsBaG6nSdMMmtg6pDRwwOnZ+23hEjq?=
 =?us-ascii?Q?FNo+b+9nYEP0+ZO/ND1E4JvUZYI/WuzvAGY+DdDxoQcqejiT+Gf9Z6fx4Dwk?=
 =?us-ascii?Q?6AW2R+/BkRb9BktuHqWRwKevWtOPZgnf7lM7zB38QtVsmspsxGMZYstgFsC+?=
 =?us-ascii?Q?8bplWHvh/hEsDZUyrTBAjnWXAjT817Q56zjsvvq/xG+nYQTDa2nV1W/hRevu?=
 =?us-ascii?Q?ZrXoefZsYliDxUZGcjZMeCYdPBLELOzZqRPolnr9XAIHvqGS2Zy335stP3aU?=
 =?us-ascii?Q?WDWlBI+GcP8v67dkjALcEI6QSK7EpD3NTeh8nAOX33Q+SktIehKqbz4NxlbH?=
 =?us-ascii?Q?gRS4Kd7gbRTqwbvPE8XRJjmeBe40mXH07kt1AUCmWEo17Yla8t+YVGmHeoSL?=
 =?us-ascii?Q?zrAi1XtJlhmKx6/j4Nqs1bHj5PfzLHlD2w6M95pGaKdEi1Fvj8XSMEzek6rN?=
 =?us-ascii?Q?/NiV4RK+uNLL/hoz6UmGPhj8p5mG3u/cp0zw1QGo2FyycNsydsH+OqALKeXz?=
 =?us-ascii?Q?cGDJ7TeUTllnM95H+zDnJraGXBuGjRRMWVP+5TV1ibOY67P/ubydsSgV36cg?=
 =?us-ascii?Q?Tzwp249tCd5e/n7wDkQf2H1Nf1lf4ii1jnJc6135EBQ3HNJpOGOUcU9b9QDS?=
 =?us-ascii?Q?/SwpDMhYcNDN63q2wC5HyxUJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E/5VTg45euRUCH/2l/Vi793cMaI+rPpOabQ4+Mu6uNGhwspDK6QvYn5pBbXe?=
 =?us-ascii?Q?vxVtMdIAZujK5yMnv3vJXXqy/AANbtx+fvnsCBwue7Krn2td0mhGbNKzNfZ9?=
 =?us-ascii?Q?5LrGry1vk4y8fNDrsxu261sKGRWjQMAUkMP7GL9ZZHlK7n3kakR6LW23NeJY?=
 =?us-ascii?Q?Y9e9ftOrjPwMqCLxl/uGwiU0d2DnLP+wvVXew04qxpAErPRVeoC8hXLM50MS?=
 =?us-ascii?Q?WPA3vC/0CguDlWaDnwdHiTPWdV3U0UTuOUJEKbQ7y7cHV8VI5E+rET2kodws?=
 =?us-ascii?Q?EXjX/+wFub6XXr9zE9fS47K86aox7i7hNh3vDW+NtkFNQC3C8sAndgEf8Op9?=
 =?us-ascii?Q?wh7khEP3gK429C8UXaNOuemsSeBv5EwplmfvIydxdo5IoMIGhJTRrixZwFsN?=
 =?us-ascii?Q?XNeZw64zkRWYFo6G6gs59QL+Ki6MFxTBY4ldtfrAa/U+3VXHPPLPxca4kVVC?=
 =?us-ascii?Q?jw1mico9W+IU8dZuwil4GbiKkn6lM2ZZv2+SRWRFM5gmZKSlLYbtpV+K1vxC?=
 =?us-ascii?Q?yIQVYPXWQdoypBhG1a+AF9ATsN0K7n6XOoaP7urz+GwV4uCiWhMx7MmdTJcs?=
 =?us-ascii?Q?7PEv6EZS4Sn8w4Uc5IXV67sjiJK292F34luz0qxkENTMhBdqTtVA6/QqbN1b?=
 =?us-ascii?Q?/k28hGYo3avSxli8SiqgSu5os7JCjjysjMaEqbmMdCAD5dibV8nWIUjcpU/T?=
 =?us-ascii?Q?tr/UqprDaCZ9zgkkIzuS3Cb/hrxUg2mry/MP/EAeJQvLBIBEI+WvPwuAIDrH?=
 =?us-ascii?Q?LFGFtn3N0sHyGXdI0n+8s63MS8q3yQCfy/TSq8lV/mcpAxP/AJo0ihoiZDTF?=
 =?us-ascii?Q?l2Btg3CRJ3sK8jPQ2rlWt3KGRB48vVbxGkg5lh144LZZk8yYrKYdOpYeIjIZ?=
 =?us-ascii?Q?4YH7elGqKdpXYxXlkzdi1cZSmbLPcPWSAdeVxD98mJC/HucG0qqdVs21sbAy?=
 =?us-ascii?Q?KDCF1zjGezNSruAnEonW4foTB1xhWK+q95vSPfICGsKXUpKK+s7t0JbfgKDZ?=
 =?us-ascii?Q?GBVXudLJl2CpGeWN/Ty0MkCyPJw/FZiWaxSfNen7dqEaa1/wQfvXkuUtl+2t?=
 =?us-ascii?Q?UQnG3iH/I6n1i09JCJpNVtBkBwyK2NKSezb0+DKtcWio+7YiH6ZjiKDvr9Sf?=
 =?us-ascii?Q?Q2qZ61fngRKXcfmX/C6tP+RtsQKpcaQlfuaeBUAQOZyIJpOjlHsaq/UtTLCl?=
 =?us-ascii?Q?+uEsy7Ad+qD636Hbe5B6ds71aPFDz0KPpE2sCSU31aNaMikD+7wJXVE/kNPL?=
 =?us-ascii?Q?3iQ5h6EZyjyOPRgxqfFf4B7MHWhuxW7XzyNDCANCUk59EBXQBUrDZJpOQLUK?=
 =?us-ascii?Q?4KUXpjclXum/kO9FBSgs1/QDuM0CfjWyFtBRxz1BEsBQBF09G8CsHhlpvNcS?=
 =?us-ascii?Q?iw8nbmRFox8hDJhku89q3h7Bhi7rISHWx1prm38O16xZBLwA2Q2rqVWLlSFk?=
 =?us-ascii?Q?8SGwMUgS6aevWv9LM7I+GoAyb42EAqF0Ep3YOaUVNtXx5bOAlqrlV/hRfcVs?=
 =?us-ascii?Q?wxfUF8qCrUfRA2Gu1U8RFUWh91xKBgruWqeEJYZ9YkQMJBSF/GP89H7orJng?=
 =?us-ascii?Q?P8aqtQKDKntqHftWcjAwAXf12F+UnIn+vRy1ZKNg4roz7xyNZ2y1kOFxSfPz?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf115add-be79-4185-f8c2-08dcc9c12a15
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2024 13:31:05.4930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OPYFGtq+dKTH9RVg3/oAlGLnwJKBbr4XGyimWsLWieLCj6FDvWpXqejY38Gr5oroEx7o1uhOIY4+kC6D1ZCJEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6462
X-OriginatorOrg: intel.com

Hi Jason,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   985bf40edf4343dcb04c33f58b40b4a85c1776d4
commit: 091b6210c648a068bd9584849d82231058253029 [7819/8126] selftests/vDSO: open code basic chacha instead of linking to libsodium
:::::: branch date: 19 hours ago
:::::: commit date: 31 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408310955.cCii598q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408310955.cCii598q-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile:60: warning: overriding recipe for target 'emit_tests'
   ../lib.mk:182: warning: ignoring old recipe for target 'emit_tests'
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets.  Stop.
>> make[1]: *** No rule to make target 'tools/testing/selftests/../../../tools/arch/x86_64/vdso/vgetrandom-chacha.S', needed by 'kselftest/vDSO/vdso_test_chacha'.
   make[1]: Target 'all' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

