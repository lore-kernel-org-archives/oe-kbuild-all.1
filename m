Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF141D5CFB
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 06:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764570518; cv=fail; b=ZKpgpetsauNa1wj00V6Nyi18CgCi38HTloRi1f80sAGF/8Y8VIozDBcfaMIiRG5V8G8W/AYlR55VKNs/r4qFzTQcxF6f8Nh/dgtO6IegxBY8HXGPX8IYV3xiCArbSR5MDG0Pg5vDbiD3h6uCAQtjQcPqByDrmpbtxCPVEm52c/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764570518; c=relaxed/simple;
	bh=qdPoVAveCMzfR/YvvpNnwjxN/+xtoI9+LwaFT9+VKjY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=HRSFu5QmmlPErv02+Kp5rXC6eL4lHpePKsk351qQN5o2nbOZs3NeAA+b/DTpZo48fy12l12ckQ9qw1k1sXJuFc1IaGrWm+sdyWRuwzn7XSOfZMZINQfDznJC8vmcga/ZoH7RLD0QRdWRwLCW/fiHuViwwncW92YnoZlu42aSwhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ag+bN1al; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ag+bN1al"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764570517; x=1796106517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qdPoVAveCMzfR/YvvpNnwjxN/+xtoI9+LwaFT9+VKjY=;
  b=Ag+bN1alYYdoMrvsG7C+GAqQdjcgkq9cbbMeXgDa+IbQjBvmBH1dFSq7
   qxPA7/Z+d//n+/Ce7RAxJp57Qba95wKpLR16CgsENO3dc7e8ZiX3HRa7R
   plnbGLd9SGCN6RerU7OYlXigQ97twDoz0PjODXd7WeVfw4VnnBQbM4fhG
   /8+3zX539T/8+EJqpXdsyHKScWOaHGgUtrjcNXKujd+d7JS4Wi5Cqc8+p
   fmdwxTICfM2wUX3s/rR81RXJMPn/dHtp625uUq8pv2uwSYllbvDUrOGps
   95oWRjo2MfrSgmcgnMHoZnSW+LtettNaWtnT8v+2yVD3mGS8kBjGyhJBa
   A==;
X-CSE-ConnectionGUID: nc0ri0xlRUm3TASlVk4L3w==
X-CSE-MsgGUID: bKy0pJ96R0mrttYWDMXTiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="83888842"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="83888842"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 22:28:37 -0800
X-CSE-ConnectionGUID: yq5sgc/mSUuqxLE83TuMjw==
X-CSE-MsgGUID: BiFkjPP+TqictcsC1BqZOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="193872808"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 22:28:36 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 30 Nov 2025 22:28:35 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 30 Nov 2025 22:28:35 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.20) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 30 Nov 2025 22:28:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hAg0BrpucVaozOBNzElBlhzc6yMWkOM2eINlrPwU/VhkGOctrr+ZHYWAtwqUkK31eMH2w4ZCyhh+5AYQb2+OGrFD8CocUts3Wc6MUT+EMrGZGqUtgg4odRebkQdhrfzeMCY0Oeg3N3tJXzkotgEUc4r54hDwCeiWoZHN3qy3IzE/6hLEDltqDUgZTuFUIAT3vnecUiX4TE2Wwpp9bA5GaVjP/2YnhiZeoHmMmhktGaNFSD0ZPTQtkF4Pcd5Lwu8Wo2Nn0BIRwi7sg9Pq9givrYRoFZJMROdGa/YAYRyiOm02q1l90qgBvLwNzVWQb6oOdZAfd68/NJ7a/ihYnCHnVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5QKa5qnC/L7fsCe9ZLp9sO/Y/I9VfCb6BzThS8hXkqc=;
 b=XlpoNE3nN2M5jptvqdRUlSPZmXQ4Yx9xnhFz/grsoLonu5nMn9pQLRYfwEo6qw0/8EheMxIKOX42Vltz3Qa62MJjUpHPwRhrJqZ8vC9DCxbmrT9hU27eRnKEP9WUKzg264dzBDP3Pa2Ek7WrXoSM6CEmVorzAvWC9ISVEQK7AOtuIto4yz/pG14gB7y459YnTQyGv4Ku0JVaNFJGMHy0Gt9jy4afzEK0dc5PCf44riWVn5m7H4oi5zb6A8hx0dizhlfX5a6DTMK7QOAYVhXRlTNeeRquPnTqtZHmPRQFP+0odoWjubH6L+EnRg36tU4uchf3E1TaqeKGZhT+ZzYa1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by CO1PR11MB5156.namprd11.prod.outlook.com (2603:10b6:303:94::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 06:28:32 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 06:28:32 +0000
Date: Mon, 1 Dec 2025 14:28:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [jarkko-tpmdd:tpm2-session 10/18]
 drivers/char/tpm/tpm2-cmd.c:211:20: error: void value not ignored as it
 ought to be
Message-ID: <aS01h8E7FC/dKOLw@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|CO1PR11MB5156:EE_
X-MS-Office365-Filtering-Correlation-Id: 7892eb17-2453-4ed6-ccc1-08de30a2d918
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oqOdkb1VyhATLLBeGa7jAz8uar/idqxbYPHSp4LRyIzD89ZLkheqOYlPxero?=
 =?us-ascii?Q?jOTFEJZPcqxrBE+XSVI4ngqvEu3KShlGJwyqsXfdyXX6AaV61HhNyeL6VA87?=
 =?us-ascii?Q?2eJsNDQ9ctEYhGIztqWRFxXOdoHoi2OYD7owK8Ig8bdOW3yjQIMF0HdjJ2Da?=
 =?us-ascii?Q?zxy6iKYQoh5dbzDW9dYEJbIvhDkIeHN/8fknNfyKAmNeQ1dSpanevV3tSpzn?=
 =?us-ascii?Q?UGlJwBo80DuflmsV2Vu7Wenpx1rpJDwjPCPYzwGvs753o6xlzwZ4W+J8Hxmr?=
 =?us-ascii?Q?ZCaB/FPhuGuu9govopI9CCtr9deK3uO6KQ6KiG9+NMq6/3P4lLXqvBZFcFn8?=
 =?us-ascii?Q?DTuYG/Dl869eVgBQYOQrHgZVSw1bhsAY1hAX1U312gx6xrkg2tVGYXDJmO3e?=
 =?us-ascii?Q?ilf4XNc/RT4ZvD3mCTdE0IkWK+WjQsyo+iDUSK+23su/WpgA5at1MyVURVpZ?=
 =?us-ascii?Q?BAUNA5j1QBV6Af+vtkuYdMranscOcLIHhyTSmMDjuIu+2yGeOWWZCTG/zzFm?=
 =?us-ascii?Q?N43TjG5vLvszy+TjZi7ILjhdQwHMMOz8SFbPGRZnQzSuxsXgAJVnoLnf9EvH?=
 =?us-ascii?Q?PUqm3AoSAErdsSyvjaBRA9kCz1KO/kZPJTwgzu44hQPd7Oqsuxw+KTng4OgB?=
 =?us-ascii?Q?KzCmByWWjZQxQ5Curk+1GtlmnBdP7FA8aD17Vpcc9issAZlNQXeP9V5DM1XG?=
 =?us-ascii?Q?ro1jt2DVyEeV6GuzOPI6Ej0Bam1eKUMqaq/rovE3rXR0irsCjK7qDQCQMUxk?=
 =?us-ascii?Q?MHeyeDF+28qu59CT0Av6nnKnxfM9aufpS3ZgfmUCV9FtccCnVUtdd44UZZRm?=
 =?us-ascii?Q?ShcSmAvDsN0m67MdYWohiltja4YifFap57v38G+rZBTVs0LY2hQ1M1d/PSki?=
 =?us-ascii?Q?mgXoKspJDbiuVslxl11bsjtwjk1e4UI9FdypVe82yszE22WgU7CBTjvhvvp2?=
 =?us-ascii?Q?bt4Su54Gq7GGQZY9Ckxm73fnddULV/NUsRAIOrLoRXZ+KGQqujJPqbUHw8Zb?=
 =?us-ascii?Q?dOELH34t3hao2+aDc3/a3eWwjIV3WLrp9sFwLRM0DE/ecBfFxonTbxetrgcv?=
 =?us-ascii?Q?p41O3EaGNShzjiEoeE5ZvRXKbPvGBXQYpVtmsKZhaq/vnny2zwnj4sYSbJ7S?=
 =?us-ascii?Q?GcERFYyv9zEgxBsf+b/kh6QhQQAktGcu9Ash8vjexC1F/rpbqCA1PMMONVvF?=
 =?us-ascii?Q?T3EEvEW6ibIwq/vw9hfS7A4nmZvlrGGpML+DMbG+DkuCNrZYkjD4b2WARj5d?=
 =?us-ascii?Q?r+rrJ9Q72hbB5H4cK1cN8fTpvzXMHzNTUYj1/l+YT856iG2XeVU+s7/azjtL?=
 =?us-ascii?Q?kjUqUxsfWXDhJrSJfyO5szCXhrP1x9jnI040I8bmzKYzpGVOb41eM9W2HcrB?=
 =?us-ascii?Q?NCokXy0H7l6h83c7AXYkutwA1yVcsXxxU7NJ6PiId9C8Oo0oCqq+utVC1NbM?=
 =?us-ascii?Q?yFoK9TqTyqy1jaPbCi5r1IpXdSkoI9Xm/5dAEvFpWvPaxpEi+aRuUQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?odM3lxwBlmcb0/m9aYLwfpcAnLn1ctbw+J+Tq/bC2uJ8ayfZGF7LdMboQqsG?=
 =?us-ascii?Q?e4OISjQxA0T8t6XlvfMh8kx07cjkY4pWaobZq4gsvBThBHiNpQrnx8idqdvY?=
 =?us-ascii?Q?WUpC808L8uTXMds1YxmI2WK0hb2kmOLJHgCdcMnWXHqDpTO8gDhHNzByq7IP?=
 =?us-ascii?Q?AATezEdqTLcFG4rhFm7hsYQAV7v7A1Ek3GJqgETB7y+RAYBM7/bTTZvVx0US?=
 =?us-ascii?Q?IG0HMfOwi9lfnl0NifM9ixceUHycR8X0OYoMwjJq1eV7FIRlyTQvSYs4kjjA?=
 =?us-ascii?Q?1N0/W8tizF6/Xm3q4afJt+PxYxJnX/81NW3xkobdAyRoKCH/6t79MyBX1cBL?=
 =?us-ascii?Q?BV++2DjzmSEU7opGo+ldBa3ssaFI2rlwxgHCqu9O3+AUGqRYe1V8YcIgR8QW?=
 =?us-ascii?Q?F002tyf2Dr9Z8DQ6pSkfRnual1F0SdrEGKEbhSBs/fPbgQqch98WlUBvIztL?=
 =?us-ascii?Q?UWqY4VxHIiZMQ1j8x9wdBiiome7UOMk6lI8z4fyU5WRROfOuj0PRpLCbzNAD?=
 =?us-ascii?Q?e/q14T4KujrJ1UNJ+ukx8Gd9T+2bKJFqPXRB40ST9iyvpgKZYVyvmSFDSCRq?=
 =?us-ascii?Q?V5p+90+Pg5F0Cd0yUjj8PeVXz+NySCGGhM9skgQJBNLvKG6O8QFwuWNMA3FC?=
 =?us-ascii?Q?kZIBCUbJ5lvhlSG3LWYyUdHWiJy0ezbkQSwldUJx8ewgB39k6nWEI/yFKqQO?=
 =?us-ascii?Q?UhfCPDzGqbWTH9lxKmElpNQqtMdIzRKNDLyGzUyzQyg0+Z/PfpmMlC9js80e?=
 =?us-ascii?Q?ZqrS8+pg7n4AaWX5yBs8ZCL2lnWHB/jB4UhJw65jA3c+SPIFAsrOWaBbUhX8?=
 =?us-ascii?Q?oGB7zDsEEunJt1QAmMh7zPPVbAEKGJk6vd2A/4BHKMCjL6WdcNxRPeY8tZNH?=
 =?us-ascii?Q?CIqOoTvPEpx9a+N/TEgoZ/4jqidNaSb0NHQlJ/DGiPkKJRqHtlgjr18MBo4D?=
 =?us-ascii?Q?9qUifgrFUFjYUVzdU9RW2OcHWhADguRA+84ww/q2TYh34eOyFNkYXSTwutGn?=
 =?us-ascii?Q?mQQY/Z0C4j2WNu9yYcuGLlCmaavAXA3GUoxPBLNOeKT+0Wbh9QCDyBvV0OEO?=
 =?us-ascii?Q?W/4jX7VB7OUFvXRSQtaVrOij/Lzz0BUjAbLhtpVkt9StqXK7UWqAMQCFZC+T?=
 =?us-ascii?Q?JsOk6AicQ9ECZIJcMQWbfOnYDcC1EtllwG6iaLQIrGYru6TP8K6YvHZBOTs4?=
 =?us-ascii?Q?+iMUwIT5iOXPuFOXBtCc9jV1+BRB9JdK94v0bLtPJHO1rJ/qHxTjMYJcc5q6?=
 =?us-ascii?Q?830S2ubT3VUJmvZoy4qTuJQ0V98ZtxLZv815eEKVw1NwtZ5bAjF91qQkuCjC?=
 =?us-ascii?Q?sepTcg3KQJASgNWmadv4JX5HPWEpWK72Ekh+63WMokG8IQFD2rnOQO5uHI6o?=
 =?us-ascii?Q?OS+Q9JRbSnRLSCNibHbhA2LPkwtCcwKpVGxM5DPET7bzpQOIixJmVMwTaj0j?=
 =?us-ascii?Q?Bg+F4Rp196jEWH4rM6hfKZbOwWWa3155sTUefqCYAXOWP4DGndsTFRZVw/vW?=
 =?us-ascii?Q?Fl7wAV3Te9DoVIFi0KBWJI/EoQvoDIt1iu/xJI/D/MS9Xe4zzV1yyRuAS3i4?=
 =?us-ascii?Q?Fr0Jm9Ajbv6twYpUDGMEe4jVMWoL2nEfJexoPY3K?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7892eb17-2453-4ed6-ccc1-08de30a2d918
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 06:28:32.1894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c0zI9aygEAxhTki4WDi47YkGgklnPN/T3BLdOtyPM0eJgKRoKVZ8WYqjdchL9fL/IPA2fRN9gllDXgl8M4PgSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5156
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2-session
head:   9e1990f86d12b41f0b37d9414385587a5e79591c
commit: c094b019ad89433d0fc5e6b9bff002697178cfb2 [10/18] tpm2-sessions: address out-of-range indexing
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251201/202512011423.RlZBqKJg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512011423.RlZBqKJg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512011423.RlZBqKJg-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/tpm/tpm2-cmd.c: In function 'tpm2_pcr_extend':
>> drivers/char/tpm/tpm2-cmd.c:211:20: error: void value not ignored as it ought to be
     211 |                 rc = tpm_buf_fill_hmac_session(chip, &buf);
         |                    ^
   drivers/char/tpm/tpm2-cmd.c: In function 'tpm2_get_random':
   drivers/char/tpm/tpm2-cmd.c:276:21: error: void value not ignored as it ought to be
     276 |                 err = tpm_buf_fill_hmac_session(chip, &buf);
         |                     ^


vim +211 drivers/char/tpm/tpm2-cmd.c

7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  159  
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  160  /**
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  161   * tpm2_pcr_extend() - extend a PCR value
794c6e109b5938 Winkler, Tomas  2016-11-23  162   *
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  163   * @chip:	TPM chip to use.
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  164   * @pcr_idx:	index of the PCR.
c1f92b4b04ad70 Nayna Jain      2017-01-30  165   * @digests:	list of pcr banks and corresponding digest values to extend.
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  166   *
794c6e109b5938 Winkler, Tomas  2016-11-23  167   * Return: Same as with tpm_transmit_cmd.
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  168   */
0b6cf6b97b7ef1 Roberto Sassu   2019-02-06  169  int tpm2_pcr_extend(struct tpm_chip *chip, u32 pcr_idx,
aa042475938f58 Roberto Sassu   2019-02-06  170  		    struct tpm_digest *digests)
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  171  {
c1f92b4b04ad70 Nayna Jain      2017-01-30  172  	struct tpm_buf buf;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  173  	int rc;
c1f92b4b04ad70 Nayna Jain      2017-01-30  174  	int i;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  175  
27184f8905ba68 Jarkko Sakkinen 2024-11-13  176  	if (!disable_pcr_integrity) {
6519fea6fd372b James Bottomley 2024-04-29  177  		rc = tpm2_start_auth_session(chip);
c1f92b4b04ad70 Nayna Jain      2017-01-30  178  		if (rc)
c1f92b4b04ad70 Nayna Jain      2017-01-30  179  			return rc;
27184f8905ba68 Jarkko Sakkinen 2024-11-13  180  	}
c1f92b4b04ad70 Nayna Jain      2017-01-30  181  
6519fea6fd372b James Bottomley 2024-04-29  182  	rc = tpm_buf_init(&buf, TPM2_ST_SESSIONS, TPM2_CC_PCR_EXTEND);
6519fea6fd372b James Bottomley 2024-04-29  183  	if (rc) {
27184f8905ba68 Jarkko Sakkinen 2024-11-13  184  		if (!disable_pcr_integrity)
6519fea6fd372b James Bottomley 2024-04-29  185  			tpm2_end_auth_session(chip);
6519fea6fd372b James Bottomley 2024-04-29  186  		return rc;
6519fea6fd372b James Bottomley 2024-04-29  187  	}
c1f92b4b04ad70 Nayna Jain      2017-01-30  188  
27184f8905ba68 Jarkko Sakkinen 2024-11-13  189  	if (!disable_pcr_integrity) {
c094b019ad8943 Jarkko Sakkinen 2025-11-30  190  		rc = tpm_buf_append_name(chip, &buf, pcr_idx, NULL);
c094b019ad8943 Jarkko Sakkinen 2025-11-30  191  		if (rc) {
c094b019ad8943 Jarkko Sakkinen 2025-11-30  192  			tpm2_end_auth_session(chip);
c094b019ad8943 Jarkko Sakkinen 2025-11-30  193  			return rc;
c094b019ad8943 Jarkko Sakkinen 2025-11-30  194  		}
c094b019ad8943 Jarkko Sakkinen 2025-11-30  195  
6519fea6fd372b James Bottomley 2024-04-29  196  		tpm_buf_append_hmac_session(chip, &buf, 0, NULL, 0);
27184f8905ba68 Jarkko Sakkinen 2024-11-13  197  	} else {
27184f8905ba68 Jarkko Sakkinen 2024-11-13  198  		tpm_buf_append_handle(chip, &buf, pcr_idx);
27184f8905ba68 Jarkko Sakkinen 2024-11-13  199  		tpm_buf_append_auth(chip, &buf, 0, NULL, 0);
27184f8905ba68 Jarkko Sakkinen 2024-11-13  200  	}
c1f92b4b04ad70 Nayna Jain      2017-01-30  201  
0b6cf6b97b7ef1 Roberto Sassu   2019-02-06  202  	tpm_buf_append_u32(&buf, chip->nr_allocated_banks);
c1f92b4b04ad70 Nayna Jain      2017-01-30  203  
0b6cf6b97b7ef1 Roberto Sassu   2019-02-06  204  	for (i = 0; i < chip->nr_allocated_banks; i++) {
c1f92b4b04ad70 Nayna Jain      2017-01-30  205  		tpm_buf_append_u16(&buf, digests[i].alg_id);
879b589210a9a0 Roberto Sassu   2019-02-06  206  		tpm_buf_append(&buf, (const unsigned char *)&digests[i].digest,
879b589210a9a0 Roberto Sassu   2019-02-06  207  			       chip->allocated_banks[i].digest_size);
c1f92b4b04ad70 Nayna Jain      2017-01-30  208  	}
c1f92b4b04ad70 Nayna Jain      2017-01-30  209  
c094b019ad8943 Jarkko Sakkinen 2025-11-30  210  	if (!disable_pcr_integrity) {
c094b019ad8943 Jarkko Sakkinen 2025-11-30 @211  		rc = tpm_buf_fill_hmac_session(chip, &buf);
c094b019ad8943 Jarkko Sakkinen 2025-11-30  212  		if (rc) {
c094b019ad8943 Jarkko Sakkinen 2025-11-30  213  			tpm2_end_auth_session(chip);
c094b019ad8943 Jarkko Sakkinen 2025-11-30  214  			return rc;
c094b019ad8943 Jarkko Sakkinen 2025-11-30  215  		}
c094b019ad8943 Jarkko Sakkinen 2025-11-30  216  	}
c094b019ad8943 Jarkko Sakkinen 2025-11-30  217  
47a6c28b6861b1 Jarkko Sakkinen 2018-11-05  218  	rc = tpm_transmit_cmd(chip, &buf, 0, "attempting extend a PCR value");
27184f8905ba68 Jarkko Sakkinen 2024-11-13  219  	if (!disable_pcr_integrity)
6519fea6fd372b James Bottomley 2024-04-29  220  		rc = tpm_buf_check_hmac_response(chip, &buf, rc);
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  221  
c1f92b4b04ad70 Nayna Jain      2017-01-30  222  	tpm_buf_destroy(&buf);
c1f92b4b04ad70 Nayna Jain      2017-01-30  223  
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  224  	return rc;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  225  }
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  226  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

