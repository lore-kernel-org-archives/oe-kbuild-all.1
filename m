Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C0312C499
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Aug 2025 01:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754616614; cv=fail; b=YThmDUTpvlcOp/UN7KBlrfeG+jayCx2ejDim+DErQeXiU+BoT1gSzTx5lT+FjIos57yu3uRthVdpFpOW3Z44GJaVVR2zP25UEZ0HGBW71Qcn3rLgiEzJlUag0G2A+kEhAylV+EXVz+Er15lK9tR5h3Hs7jkK02kYiyQ6vYlerj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754616614; c=relaxed/simple;
	bh=n/Edi1faz+FgAe8lZttXzeyHX8RFz8s1p4USwSfuaxA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UGiLErBJIffkjQTCfhyM+rgzS6kLdLpnS03Q0wirIpyr59snhHLBh99cwrtdNMIOSwfMHcmLN14C6JI3F7srjT/NnE0nOu9rYrM/jaadnyeaE6Uk0coRCjX0m6Sm7N3IHDcizdrj2sRbFq8ujmtOx/PLxAyYMdoiICUZ0zL20J4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fjKngPVr; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fjKngPVr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754616612; x=1786152612;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=n/Edi1faz+FgAe8lZttXzeyHX8RFz8s1p4USwSfuaxA=;
  b=fjKngPVrAyl1xj5sH8EDr0+uUK/2Rg0m2rageVur+0wkYFGROpLEBzQr
   HxaFeesJywY595USNPVXcU3emWSf8jagnFzYDnHT5qFFNXmIJQ0O0qbf1
   KAVw3z7RouG09PHx5CnuPGNwA6dk+2N12MlI3QsCl9bzJqR0knZCDmJH4
   PVIxBdR9KR8kuiuTsEc0oSI1tbaynEao0yPu++i+/uRDRwh7d6vFNGrbN
   dAXWmh1lN4vBoAQZfkQccpn2VNazuvQ3NOGh59ZMZoX4NTCEhH+NgovMy
   iDHs/ZoXzMm22pwaWSseDK8L6K9IW/Qkd9lgjSXZBSFFUoi46sLkZB7/I
   w==;
X-CSE-ConnectionGUID: E37lAoy8TkSqx8XhrJqplQ==
X-CSE-MsgGUID: 0wfAhnn4RkeZ27vXm1ak6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="82409194"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="82409194"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 18:26:28 -0700
X-CSE-ConnectionGUID: UDjLp3UFR/Ko0Pzn1gfAPA==
X-CSE-MsgGUID: DNeJskSwTnKksaxvv0sLzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="202370235"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 18:26:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 18:26:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 18:26:25 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.70)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 7 Aug 2025 18:26:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k6vzNoz5ZCgIDDa+h4bY62LcQS+4BjqCpUOSaLgjas06RBvjCBdvF12vJi0rEaQWqLaohqjkEAMkPt1RWnYeoNUsXCCLQjyANbNBvWWt6SWxOZ8EiEWzXV5kvsM3zyqec1RLGRM6ZQbynqp4yAj2Fb6eOZ7A9QsugPgf9tvJehSBPixSlZkZTkySnywVglF8kSYwHMXt43aivkU8kxEWyIDEDHvKICippjQjBNoMVNuiRWpIXWDTgSlhALUkZpysy2D+WmMjsBMB+eiGMRtb19/A9gi2rD2dNxt/KVQjLJUPULTlVbxvjq3a4VkUUXDBOWRUAEMIXX15pGZdf66P7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=akM3sa7UyxhjLpdE06C9/aHqRnV5uPtLP6dxAqDU1cU=;
 b=WCAF4VJ8Ur5xP57nVRnlSdd04jctHChrby/qPs5XN1TVjNUFjVzfK0cE279KN0dgYbvuemPJkQK7IpW6ziq7synXvAQVtNksjF/AP8rJQ9GNxXn5mzlLnBu4ecyXupLke1HFgHry/8rMg+1Ts+XF15k8OvLkuzaVHKOg0wGerswKXLw+H9giR4/dgMmnNIJKoFSobNHQyeRqKqF9K8zcXnmDCUBIEpxYLfQd/N9oFvMPI6cxgCbmgkcTB5SpGJ95QIWEubB/kDNi2rfh4lIXrwZLO8pWneVDONhnaaSWxq3PGuoFIqqSlo9G8KfgRBmOwDWaS5shdUc+5psxll+pJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Fri, 8 Aug
 2025 01:26:23 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%3]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 01:26:23 +0000
Date: Fri, 8 Aug 2025 09:26:15 +0800
From: Philip Li <philip.li@intel.com>
To: Alexandre Ghiti <alex@ghiti.fr>
CC: Matthew Wilcox <willy@infradead.org>, kernel test robot <lkp@intel.com>,
	<oe-kbuild-all@lists.linux.dev>, <linux-riscv@lists.infradead.org>
Subject: Re: [linux-next:master 13554/13560] ERROR: modpost:
 __ex_table+0x1560 references non-executable section
 '.data.rel.local.f2fs_attr_sb_encryption'
Message-ID: <aJVSN6pfxW5MxoQ0@rli9-mobl>
References: <202508071840.SzIzxq5q-lkp@intel.com>
 <aJSeL1pF3Qleih6D@casper.infradead.org>
 <4298b995-52c0-4587-b098-3f8824dbfedf@ghiti.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4298b995-52c0-4587-b098-3f8824dbfedf@ghiti.fr>
X-ClientProxiedBy: SG2PR04CA0169.apcprd04.prod.outlook.com (2603:1096:4::31)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|PH7PR11MB5818:EE_
X-MS-Office365-Filtering-Correlation-Id: bb608d71-29c5-475a-c07f-08ddd61a95e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pNNinY/zEQDIKIvBLErzQ7EocbOXq8+1kITb06LGncipBxL3vSpVGtfIoGVb?=
 =?us-ascii?Q?IWokJ6EJztj/NBKUTYTkw42DsFjVUnTxQo1ctgnjf3rsT6zx0ZJ4iwx9zneS?=
 =?us-ascii?Q?SfqYAJH738pVUk1xkX7C2SIbQ1Z8E0skDzSuj6MxbBENHDSqEJ1bwpJCJ7Aj?=
 =?us-ascii?Q?BdClYqItn5yMIqjc1uv7YjDZaNzF2pT1z0lJfYA4mTt0kuKGh8dfpjAjBwoR?=
 =?us-ascii?Q?g0m5ZwBmwLXjHIujsrtjRCobqU3BGa8bPkzcGTacoj3tsHLzyUBM+f3fw5Me?=
 =?us-ascii?Q?AK2yS04SKyhwfsNL3wcpFCeYebFjCJT3rA4vecV62csdUy50W6s6jKsRMnxE?=
 =?us-ascii?Q?TSNMS49Vo5HwIgtIAYvEoQb9AxyaU2iJoXnZuHr6s/Wp962whs1AdPzSc4EQ?=
 =?us-ascii?Q?9/9feZLWI+tFJ8Q2aRHSqIMmun8m0u2bSO9K8KWhel/915evIRG3CbeMISXI?=
 =?us-ascii?Q?x1Ibxz/dObCAfjiQ1g4xHLlkDnY3WjvgxCQqsAIykAgK284+vBAFAKs+ZKdW?=
 =?us-ascii?Q?Kcf1xV8PLwOG2Cb48dhVSyHzAWS915mCRMsF3JZAN6xHnZS/HvmI5jTDQITV?=
 =?us-ascii?Q?3IZ6d4MEKCbgKYXe0yaTQcfekg8uAbVbhLeczvQbNEOEABM+9yYizKbasBEO?=
 =?us-ascii?Q?iztUP0viRhMpzQaIlPE8JtCbk1/rCy5SNSAz3c7kHqlkIQU7oLflai0C8IQL?=
 =?us-ascii?Q?tI2P80k7Y1hWtaNKE26eJLsh4D4yof4s7C6y8OQL5z4h6CkHQW+j5Ekn7bVP?=
 =?us-ascii?Q?nwYL60cMm6bXjw2I75PCN3HM716r0x08q7SJmfRXgQDVVF3Z+vbfhDPLpb7n?=
 =?us-ascii?Q?YPbpAgtcvgDjCyUXNWBiA5f9Eb+k4zWXvuMFVCqMt4IDEwtTRYZSvlI1zXfn?=
 =?us-ascii?Q?eGwJtOoCcm/6jNzbueOfqwW6O6E/tqIOjxM5rrZQaHHvwrE1nuwL29FlnzQ9?=
 =?us-ascii?Q?gSI/m1yxgGLi+ooKjHtDi2qFXAoBGDpKanjDmoTnecEpG4OBgRJqu2Mt+m0U?=
 =?us-ascii?Q?sas9vctqwK2au7Rn7uCyE+xPK95Y0wmPCIxLwQV8jr5LRv3QGrxqsezBzGMe?=
 =?us-ascii?Q?AillFKkUSs+s9wj13n7G7MhndK9I/qXdF1roVXhCNo72oyPsy+AgEdLOmYLE?=
 =?us-ascii?Q?Nwpk5tIBO7jSx8Ub6Cqut69JK0FwQIVegmvKpQYM2R2gIwmUOf+BNopG8h3G?=
 =?us-ascii?Q?haNncUe7zIo59DOsdGoShrtDQIkArBhYcnnooCLnXRbBDIKAJkP0vSKaTpAj?=
 =?us-ascii?Q?oGPVj3Q4j36kWgdoeOfN2PSIKJ1Enf4Dcapaa8mbDpjij60PT0Agk/NgfQoy?=
 =?us-ascii?Q?S5Sgv2VDz+3c+meZlkDW1oqcViItalwKJWQpgMPpFT3LdLWmAqO8ipoHa5iS?=
 =?us-ascii?Q?tKtLHvAYP7HA2Wnx8d+yQujFEVgL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aXi6/Agn8AhflVMA/Uh+3Be1aSznpWyGn91eg8e6EbaQxGkwvxLCgHIo2Y0F?=
 =?us-ascii?Q?gnbQE4eW+oumeH5GQ1rcefVwR8qi2bRvCYzowqeqb+d/mua1OSAr3sPzrL1+?=
 =?us-ascii?Q?byT87bB1Sbbz/OPzPnm3LKN3aKKw/g4s/YOWIDhyjMAKjfroLgIA9RwHkv1y?=
 =?us-ascii?Q?vLC8yYtkudGIF08DzpAQtzHVQyxYV/bvSiFsUZr5D1FlEpegxsdUXgD/+nMH?=
 =?us-ascii?Q?u2yfvyLeO/hk2tfoTXsGviCl4KaGOn3+rxr9xDch4Qt3/NJpJWlK/PLtJWBz?=
 =?us-ascii?Q?xZjukp4xpGuG+YV3C1y2302iocJ+r2fCCoHa98UuNRvP+ygH5qr18XqAhFDP?=
 =?us-ascii?Q?LxxszJM1Sth/QaaKsuqUV5bWoLAbYCngiUAYMd01kFSmQB7A7eP1yNPSuw5j?=
 =?us-ascii?Q?8NByqis+Fy2KKgtuOk9TFdAjHmX4ahXn+lVM6wp8rCnp7iThJMhgsHHm2oty?=
 =?us-ascii?Q?udYMxgu1jhlYtC6R3EBt9rFOypDyxAzAaYd8IgypOMpBiPb9Ss5CWTlID0ue?=
 =?us-ascii?Q?vjM9A7t8NkYY/B1QCfsj4EF+3q6A7yDLVBuUymDjLnZ05wlyJHOAGvhB4jEr?=
 =?us-ascii?Q?GGMxcs6Z+Dg/qNJiB7Qvn+es1sT72pJ7PGNGgdwyua77kIx73B53y3siK7Ej?=
 =?us-ascii?Q?y8lzRorq9yZdwwMtfiyRkFdMMdMKvefBmYao1P4fAJ4Y9IULugD48jbTeToa?=
 =?us-ascii?Q?iwMf5YVthBWIUvaGecze90opOW8IqPi5OZ6RGmiVJfIQqqzRdZj8xjpPZDTk?=
 =?us-ascii?Q?fkG7/NWfPtUqGgbOTutU/m/24IKy5JtRZ/YhLUIAyCkkOxw3cOBdN4i6Y42j?=
 =?us-ascii?Q?TvwuW8MXVNlI6mThxosMg98DIj1BTt0/7SAzi03OAzZ+Yv7aPJITiSXObkNm?=
 =?us-ascii?Q?Yye1PAjEwjWklDDYfBw8x1ae4vgyN4XFPS0WNiUjCcxy4cLQpCYFVDEneKFT?=
 =?us-ascii?Q?WxcKVFoX5vPjUSFOnGgNQ/mDpVs/U0+jEvRz+1mn9HzL2+RsmLzowYk+6cyb?=
 =?us-ascii?Q?xvycGlI/wvIdhz6tfWPXSw5wsbo1Axy89reHQzMgeCzlrRIreN7YF534R6aX?=
 =?us-ascii?Q?ZG95MIzlbi6tPGF5ygYCnyEIJ8AwQXHozTMvOThyrQ+XiKFi3dSgOU7OqNcC?=
 =?us-ascii?Q?kHtSUGBL+lSEhNqXmQiEvXOxubgF0dzHa1GXrUrs3i4NwiAz6e6TUEpon6gW?=
 =?us-ascii?Q?GszZnDzGdXy7xccDtQaHWo97+y+ZdMlanYYI7mkdAhho/eUYY77jjRBEOgR+?=
 =?us-ascii?Q?QGux9IMXNfvjvyfbqzAh0batPTXGqIgDAL2Io9lm0OGlISPvL3svYSI0vmkc?=
 =?us-ascii?Q?W7ch9farPaGXb0QJjYccnTnS+2fWsh9BHUGS6ZMasflal70QE0jQWcJDsSTI?=
 =?us-ascii?Q?iph83ZZta3Eh3eMoY0aRYStK/kzx+IzAUo2UeHFNADKQIeED6fiAAIYba1TS?=
 =?us-ascii?Q?8SVzgV+CiF99LCt+91AeU0vTLgezRLj/AEjkdUEM/5W78XQdetdGBLmRj+j8?=
 =?us-ascii?Q?zUNCnHpztuhIp8dO9+9ybZCLENL3lpa4eLisR1LecloRjlV4xeAn5Uqq9IVc?=
 =?us-ascii?Q?ktPgj7MJBsX7EoYH/BCX3EsRwcZ+LnYOs2Ox4uGL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb608d71-29c5-475a-c07f-08ddd61a95e9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 01:26:23.2809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pMDj7S1P+6ql4Ago2Ij5DElSVhlw2aVxLyc+jMGhPtyXGHorFXWW1ReraVLPkhAcKZx5F3+9I+Qbl/0Ju+ka/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5818
X-OriginatorOrg: intel.com

On Thu, Aug 07, 2025 at 03:07:52PM +0200, Alexandre Ghiti wrote:
> On 8/7/25 14:38, Matthew Wilcox wrote:
> > This looks like a bug in the riscv toolchain.  forwarding.
> 
> 
> Thanks for the forward, we are aware of the problem, it's been reported
> multiple times now [1].

Sorry for the duplicated reports, i will update the bot to ignore the further
report of this issue.

> 
> [1] https://lore.kernel.org/linux-riscv/d5e49344-e0c2-4095-bd1f-d2d23a8e6534@ghiti.fr/
> 
> 
> > 
> > On Thu, Aug 07, 2025 at 06:14:29PM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > head:   442d93313caebc8ccd6d53f4572c50732a95bc48
> > > commit: 495bbad443e5d730527ea3dd232e4aaec3462dc6 [13554/13560] Merge branch 'main' of git://git.infradead.org/users/willy/xarray.git
> > > config: riscv-randconfig-002-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071840.SzIzxq5q-lkp@intel.com/config)
> > > compiler: riscv32-linux-gcc (GCC) 8.5.0
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071840.SzIzxq5q-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202508071840.SzIzxq5q-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>, old ones prefixed by <<):
> > > 
> > > WARNING: modpost: vmlinux: section mismatch in reference: ___ratelimit+0x108 (section: .text.___ratelimit) -> tps6594_i2c_driver_init (section: .init.text)
> > > WARNING: modpost: vmlinux: section mismatch in reference: ___ratelimit+0x18a (section: .text.___ratelimit) -> tps6594_i2c_driver_init (section: .init.text)
> > > WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x10e (section: .text.vsnprintf) -> bd9571mwv_driver_exit (section: .exit.text)
> > > WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x164 (section: .text.vsnprintf) -> cs42l43_i2c_driver_exit (section: .exit.text)
> > > WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x16c (section: .text.vsnprintf) -> cs42l43_i2c_driver_exit (section: .exit.text)
> > > WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x18a (section: .text.vsnprintf) -> bd9571mwv_driver_init (section: .init.text)
> > > WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x18e (section: .text.vsnprintf) -> cs42l43_i2c_driver_init (section: .init.text)
> > > WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x1a6 (section: .text.vsnprintf) -> cs42l43_i2c_driver_init (section: .init.text)
> > > WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x1b2 (section: .text.vsnprintf) -> cs42l43_i2c_driver_exit (section: .exit.text)
> > > WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x1d0 (section: .text.vsnprintf) -> cs42l43_i2c_driver_exit (section: .exit.text)
> > > WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x1e0 (section: .text.vsnprintf) -> cs42l43_i2c_driver_exit (section: .exit.text)
> > > WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x216 (section: .text.vsnprintf) -> cs42l43_i2c_driver_exit (section: .exit.text)
> > > WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x24c (section: .text.vsnprintf) -> cs42l43_i2c_driver_exit (section: .exit.text)
> > > WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x262 (section: .text.vsnprintf) -> cs42l43_i2c_driver_exit (section: .exit.text)
> > > WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x2ee (section: .text.vsnprintf) -> cs42l43_i2c_driver_exit (section: .exit.text)
> > > WARNING: modpost: vmlinux: section mismatch in reference: bstr_printf+0xb6 (section: .text.bstr_printf) -> bd9571mwv_driver_init (section: .init.text)
> > > WARNING: modpost: vmlinux: section mismatch in reference: bstr_printf+0xe0 (section: .text.bstr_printf) -> bd9571mwv_driver_exit (section: .exit.text)
> > > WARNING: modpost: vmlinux: section mismatch in reference: bstr_printf+0x106 (section: .text.bstr_printf) -> bd9571mwv_driver_init (section: .init.text)
> > > WARNING: modpost: vmlinux: section mismatch in reference: bstr_printf+0x138 (section: .text.bstr_printf) -> bd9571mwv_driver_init (section: .init.text)
> > > WARNING: modpost: vmlinux: section mismatch in reference: bstr_printf+0x17e (section: .text.bstr_printf) -> cs42l43_i2c_driver_init (section: .init.text)
> > > WARNING: modpost: vmlinux: section mismatch in reference: bstr_printf+0x186 (section: .text.bstr_printf) -> bd9571mwv_driver_exit (section: .exit.text)
> > > WARNING: modpost: vmlinux: section mismatch in reference: bstr_printf+0x1be (section: .text.bstr_printf) -> bd9571mwv_driver_exit (section: .exit.text)
> > > WARNING: modpost: vmlinux: section mismatch in reference: bstr_printf+0x1c6 (section: .text.bstr_printf) -> cs42l43_i2c_driver_exit (section: .exit.text)
> > > WARNING: modpost: vmlinux: section mismatch in reference: bstr_printf+0x33a (section: .text.bstr_printf) -> cs42l43_i2c_driver_exit (section: .exit.text)
> > > WARNING: modpost: vmlinux: section mismatch in reference: xas_destroy+0x16 (section: .text.xas_destroy) -> tps65912_i2c_driver_init (section: .init.text)
> > > WARNING: modpost: vmlinux: section mismatch in reference: __xas_nomem+0x20 (section: .text.__xas_nomem) -> tps65912_i2c_driver_init (section: .init.text)
> > > WARNING: modpost: vmlinux: section mismatch in reference: xas_nomem+0x20 (section: .text.xas_nomem) -> tps65912_i2c_driver_init (section: .init.text)
> > > WARNING: modpost: vmlinux: section mismatch in reference: xas_free_nodes+0x2a (section: .text.xas_free_nodes) -> tps65912_i2c_driver_init (section: .init.text)
> > > WARNING: modpost: vmlinux: section mismatch in reference: xas_store+0x2f2 (section: .text.xas_store) -> tps65912_i2c_driver_init (section: .init.text)
> > > WARNING: modpost: vmlinux: section mismatch in reference: xas_store+0x4ba (section: .text.xas_store) -> tps65912_i2c_driver_init (section: .init.text)
> > > WARNING: modpost: vmlinux: section mismatch in reference: xas_store+0x54c (section: .text.xas_store) -> tps65912_i2c_driver_init (section: .init.text)
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1494 (section: __ex_table) -> f2fs_attr_gc_idle (section: .data.rel.local.f2fs_attr_gc_idle)
> > > ERROR: modpost: __ex_table+0x1494 references non-executable section '.data.rel.local.f2fs_attr_gc_idle'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1498 (section: __ex_table) -> f2fs_attr_gc_max_sleep_time (section: .data.rel.local.f2fs_attr_gc_max_sleep_time)
> > > ERROR: modpost: __ex_table+0x1498 references non-executable section '.data.rel.local.f2fs_attr_gc_max_sleep_time'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x14a0 (section: __ex_table) -> f2fs_attr_gc_mode (section: .data.rel.local.f2fs_attr_gc_mode)
> > > ERROR: modpost: __ex_table+0x14a0 references non-executable section '.data.rel.local.f2fs_attr_gc_mode'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x14a4 (section: __ex_table) -> f2fs_attr_gc_no_zoned_gc_percent (section: .data.rel.local.f2fs_attr_gc_no_zoned_gc_percent)
> > > ERROR: modpost: __ex_table+0x14a4 references non-executable section '.data.rel.local.f2fs_attr_gc_no_zoned_gc_percent'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x14ac (section: __ex_table) -> f2fs_attr_gc_reclaimed_segments (section: .data.rel.local.f2fs_attr_gc_reclaimed_segments)
> > > ERROR: modpost: __ex_table+0x14ac references non-executable section '.data.rel.local.f2fs_attr_gc_reclaimed_segments'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x14b0 (section: __ex_table) -> f2fs_attr_gc_segment_mode (section: .data.rel.local.f2fs_attr_gc_segment_mode)
> > > ERROR: modpost: __ex_table+0x14b0 references non-executable section '.data.rel.local.f2fs_attr_gc_segment_mode'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x14b8 (section: __ex_table) -> f2fs_attr_gc_urgent_sleep_time (section: .data.rel.local.f2fs_attr_gc_urgent_sleep_time)
> > > ERROR: modpost: __ex_table+0x14b8 references non-executable section '.data.rel.local.f2fs_attr_gc_urgent_sleep_time'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x14bc (section: __ex_table) -> f2fs_attr_hot_data_age_threshold (section: .data.rel.local.f2fs_attr_hot_data_age_threshold)
> > > ERROR: modpost: __ex_table+0x14bc references non-executable section '.data.rel.local.f2fs_attr_hot_data_age_threshold'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x14c4 (section: __ex_table) -> f2fs_attr_ipu_policy (section: .data.rel.local.f2fs_attr_ipu_policy)
> > > ERROR: modpost: __ex_table+0x14c4 references non-executable section '.data.rel.local.f2fs_attr_ipu_policy'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x14c8 (section: __ex_table) -> f2fs_attr_hot_data_age_threshold (section: .data.rel.local.f2fs_attr_hot_data_age_threshold)
> > > ERROR: modpost: __ex_table+0x14c8 references non-executable section '.data.rel.local.f2fs_attr_hot_data_age_threshold'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x14d0 (section: __ex_table) -> f2fs_attr_lifetime_write_kbytes (section: .data.rel.local.f2fs_attr_lifetime_write_kbytes)
> > > ERROR: modpost: __ex_table+0x14d0 references non-executable section '.data.rel.local.f2fs_attr_lifetime_write_kbytes'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x14d4 (section: __ex_table) -> f2fs_attr_hot_data_age_threshold (section: .data.rel.local.f2fs_attr_hot_data_age_threshold)
> > > ERROR: modpost: __ex_table+0x14d4 references non-executable section '.data.rel.local.f2fs_attr_hot_data_age_threshold'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x14dc (section: __ex_table) -> f2fs_attr_max_discard_request (section: .data.rel.local.f2fs_attr_max_discard_request)
> > > ERROR: modpost: __ex_table+0x14dc references non-executable section '.data.rel.local.f2fs_attr_max_discard_request'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x14e0 (section: __ex_table) -> f2fs_attr_hot_data_age_threshold (section: .data.rel.local.f2fs_attr_hot_data_age_threshold)
> > > ERROR: modpost: __ex_table+0x14e0 references non-executable section '.data.rel.local.f2fs_attr_hot_data_age_threshold'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x14e8 (section: __ex_table) -> f2fs_attr_max_io_bytes (section: .data.rel.local.f2fs_attr_max_io_bytes)
> > > ERROR: modpost: __ex_table+0x14e8 references non-executable section '.data.rel.local.f2fs_attr_max_io_bytes'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x14ec (section: __ex_table) -> f2fs_attr_max_read_extent_count (section: .data.rel.local.f2fs_attr_max_read_extent_count)
> > > ERROR: modpost: __ex_table+0x14ec references non-executable section '.data.rel.local.f2fs_attr_max_read_extent_count'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x14f4 (section: __ex_table) -> f2fs_attr_max_small_discards (section: .data.rel.local.f2fs_attr_max_small_discards)
> > > ERROR: modpost: __ex_table+0x14f4 references non-executable section '.data.rel.local.f2fs_attr_max_small_discards'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x14f8 (section: __ex_table) -> f2fs_attr_hot_data_age_threshold (section: .data.rel.local.f2fs_attr_hot_data_age_threshold)
> > > ERROR: modpost: __ex_table+0x14f8 references non-executable section '.data.rel.local.f2fs_attr_hot_data_age_threshold'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1500 (section: __ex_table) -> f2fs_attr_migration_granularity (section: .data.rel.local.f2fs_attr_migration_granularity)
> > > ERROR: modpost: __ex_table+0x1500 references non-executable section '.data.rel.local.f2fs_attr_migration_granularity'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1504 (section: __ex_table) -> f2fs_attr_hot_data_age_threshold (section: .data.rel.local.f2fs_attr_hot_data_age_threshold)
> > > ERROR: modpost: __ex_table+0x1504 references non-executable section '.data.rel.local.f2fs_attr_hot_data_age_threshold'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x150c (section: __ex_table) -> f2fs_attr_min_fsync_blocks (section: .data.rel.local.f2fs_attr_min_fsync_blocks)
> > > ERROR: modpost: __ex_table+0x150c references non-executable section '.data.rel.local.f2fs_attr_min_fsync_blocks'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1510 (section: __ex_table) -> f2fs_attr_hot_data_age_threshold (section: .data.rel.local.f2fs_attr_hot_data_age_threshold)
> > > ERROR: modpost: __ex_table+0x1510 references non-executable section '.data.rel.local.f2fs_attr_hot_data_age_threshold'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1518 (section: __ex_table) -> f2fs_attr_min_seq_blocks (section: .data.rel.local.f2fs_attr_min_seq_blocks)
> > > ERROR: modpost: __ex_table+0x1518 references non-executable section '.data.rel.local.f2fs_attr_min_seq_blocks'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x151c (section: __ex_table) -> f2fs_attr_mounted_time_sec (section: .data.rel.local.f2fs_attr_mounted_time_sec)
> > > ERROR: modpost: __ex_table+0x151c references non-executable section '.data.rel.local.f2fs_attr_mounted_time_sec'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1524 (section: __ex_table) -> f2fs_attr_moved_blocks_foreground (section: .data.rel.local.f2fs_attr_moved_blocks_foreground)
> > > ERROR: modpost: __ex_table+0x1524 references non-executable section '.data.rel.local.f2fs_attr_moved_blocks_foreground'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1528 (section: __ex_table) -> f2fs_attr_ovp_segments (section: .data.rel.local.f2fs_attr_ovp_segments)
> > > ERROR: modpost: __ex_table+0x1528 references non-executable section '.data.rel.local.f2fs_attr_ovp_segments'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1530 (section: __ex_table) -> f2fs_attr_pending_discard (section: .data.rel.local.f2fs_attr_pending_discard)
> > > ERROR: modpost: __ex_table+0x1530 references non-executable section '.data.rel.local.f2fs_attr_pending_discard'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1534 (section: __ex_table) -> f2fs_attr_hot_data_age_threshold (section: .data.rel.local.f2fs_attr_hot_data_age_threshold)
> > > ERROR: modpost: __ex_table+0x1534 references non-executable section '.data.rel.local.f2fs_attr_hot_data_age_threshold'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x153c (section: __ex_table) -> f2fs_attr_ram_thresh (section: .data.rel.local.f2fs_attr_ram_thresh)
> > > ERROR: modpost: __ex_table+0x153c references non-executable section '.data.rel.local.f2fs_attr_ram_thresh'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1540 (section: __ex_table) -> f2fs_attr_reclaim_segments (section: .data.rel.local.f2fs_attr_reclaim_segments)
> > > ERROR: modpost: __ex_table+0x1540 references non-executable section '.data.rel.local.f2fs_attr_reclaim_segments'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1548 (section: __ex_table) -> f2fs_attr_reserved_pin_section (section: .data.rel.local.f2fs_attr_reserved_pin_section)
> > > ERROR: modpost: __ex_table+0x1548 references non-executable section '.data.rel.local.f2fs_attr_reserved_pin_section'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x154c (section: __ex_table) -> f2fs_attr_revoked_atomic_block (section: .data.rel.local.f2fs_attr_revoked_atomic_block)
> > > ERROR: modpost: __ex_table+0x154c references non-executable section '.data.rel.local.f2fs_attr_revoked_atomic_block'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1554 (section: __ex_table) -> f2fs_attr_sb_casefold (section: .data.rel.local.f2fs_attr_sb_casefold)
> > > ERROR: modpost: __ex_table+0x1554 references non-executable section '.data.rel.local.f2fs_attr_sb_casefold'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1558 (section: __ex_table) -> f2fs_attr_hot_data_age_threshold (section: .data.rel.local.f2fs_attr_hot_data_age_threshold)
> > > ERROR: modpost: __ex_table+0x1558 references non-executable section '.data.rel.local.f2fs_attr_hot_data_age_threshold'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1560 (section: __ex_table) -> f2fs_attr_sb_encryption (section: .data.rel.local.f2fs_attr_sb_encryption)
> > > > > ERROR: modpost: __ex_table+0x1560 references non-executable section '.data.rel.local.f2fs_attr_sb_encryption'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1564 (section: __ex_table) -> f2fs_attr_sb_flexible_inline_xattr (section: .data.rel.local.f2fs_attr_sb_flexible_inline_xattr)
> > > > > ERROR: modpost: __ex_table+0x1564 references non-executable section '.data.rel.local.f2fs_attr_sb_flexible_inline_xattr'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x156c (section: __ex_table) -> f2fs_attr_sb_inode_crtime (section: .data.rel.local.f2fs_attr_sb_inode_crtime)
> > > > > ERROR: modpost: __ex_table+0x156c references non-executable section '.data.rel.local.f2fs_attr_sb_inode_crtime'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1570 (section: __ex_table) -> f2fs_attr_sb_project_quota (section: .data.rel.local.f2fs_attr_sb_project_quota)
> > > > > ERROR: modpost: __ex_table+0x1570 references non-executable section '.data.rel.local.f2fs_attr_sb_project_quota'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1578 (section: __ex_table) -> f2fs_attr_sb_readonly (section: .data.rel.local.f2fs_attr_sb_readonly)
> > > ERROR: modpost: __ex_table+0x1578 references non-executable section '.data.rel.local.f2fs_attr_sb_readonly'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x157c (section: __ex_table) -> f2fs_attr_hot_data_age_threshold (section: .data.rel.local.f2fs_attr_hot_data_age_threshold)
> > > ERROR: modpost: __ex_table+0x157c references non-executable section '.data.rel.local.f2fs_attr_hot_data_age_threshold'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1584 (section: __ex_table) -> f2fs_attr_sb_verity (section: .data.rel.local.f2fs_attr_sb_verity)
> > > ERROR: modpost: __ex_table+0x1584 references non-executable section '.data.rel.local.f2fs_attr_sb_verity'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1588 (section: __ex_table) -> f2fs_attr_umount_discard_timeout (section: .data.rel.local.f2fs_attr_umount_discard_timeout)
> > > ERROR: modpost: __ex_table+0x1588 references non-executable section '.data.rel.local.f2fs_attr_umount_discard_timeout'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1590 (section: __ex_table) -> __text (section: .data.rel.ro.local.__text.41490)
> > > ERROR: modpost: __ex_table+0x1590 references non-executable section '.data.rel.ro.local.__text.41490'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1594 (section: __ex_table) -> __text (section: .data.rel.ro.local.__text.41514)
> > > ERROR: modpost: __ex_table+0x1594 references non-executable section '.data.rel.ro.local.__text.41514'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x15fc (section: __ex_table) -> .LASF965 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x15fc references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1600 (section: __ex_table) -> .LASF967 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x1600 references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1608 (section: __ex_table) -> .LASF969 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x1608 references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x160c (section: __ex_table) -> .LASF971 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x160c references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1614 (section: __ex_table) -> .LASF973 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x1614 references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1618 (section: __ex_table) -> .LASF975 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x1618 references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1620 (section: __ex_table) -> .LASF977 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x1620 references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1624 (section: __ex_table) -> .LASF979 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x1624 references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x162c (section: __ex_table) -> .LASF981 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x162c references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1630 (section: __ex_table) -> .LASF983 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x1630 references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1638 (section: __ex_table) -> .LASF985 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x1638 references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x163c (section: __ex_table) -> .LASF987 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x163c references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1644 (section: __ex_table) -> .LASF989 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x1644 references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1648 (section: __ex_table) -> .LASF991 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x1648 references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1650 (section: __ex_table) -> .LASF993 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x1650 references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1654 (section: __ex_table) -> .LASF991 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x1654 references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x165c (section: __ex_table) -> .LASF996 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x165c references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1660 (section: __ex_table) -> .LASF991 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x1660 references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1668 (section: __ex_table) -> .LASF999 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x1668 references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x166c (section: __ex_table) -> .LASF1001 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x166c references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1674 (section: __ex_table) -> .LASF1003 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x1674 references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1678 (section: __ex_table) -> .LASF1005 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x1678 references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x16ec (section: __ex_table) -> .LASF1510 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x16ec references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x16f0 (section: __ex_table) -> .LASF1512 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x16f0 references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x16f8 (section: __ex_table) -> .LASF1514 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x16f8 references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x16fc (section: __ex_table) -> .LASF1512 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x16fc references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1704 (section: __ex_table) -> .LASF1517 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x1704 references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1708 (section: __ex_table) -> .LASF1512 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x1708 references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1710 (section: __ex_table) -> .LASF1520 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x1710 references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1714 (section: __ex_table) -> .LASF1512 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x1714 references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x171c (section: __ex_table) -> .LASF1523 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x171c references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1720 (section: __ex_table) -> .LASF1512 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x1720 references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1728 (section: __ex_table) -> .LASF1526 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x1728 references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x172c (section: __ex_table) -> .LASF1512 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x172c references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1734 (section: __ex_table) -> .LASF1529 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x1734 references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1738 (section: __ex_table) -> .LASF1531 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x1738 references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1740 (section: __ex_table) -> .LASF1533 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x1740 references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1744 (section: __ex_table) -> .LASF1535 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x1744 references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x174c (section: __ex_table) -> .LASF1537 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x174c references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1750 (section: __ex_table) -> .LASF1539 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x1750 references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1758 (section: __ex_table) -> .LASF1541 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x1758 references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x175c (section: __ex_table) -> .LASF2868 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x175c references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1764 (section: __ex_table) -> .LASF1544 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x1764 references non-executable section '.debug_str'
> > > WARNING: modpost: vmlinux: section mismatch in reference: 0x1768 (section: __ex_table) -> .LASF1546 (section: .debug_str)
> > > ERROR: modpost: __ex_table+0x1768 references non-executable section '.debug_str'
> > > 
> > > -- 
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
