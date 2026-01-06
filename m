Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011069.outbound.protection.outlook.com [52.101.62.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7820D330644
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jan 2026 13:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767706107; cv=fail; b=L20IqTcgtxJp4yKxVFYgkR0ZiD5F/lt2iUwP42oh5PSh3c2Pdnh07GUoKH6hYW/gDo6vvWrS2vE5S2FK6h0eYthE2+vxI45IwNMgA+CoMKbHC27XMM1TEGo3cp+YzPgU7gDZU2goRZoYVwAPdr0ERsoUJ7uk8ZBpNrMc/8X2mpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767706107; c=relaxed/simple;
	bh=gvrtV6mzy8qANqCvgL6GHACNzh0draAc5Fx1bxrFvXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=W+APoFzkY9s0bhtBPM9bVlaSJ8Kjrs9YH+90yGVxZdKNPcjnWJURZE8qQWMuzGnUoMK0rFli6yijgq/ceG4G15j3DtqzXzXTRvmB6m1jbigBdj3LobMweRHYzsQ3VSD6ta2+q/B+xNUUAlwg7KGpmzn5+GlU/jvVouOiTkCybak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VRJ7hMJk; arc=fail smtp.client-ip=52.101.62.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VRJ7hMJk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fCXULJRUf6Lq6vcz2VTGpAgtE+MBfyJZI0Uz23EPG54THvesOJckgwlYT9s2kTU06o1eT37sBiXcgbtSe3ZC0/zCV4D2GWzc62nbmLyVmW2rIn0FvlEAVAdacNQPT+H2dxogHcceAqZ3eui3EjyKP0OldpW26zoH0rV3E18exIVBwITCmDk2xjXwclS5wXmwmtI3PpRTRp//rclfQDJRbcXf1uhU4eWqxdEnV7a47QqYYACQRjjLH+ybtoINbYILakdEiLJbKdxcjp5ljC4WxJI+alvThIph5zSKC7YsQS2Gvfa+4QA/eN9Qtl9eujn+0B3Vd92bAWrQOMgRRnZKUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+nN+e9TbSGSKd8eoZmUynabknRZHwAlXVxkH6Om3KzA=;
 b=ULhspHvobEO+bhjtV5gYosBif+SeyuWVcfx24m76PWqfaBHFCK5tMuI2oMj7p7GTMEEPSJl6CCk7wT2y9f5+kf96SjuIj81qME/36N9N0WTjHslgC2yCDU7yStm5lTHuYf3GnHW7U2iNgkh7OTdXJwABimIgeb2FKy4PAFu3n7cCbSGGgp/pZAKIkhbqQsXSn/5qSd25YJko303QBTLTur0kdpbmNZjyf9o9lU82UaXsNKFg41HRTSOzyWWbwrAYWlX25fs4QlmMLcIJhKyCNq9cMbZpL+jm4oc5et/6YAT4Zfpfwu0kM6EIyfrlmBHeqEuxu5J2chNQraFIzV7BvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+nN+e9TbSGSKd8eoZmUynabknRZHwAlXVxkH6Om3KzA=;
 b=VRJ7hMJk1DQc0Jug+IRF1H973z174iHnPKj/knPAjbQU89aViMy064xR/jehydjHXzw0GtNd/V+x9x1nTMKrciAewrSsn4bzkHUq83VwGXrfx5imnwlXaOd9LbWkaVyqMaR5AO1kgqfsRRf2UNeLh/IkixUH1dnIhFb7NBW3zrLq7OSTPqGN3QstaVYRdT9bIg89jhx9a+KhO+Nox62krvajzxKhYHaqFrGctzlKza7HLVsWozV4zCAwaEgMx6qbidbdDjlQm8grIJPHtmRJQ4jxlc1ojbjhd6mhH3j1vkko+gKCQWvLYWSRB1UBAvJ6EFT6xbSJw9EiXYHEcS2A8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by MN0PR12MB6269.namprd12.prod.outlook.com (2603:10b6:208:3c3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 13:28:22 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%3]) with mapi id 15.20.9499.002; Tue, 6 Jan 2026
 13:28:22 +0000
Date: Tue, 6 Jan 2026 09:28:21 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: lkp <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Joerg Roedel <joerg.roedel@amd.com>
Subject: Re: ERROR: modpost: "__pt_no_sw_bit"
 [drivers/iommu/generic_pt/fmt/iommu_amdv1.ko] undefined!
Message-ID: <20260106132821.GA293394@nvidia.com>
References: <202512230720.9y9DtWIo-lkp@intel.com>
 <BL1PR11MB5271B4C385F1205E98B8535B8C87A@BL1PR11MB5271.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL1PR11MB5271B4C385F1205E98B8535B8C87A@BL1PR11MB5271.namprd11.prod.outlook.com>
X-ClientProxiedBy: BL1P223CA0002.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::7) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|MN0PR12MB6269:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b4135ae-1940-4449-4c86-08de4d277660
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2wamCpltLWrKq2JOI6LYKyDHYiYeXsvpJXtqjkzmWyF+uSWDXR0jcsdAN9Gx?=
 =?us-ascii?Q?VOHf32zJ44te970zmZppmnaB6HqVygCDKvHyBSTTQJQcAiw9cNIB7+to2PTD?=
 =?us-ascii?Q?RB9fq1Btc45rVXA5gWCAtlqAjhHW6FFTU4x5/oljtpFcFZxDKnRAmWFqghN+?=
 =?us-ascii?Q?gvI6wfuJG1M2SU4gEdemM8g9Zar6HYlemQHHzHnIgAgbYSLS1bcEPWYQueUB?=
 =?us-ascii?Q?wYXQZOg7Eiz4Pt82qUK86IKEgZeuvCxGXlXd0nkWoQL3rpJxTPdEDk9MyRya?=
 =?us-ascii?Q?I3uonNV72soe8eEZgoXqnCV/EA41H1JWv34CP6lcHmG45ctxqAeKJ1RZeYgG?=
 =?us-ascii?Q?Zc618fLdh7xhfuZREXJxerZ5XdljJ7frPX7QhonuB9/XR64LnRuxv8QrpAbS?=
 =?us-ascii?Q?JemxxdRlQjx7wRI+Ln9x0Vew/iz7mVJ4P4uU/Bs0GkG4yVFVsgwCHB7/3o/p?=
 =?us-ascii?Q?n8XLXYf2jIkyjjceIATPX4LhG4owSiyK421ndg4L2FPOHTbysp+bJDpAlQcb?=
 =?us-ascii?Q?+6z2kJSKbbJhcmbHTdkgxs9tTH8LZmCBHYVy+thwc7dAgoAtm5c2mfJTtwEw?=
 =?us-ascii?Q?HyAvzKyraJ34cIqf3NNhJ082piB9RriegKwVlj9WWUrQUvN2vzg4vlNs8Ezr?=
 =?us-ascii?Q?NOuO+iP/5YFNWkUmGBKDVMfQKenMjIHgXMFy7cJVHtJyeXdGnAWgQLZONJ3D?=
 =?us-ascii?Q?AXZvcutYbDbyfcibekV+G3u4zIlOL96itluPyCyuvTyLq6DJSloMXg5yNaVo?=
 =?us-ascii?Q?QgYpZBm4mmRFP8iEQTz7qu7bSI76JgOP1DplLE/nObuWTKGa9ypwxeZhXJOe?=
 =?us-ascii?Q?QbVilkPn4UmpbxpqJ0XG9tNVXnWWjID27L68vEM8sZehPwDOpauxOPiXCf5I?=
 =?us-ascii?Q?u8E2wZN8yHNxQgQZoNorZLEeDmHK4IxMzd33v2vWIXLh+NYCBlf6wV2GVbTX?=
 =?us-ascii?Q?sCSuq5TB17+j4mJCmNqzlaYahvN3O5wac4NR+QRm5gwN/qLnJPp+/rPYfc1V?=
 =?us-ascii?Q?qSDs5vtX9p8KHZv7YiwA9CSMEaSHb0OYhcYCVNBXShb31f+r7UptpmGPMoCB?=
 =?us-ascii?Q?PBJiiJ5SKixy7DWvGlG6HKEZU+T7WQZUUxJeIBxe6tJYrt8cFvjkxfqITbEu?=
 =?us-ascii?Q?oQ+6TqiOiAw/POlL284fLznbQJcD0bcObMyRwrnRqffOaQRIPN5GGaC8YW0/?=
 =?us-ascii?Q?S6fvUxoZsoNNAAcMJL4NuskxHASDqS4LQxzccxSpqepXiOZT2HV3XMG9bD+m?=
 =?us-ascii?Q?DH7Mkn/HVUxbxpMU1T7X5CD9aHZ7ItWUT1ZdDSBULZGBZcaw55Dt46tPfvGJ?=
 =?us-ascii?Q?SsaJ6Il/VHiwhLmUzDkibUIEQA24hSUYFjl2JHYyAM3PxtvpRV3CyxzY1eFD?=
 =?us-ascii?Q?myJG0RC4A7Zu3lZ64kqGPZHUojiS3S56IkIogRAHGU0d+YwBeoZzc12ob2nm?=
 =?us-ascii?Q?fPrAbwnMLspcJRzwcl+Y1rr+gWrFu7BEK9Huy2rq1930Nn76AId4/g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?drGkUSh53O7bS3R/hsh/Nk1ojIwaX8urmvIaefny6xbSr84yxC9l2hNs1bd0?=
 =?us-ascii?Q?ioTdsB75DZbnFjkUnXztMr1zr+EoSV5BjRCrG/Zzyyvm7kShyT/LNxyz3IB4?=
 =?us-ascii?Q?MEKhEjF8TKSx7GGI0zZqrmTEvieUbwB+DgMqncGeghb6Y7n5tdcYPOuzsvJz?=
 =?us-ascii?Q?nKqglyllFeHg60bymCiOH7ttc0+zydNf0O6oJBVKaQtfaWmkR7Exth8iM+Ky?=
 =?us-ascii?Q?OsJmstxD6RnNzYCN9NwT7CxE9zTQckq3E5+D3up4yJzoLmP63pRWU11BYlgH?=
 =?us-ascii?Q?I+AQUDjV1mZcmertVsCkjB6ILwMlIbZ7CASDCiqKlJSWj2Dp6kmr1WDn604M?=
 =?us-ascii?Q?TzQJwmykTMTQ1eN8bALjwiSbb0NuavD341ROXkgJ7FdEMeGt/l0BC1taoXs1?=
 =?us-ascii?Q?E4nF2p2tILbqDarDYSHd8yo+WXovD5ey+W6Czk0txqUH7RlxDefWvSDRUt6m?=
 =?us-ascii?Q?PqV9p65BngKNkKrgn2z5saZLBPMcIfIWAn6k0gWl6j+mieAtJf7uJWWUwskZ?=
 =?us-ascii?Q?CdZF+tgF5XXiWlLptPnpY9GjGnbVh4yH6LxMHVSLDWvAtxgyZEtMdGq+qfCP?=
 =?us-ascii?Q?ral88MmxvV7yxBb75OSdW/KoDr/OxT3sTDCGB1k4iSp8VtGsLuex9H3gMnhc?=
 =?us-ascii?Q?Q24i84F8+abg4Wd0kPheZKWQMaWcrdBwiAw1P4Un/XixVwh4EApALoRe/Dtp?=
 =?us-ascii?Q?PRvky3KIaQVuDz8zKID3gdnhDczTDcC/I9Y3TydoSJ+GIfSp2XzBOjtiwv36?=
 =?us-ascii?Q?olYNRhUgi1+WxwWJvQcPbHkbRVS48l1bRZxZFcuIp9HiZE7gdeCcXk2JcYKM?=
 =?us-ascii?Q?d7NrnCWnNmEZSP4UFK9f2pWkI0wQ/5VV2OIN/HI8/V9xzl83g24T/4cIivLb?=
 =?us-ascii?Q?hClY+McIQm/bY9yHfA+1yu4cSILqV6c540desei5CC6e/lpVPUylX3t7pUsO?=
 =?us-ascii?Q?XHDEuFZYJqVIZ1nGhLOSUa3IZH4MYlBPbmeqXWLtP+Xxq/a7hUjyl36ytjhC?=
 =?us-ascii?Q?rzX51KA6NfDRCvmVqGhpQxYy5tRjSJ/AX3BySm5zPi+8I023Z1qQAw+vcHNf?=
 =?us-ascii?Q?/aJoRZxdwbJo9t3oT8+gjzONvbUbbfWZv5n/tDvxiOB2m70wgQIO8uVWGqkN?=
 =?us-ascii?Q?FfeuxnxyKr66bXXDWt90HsT6RFLYK8KC4VF11IEYZ51r3+9ihu1qWhPOCDwN?=
 =?us-ascii?Q?QewIFYmfN9z553mjdM4GL1hmBF3zetlmisVJNPmwN7JplsnrOQ/kuOv6drlF?=
 =?us-ascii?Q?J+g/DMiLHo4XWvKchtXUaJXCTNd17d+kFrt/V1CGvaNlb3Hd45GKzdIj/t8g?=
 =?us-ascii?Q?UGSWjr/rflzsyD+JdIIxOI7MQT/VoRfrb53pcavaKOuHF4FB49Qg1COZZiIo?=
 =?us-ascii?Q?z1ezOMjohPJ949xYinDDuPUl1DbYZFLMNybwlOw4bo0sECJSb7ow/hft72Zp?=
 =?us-ascii?Q?qO/4EbqA7edn9BNbBAHdezRw0JU/8KsFCPwPmhS4eAxyuR+ZW0Kh/LnB0akX?=
 =?us-ascii?Q?TdSb8o04XgmGGFZ1M2k9KomjtoEYL2B8s2xcnbgOvpTFwLcwahH8hrNbtElj?=
 =?us-ascii?Q?JXGimdcoOaIf2/wRtOCIj7FyKq3sOQWbk6t71FCQhSfY2mpgcIU3xvqx2eJ3?=
 =?us-ascii?Q?9JdxQss6RdgcWXTxS5i3BP8HcPQ/M8+pQ16yeyiM6CSzctRucdP95AFGLdGD?=
 =?us-ascii?Q?nVKA6mFx/Q/j8m+0OcQV7p3uauYqfUbzq4KCKHsE7RGpa4NBdwCJdg9xRDnB?=
 =?us-ascii?Q?7LSZNlSMsQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b4135ae-1940-4449-4c86-08de4d277660
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 13:28:22.1007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g3+vGld/18+0EjhCxJ9VxSotu2JhDyUxESEdcsjlBnzKjlxfaH+2AhwbYbVbSRN/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6269

On Tue, Jan 06, 2026 at 08:09:27AM +0000, Tian, Kevin wrote:
> > From: lkp <lkp@intel.com>
> > Sent: Tuesday, December 23, 2025 7:25 AM
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> > master
> > head:   b927546677c876e26eba308550207c2ddf812a43
> > commit: efa03dab7ce4ed786b131f412440e2fd45fba11f iommupt: Flush the
> > CPU cache after any writes to the page table
> > date:   7 weeks ago
> > config: powerpc64-randconfig-r051-20251223
> > (https://download.01.org/0day-
> > ci/archive/20251223/202512230720.9y9DtWIo-lkp@intel.com/config)
> > compiler: powerpc64-linux-gcc (GCC) 8.5.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-
> > ci/archive/20251223/202512230720.9y9DtWIo-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202512230720.9y9DtWIo-
> > lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> > 
> > >> ERROR: modpost: "__pt_no_sw_bit"
> > [drivers/iommu/generic_pt/fmt/iommu_amdv1.ko] undefined!
> > 
> 
> Jason, are you deliberately leaving it undefined to catch config which shouldn't
> compile generic_pt in, or is it indeed a bug?

I think this was already fixed:

https://lore.kernel.org/all/0-v1-63a2cffb09da+4486-iommufd_gcc_bounds_jgg@nvidia.com/

commit efa03dab7ce4ed786b131f412440e2fd45fba11f does not have that
change.

Jason
