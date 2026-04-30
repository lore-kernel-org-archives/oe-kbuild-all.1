Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011061.outbound.protection.outlook.com [40.107.130.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21A840DFA4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 09:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777539938; cv=fail; b=RJ9ZBCkYxDBUacixpnO54bS77zUpV+FLvGQVz0fPkax66wNP+m20si09N5ZRvYI0gkpRIAjEAaSJxXqHCeZdxMFU1JhXyYb5FRy+iuHuI1qWbLzE0g63USNtcpe7vGcxdEDDx89UIm7IcuuuEBp1iMIo/UORNPWMP/H9LLvWUzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777539938; c=relaxed/simple;
	bh=/3CAiKyrdmBD8Tzq5bbCzq2Vyh04P6K+eTpUEx8L0ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Dte5m075meisCxQ0ITVvSm2G4EFu/7wNULLTLtqZsWv4QjTZu7mizwlRCvZPM86deHiu+q1fFnbOzwrvjHzkV/5ZvbnTFByvzIeUisaZnCcpro5tAsYW+9dGQ7quKNr+DHTHHvsvWjFmcKmIKIwe+y7bAhXbzqIInQzVNBcLMB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mDB3dkGy; arc=fail smtp.client-ip=40.107.130.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mDB3dkGy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kC0l8ThOcaW7zXMoP7E7O7sMV1VszM/JzONMR92zVzERgwsSMqWADFfTjsW+ESyMSs4yaZUiZ3aJIGelP9TdfMP/JB4v5Amlyf0p6YUmM0CKIusAdq+cZ+ekkPebgvzILyJreiH9HXBQ0v6C3rqU1hTBCO6i30jyZtKasz5aIhdhXTmjm/5usSns1S2V2hHrjPI20bdK1gu2U9FxmCqtTHQFZqnygRbNJMhHh9mNtkL6GVmZ8uAkeHz6hF31Hc9LEtCpeiqo4ig8iCbRRGGrD5FVvu4LyJX05SYdqZnhV9Ff9VlFeZtoDKyGX5pvrwLc/qx7JWGFxbg6lE2sZjQxJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KiFNtOj6b78kQdrV/MQ5v489WotyTZ8gGHAWCrISsCE=;
 b=nWRHd7HVrkUMARhEHNSQH1amvOVZhQ28Hb/OC2LaXzBIv/FnoHgiPd1Oag80EHvX743hT4GYvfQLP62ocvywoqBCOGe+4r8Kp0nSFzpncvwY/BydAmius53Qt77rxuu8pM9Y5uATGTuQqRnfOrxAavJfZsBmpPmtjSmuo2pFpxI+MrEpFjOATBpUu4wEuks4H1wa0W/hBeXBQv1SNU28tS/L58Rw2/pex4FZjzMwttfLUJTiBRo4Vpm3hKGBZCAqx27RGiUIHbIdJPuvedrNJTDbtaDL/5Jw0+1U39HhBloBYdKIPoRYMHQwyOitvjMOuMLGWnYVKRh1Tm2tyAeL+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KiFNtOj6b78kQdrV/MQ5v489WotyTZ8gGHAWCrISsCE=;
 b=mDB3dkGyO443RBqaJ6ViWNDSksxfghnpn4WMJawXfaOV+uG6FdpNdOJ8L87CK+vrPZPlXKIwcT8SyFzn1PzmZuJ8IQVxwz9S2urGgLwEuP+QkQ1ApunVmnVd4uWjtm3ErJ0hxtlUsE97cIB3kf6fkvOnvGc+s5RiiApV4nkRBoDtZsIxLhvRqYA08CzvTaiNpLlngB6mmM14QlvFg0zkMy9sRoUvS2DeNpDzMD/vCTtOVkioysx6XdWxZxWn/ofar9V+lf2rhcqYNKr0CDcSIF/cSny5zWPnc/hsMCIyGpP1d17BWjUdPJhQuqh6JMiJZOwjKACMz97gEUajRnXIfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by VE1PR04MB7294.eurprd04.prod.outlook.com (2603:10a6:800:1a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 09:05:31 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9846.025; Thu, 30 Apr 2026
 09:05:31 +0000
Date: Thu, 30 Apr 2026 12:05:28 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: kernel test robot <lkp@intel.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
	Kishon <kishon@ti.com>
Subject: Re: [phy:phy_7.2 26/27] drivers/usb/dwc3/dwc3-imx.c:74:3: error:
 implicit declaration of function 'device_property_read_bool'; did you mean
 'device_store_bool'?
Message-ID: <20260430090528.hr5swgzjmjgbgvfz@skbuf>
References: <202604301628.FO3dQRui-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202604301628.FO3dQRui-lkp@intel.com>
X-ClientProxiedBy: VI5PEPF0000098A.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::80d) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|VE1PR04MB7294:EE_
X-MS-Office365-Filtering-Correlation-Id: 95abb9e2-acc3-4893-7fcd-08dea697a17c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|19092799006|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NNkZ8bYdygomKhqqLzJbtdMX6juQ+Wy1YDXai2zS1bLHoI3pzvtnmsoQaaS6SMSz/Q3X5IdNTrfv/M9I/hrt1ceb40MV/qRn8ja1uhkPVeTR8zKxzCGfVvlH9Loj60hMK1qb0eHzx8JQ9k5pkqBVg/lX0DEAVM1yKxg4kBTRYdmeH4LUcwf86FjpS+ii5+cNnRhD70ldwqF6LQPZwEVDZ3vD94voh1yLW/eMxoDmw6SCRqroMLs0hM+p2mgPWfEy0rISUPCJ8RAsR+gOENnBQym5wwy0F9d2g/khyJHHrxhTj7vzkWec/H9gq4z6H1ysTWyiLVy98NhSCwBeOtw+YisEevDQ372HZYxRsD1Pio203cmU0IHxw5IA1NgblrCx3Y4laGRNr0QYl/QhETQRWiWUTL2oxUp+AFYDfvOKdpBkoxH7lLTQGFCnnaD84x2g63I5ZkHRV6avsdoyGk9WcD/n/DAM+EklIgfOtNSikAsUKJqSp9suDVchte679o1sZkLv3C+mZKilP4oLFyxKiKQitCZEvJh+CM+eZEV2N+QYH3zvzbKDzysx29i9WPvbiSwYMT3LlBF89cdb7dTX/ID3RlXPIL1LocCq/O1SNFEauestUDimzdU1Yg+i2h2zQ3pC8pDqEDOzJGV+l+/syGqZfGivdgctt8NjzHApGrJSGyx035ZTgBcE7d3dnHcg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(19092799006)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TvFzMFPXo5mBrUV0AjzfXwFZyJpyU2Ux5LpqDT8YXHcxiNuxh7uaAL++IT9x?=
 =?us-ascii?Q?1ha25gPQodPcu+7MUTsESSSYqUzX8kpF8qwqrK4v5s0XOVxMs4dQvDdWZduw?=
 =?us-ascii?Q?6vWlt5sKl6bC95wkkPdWz+r5NrI4cnzKvbl+xT5FfWwJ1ypMj9biKEJcDSZT?=
 =?us-ascii?Q?/Lsjv/eEEij/JbiCcZnc4uJ5dLDjoTZvGCYkemDG+m61L+m+svZ4jx4E1q8+?=
 =?us-ascii?Q?SfFCxrmy/AmhjiCj6jJVKCXL7Kx0HYtmbMnMz76OaZePLwKDDCpNa7ZCeNdp?=
 =?us-ascii?Q?4mTrLxoC5gLropSyHI6N1Mi0kPnZ4nCj35mQFhTXiyh5I6O6B+0a8GPe93V3?=
 =?us-ascii?Q?i1Ef5o6R81vnIYvjCmKTDgMIy8JBQRuZ1LCMxLVBp2mlI85lSHTVL92Oo7xV?=
 =?us-ascii?Q?4aVeo7pmHi0OaMtGiUdARD1XVy0zbSNy2GC/PSlsZw4WxH4N3DB9Zv8ilOMi?=
 =?us-ascii?Q?/T3jkkJAAsszCKJvS8HInNNlv5hsgSdEMoSchK8Q2xTQmhFj6jQnX5d7u3uI?=
 =?us-ascii?Q?gNZZXgSUJdpIbOWQE+De24BCUcxTqUHjvt9p93//dPireoFetUvgeqFRhf2t?=
 =?us-ascii?Q?5TR+0PD0ML6mlElmZWYPiPxyR9TDrX5WvlYxcRHpxfT3JyXxQP8qbZKe7vrB?=
 =?us-ascii?Q?AqxNMJm8ZSeD9ShhvmwSEbUiFvPxZ9D6FKWJxWSuga5oITY8OxSiEy6huAik?=
 =?us-ascii?Q?emXKSablCMl1mZGwsCGrlWzb7mjIdlZt8Lzoz3WBAKXjySHOeP1R3QoQQa3p?=
 =?us-ascii?Q?KYwrs9UUjJ8vGe1T2lBYBCFoNgB95dtRRmOeciabdgq/NaFliiHxet6q/VNK?=
 =?us-ascii?Q?U9MC/rmv8dRRkJYFoBPlA3IOOSTTO9myfiOnb0abvHxxZN1JfDmuayHpl7LH?=
 =?us-ascii?Q?DRYdbL0AZ4glDO2H+CuUGcS5yPb6ZgezB0jvXga9DJ4Rl0Eslfzl4H4wcnPv?=
 =?us-ascii?Q?0C2ijB5hxtzT+vXq7irs7rZufVzvUYMofEXTId/B/N5i61vCv1LPLugynigL?=
 =?us-ascii?Q?fSno2c7SrVoh/Cyc99T/ihRQkAguMbdtx5CdoqBIOSWWtmaiogP7xnTnKNxH?=
 =?us-ascii?Q?gbf7ls8w6rrNQT6jfjSnaZoKetoHh8Hwir26WZi4qePqH3aHAxaWoE1iMysj?=
 =?us-ascii?Q?KjJL6R2borpOGskRHaU2BraE3MV8i9pJq9JrvUquyjkXpEjU9euoGasdezR9?=
 =?us-ascii?Q?BnbastzGuWgVY6yGEU4i1QhX85AhLRehKUqz3OjXJh2KZrfLyDJKH3YnNlIS?=
 =?us-ascii?Q?AUx3FWJpyzAqZ7pfY4Wqua5RcQ4ZMjTW35y3vMIVSlJHZNd5d8PRLwQP52M7?=
 =?us-ascii?Q?E465elmrEi0v0k7f7ma3os8DzC5rVbWS2dEaxbGYNhzj66WSMNKxJLbgVU3s?=
 =?us-ascii?Q?xkU3UxkBdmP2attFRvCiX/sqmpb9YL3aH6N3b0QI9yAn4KUMvWeig7DDGFkE?=
 =?us-ascii?Q?/y/+7oMSUQvMgfGSozwUgeedlQMxVF5NrZTeCr4KDEefF9G9XYwssFIJpbhi?=
 =?us-ascii?Q?lxv5VtCLTaZI/5NlQCOcI+UH3rxS7QDOZdu8v3qMdO/twCZw6Jl/D0p1twI7?=
 =?us-ascii?Q?Qa+puqDKf9s/mITnkm9eohBv+cSZH/90PP9vzMkLXYjTFabuv04CPap57sc1?=
 =?us-ascii?Q?9BTtEvtsERsxTmgwirw7is1ALW5U9vfPxQzvoWYwsXivOoC0khuxjpc1uhBc?=
 =?us-ascii?Q?hLRJ7U1/MEKTzWahGXavqjUJj9ce4+KBDP47iRvDD8JOXGqnD70SWzGo2r1m?=
 =?us-ascii?Q?eFaiOdTPtP1neWhqeeN9e4YVoyXuVjSZfnyzDtq4bNDFJeC0UHKez+vrKYz7?=
X-MS-Exchange-AntiSpam-MessageData-1: kOIzxaJe6p/JbEkfPUBUnsPgcZBcajNudAc=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95abb9e2-acc3-4893-7fcd-08dea697a17c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 09:05:31.5782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XJeRckWKsf1K6Q8F/ySQ0RF91mUrciBNQCZ/P3VeV/A+/s0MhTTvOKclw8NyFmn+7g/8w42xk8a99fBhLVQcTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7294

On Thu, Apr 30, 2026 at 04:38:21PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git phy_7.2
> head:   d097a6ebab1ffe9286cca190fe74d51b01d80dc3
> commit: 9ed7a91a68cbba256d1a53c353bf6c62c7e056f0 [26/27] phy: remove temporary provider compatibility from consumer header
> config: arm-randconfig-001 (https://download.01.org/0day-ci/archive/20260430/202604301628.FO3dQRui-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301628.FO3dQRui-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604301628.FO3dQRui-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
>    drivers/usb/dwc3/dwc3-imx.c: In function 'dwc3_imx_get_property':
> >> drivers/usb/dwc3/dwc3-imx.c:74:3: error: implicit declaration of function 'device_property_read_bool'; did you mean 'device_store_bool'? [-Werror=implicit-function-declaration]
>       device_property_read_bool(dev, "fsl,permanently-attached");
>       ^~~~~~~~~~~~~~~~~~~~~~~~~
>       device_store_bool
>    drivers/usb/dwc3/dwc3-imx.c: At top level:
> >> drivers/usb/dwc3/dwc3-imx.c:184:36: error: array type has incomplete element type 'struct property_entry'
>     static const struct property_entry dwc3_imx_properties[] = {
>                                        ^~~~~~~~~~~~~~~~~~~
> >> drivers/usb/dwc3/dwc3-imx.c:185:2: error: implicit declaration of function 'PROPERTY_ENTRY_BOOL' [-Werror=implicit-function-declaration]
>      PROPERTY_ENTRY_BOOL("xhci-missing-cas-quirk"),
>      ^~~~~~~~~~~~~~~~~~~
> >> drivers/usb/dwc3/dwc3-imx.c:190:21: error: variable 'dwc3_imx_swnode' has initializer but incomplete type
>     static const struct software_node dwc3_imx_swnode = {
>                         ^~~~~~~~~~~~~
> >> drivers/usb/dwc3/dwc3-imx.c:191:3: error: 'const struct software_node' has no member named 'properties'
>      .properties = dwc3_imx_properties,
>       ^~~~~~~~~~
> >> drivers/usb/dwc3/dwc3-imx.c:191:16: warning: excess elements in struct initializer
>      .properties = dwc3_imx_properties,
>                    ^~~~~~~~~~~~~~~~~~~
>    drivers/usb/dwc3/dwc3-imx.c:191:16: note: (near initialization for 'dwc3_imx_swnode')
>    drivers/usb/dwc3/dwc3-imx.c: In function 'dwc3_imx_probe':
> >> drivers/usb/dwc3/dwc3-imx.c:255:8: error: implicit declaration of function 'device_add_software_node'; did you mean 'device_add_of_node'? [-Werror=implicit-function-declaration]
>      ret = device_add_software_node(dev, &dwc3_imx_swnode);
>            ^~~~~~~~~~~~~~~~~~~~~~~~
>            device_add_of_node
> >> drivers/usb/dwc3/dwc3-imx.c:272:3: error: implicit declaration of function 'device_remove_software_node'; did you mean 'device_remove_of_node'? [-Werror=implicit-function-declaration]
>       device_remove_software_node(dev);
>       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>       device_remove_of_node
>    drivers/usb/dwc3/dwc3-imx.c: At top level:
> >> drivers/usb/dwc3/dwc3-imx.c:190:35: error: storage size of 'dwc3_imx_swnode' isn't known
>     static const struct software_node dwc3_imx_swnode = {
>                                       ^~~~~~~~~~~~~~~
> >> drivers/usb/dwc3/dwc3-imx.c:184:36: warning: 'dwc3_imx_properties' defined but not used [-Wunused-variable]
>     static const struct property_entry dwc3_imx_properties[] = {
>                                        ^~~~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors
> 
> 
> vim +74 drivers/usb/dwc3/dwc3-imx.c
> 
> 76fc9452a6bfb6 Xu Yang 2026-02-12   68  
> 76fc9452a6bfb6 Xu Yang 2026-02-12   69  static void dwc3_imx_get_property(struct dwc3_imx *dwc_imx)
> 76fc9452a6bfb6 Xu Yang 2026-02-12   70  {
> 76fc9452a6bfb6 Xu Yang 2026-02-12   71  	struct device	*dev = dwc_imx->dev;
> 76fc9452a6bfb6 Xu Yang 2026-02-12   72  
> 76fc9452a6bfb6 Xu Yang 2026-02-12   73  	dwc_imx->permanent_attached =
> 76fc9452a6bfb6 Xu Yang 2026-02-12  @74  		device_property_read_bool(dev, "fsl,permanently-attached");
> 76fc9452a6bfb6 Xu Yang 2026-02-12   75  	dwc_imx->disable_pwr_ctrl =
> 76fc9452a6bfb6 Xu Yang 2026-02-12   76  		device_property_read_bool(dev, "fsl,disable-port-power-control");
> 76fc9452a6bfb6 Xu Yang 2026-02-12   77  	dwc_imx->overcur_active_low =
> 76fc9452a6bfb6 Xu Yang 2026-02-12   78  		device_property_read_bool(dev, "fsl,over-current-active-low");
> 76fc9452a6bfb6 Xu Yang 2026-02-12   79  	dwc_imx->power_active_low =
> 76fc9452a6bfb6 Xu Yang 2026-02-12   80  		device_property_read_bool(dev, "fsl,power-active-low");
> 76fc9452a6bfb6 Xu Yang 2026-02-12   81  }
> 76fc9452a6bfb6 Xu Yang 2026-02-12   82  
> 76fc9452a6bfb6 Xu Yang 2026-02-12   83  static void dwc3_imx_configure_glue(struct dwc3_imx *dwc_imx)
> 76fc9452a6bfb6 Xu Yang 2026-02-12   84  {
> 76fc9452a6bfb6 Xu Yang 2026-02-12   85  	u32		value;
> 76fc9452a6bfb6 Xu Yang 2026-02-12   86  
> 76fc9452a6bfb6 Xu Yang 2026-02-12   87  	if (!dwc_imx->glue_base)
> 76fc9452a6bfb6 Xu Yang 2026-02-12   88  		return;
> 76fc9452a6bfb6 Xu Yang 2026-02-12   89  
> 76fc9452a6bfb6 Xu Yang 2026-02-12   90  	value = readl(dwc_imx->glue_base + USB_CTRL0);
> 76fc9452a6bfb6 Xu Yang 2026-02-12   91  
> 76fc9452a6bfb6 Xu Yang 2026-02-12   92  	if (dwc_imx->permanent_attached)
> 76fc9452a6bfb6 Xu Yang 2026-02-12   93  		value |= USB_CTRL0_USB2_FIXED | USB_CTRL0_USB3_FIXED;
> 76fc9452a6bfb6 Xu Yang 2026-02-12   94  	else
> 76fc9452a6bfb6 Xu Yang 2026-02-12   95  		value &= ~(USB_CTRL0_USB2_FIXED | USB_CTRL0_USB3_FIXED);
> 76fc9452a6bfb6 Xu Yang 2026-02-12   96  
> 76fc9452a6bfb6 Xu Yang 2026-02-12   97  	if (dwc_imx->disable_pwr_ctrl)
> 76fc9452a6bfb6 Xu Yang 2026-02-12   98  		value &= ~USB_CTRL0_PORTPWR_EN;
> 76fc9452a6bfb6 Xu Yang 2026-02-12   99  	else
> 76fc9452a6bfb6 Xu Yang 2026-02-12  100  		value |= USB_CTRL0_PORTPWR_EN;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  101  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  102  	writel(value, dwc_imx->glue_base + USB_CTRL0);
> 76fc9452a6bfb6 Xu Yang 2026-02-12  103  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  104  	value = readl(dwc_imx->glue_base + USB_CTRL1);
> 76fc9452a6bfb6 Xu Yang 2026-02-12  105  	if (dwc_imx->overcur_active_low)
> 76fc9452a6bfb6 Xu Yang 2026-02-12  106  		value |= USB_CTRL1_OC_POLARITY;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  107  	else
> 76fc9452a6bfb6 Xu Yang 2026-02-12  108  		value &= ~USB_CTRL1_OC_POLARITY;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  109  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  110  	if (dwc_imx->power_active_low)
> 76fc9452a6bfb6 Xu Yang 2026-02-12  111  		value |= USB_CTRL1_PWR_POLARITY;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  112  	else
> 76fc9452a6bfb6 Xu Yang 2026-02-12  113  		value &= ~USB_CTRL1_PWR_POLARITY;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  114  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  115  	writel(value, dwc_imx->glue_base + USB_CTRL1);
> 76fc9452a6bfb6 Xu Yang 2026-02-12  116  }
> 76fc9452a6bfb6 Xu Yang 2026-02-12  117  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  118  static void dwc3_imx_wakeup_enable(struct dwc3_imx *dwc_imx, pm_message_t msg)
> 76fc9452a6bfb6 Xu Yang 2026-02-12  119  {
> 76fc9452a6bfb6 Xu Yang 2026-02-12  120  	struct dwc3	*dwc = &dwc_imx->dwc;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  121  	u32		val;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  122  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  123  	val = readl(dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
> 76fc9452a6bfb6 Xu Yang 2026-02-12  124  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  125  	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST && dwc->xhci) {
> 76fc9452a6bfb6 Xu Yang 2026-02-12  126  		val |= USB_WAKEUP_EN | USB_WAKEUP_DPDM_EN;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  127  		if (PMSG_IS_AUTO(msg))
> 76fc9452a6bfb6 Xu Yang 2026-02-12  128  			val |= USB_WAKEUP_SS_CONN | USB_WAKEUP_U3_EN;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  129  	} else {
> 76fc9452a6bfb6 Xu Yang 2026-02-12  130  		val |= USB_WAKEUP_EN | USB_WAKEUP_VBUS_EN |
> 76fc9452a6bfb6 Xu Yang 2026-02-12  131  		       USB_WAKEUP_VBUS_SRC_SESS_VAL;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  132  	}
> 76fc9452a6bfb6 Xu Yang 2026-02-12  133  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  134  	writel(val, dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
> 76fc9452a6bfb6 Xu Yang 2026-02-12  135  }
> 76fc9452a6bfb6 Xu Yang 2026-02-12  136  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  137  static void dwc3_imx_wakeup_disable(struct dwc3_imx *dwc_imx)
> 76fc9452a6bfb6 Xu Yang 2026-02-12  138  {
> 76fc9452a6bfb6 Xu Yang 2026-02-12  139  	u32	val;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  140  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  141  	val = readl(dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
> 76fc9452a6bfb6 Xu Yang 2026-02-12  142  	val &= ~(USB_WAKEUP_EN | USB_WAKEUP_EN_MASK);
> 76fc9452a6bfb6 Xu Yang 2026-02-12  143  	writel(val, dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
> 76fc9452a6bfb6 Xu Yang 2026-02-12  144  }
> 76fc9452a6bfb6 Xu Yang 2026-02-12  145  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  146  static irqreturn_t dwc3_imx_interrupt(int irq, void *data)
> 76fc9452a6bfb6 Xu Yang 2026-02-12  147  {
> 76fc9452a6bfb6 Xu Yang 2026-02-12  148  	struct dwc3_imx	*dwc_imx = data;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  149  	struct dwc3	*dwc = &dwc_imx->dwc;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  150  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  151  	if (!dwc_imx->pm_suspended)
> 76fc9452a6bfb6 Xu Yang 2026-02-12  152  		return IRQ_HANDLED;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  153  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  154  	disable_irq_nosync(dwc_imx->irq);
> 76fc9452a6bfb6 Xu Yang 2026-02-12  155  	dwc_imx->wakeup_pending = true;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  156  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  157  	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST && dwc->xhci)
> 76fc9452a6bfb6 Xu Yang 2026-02-12  158  		pm_runtime_resume(&dwc->xhci->dev);
> 76fc9452a6bfb6 Xu Yang 2026-02-12  159  	else if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE)
> 76fc9452a6bfb6 Xu Yang 2026-02-12  160  		pm_runtime_get(dwc->dev);
> 76fc9452a6bfb6 Xu Yang 2026-02-12  161  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  162  	return IRQ_HANDLED;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  163  }
> 76fc9452a6bfb6 Xu Yang 2026-02-12  164  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  165  static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
> 76fc9452a6bfb6 Xu Yang 2026-02-12  166  {
> 76fc9452a6bfb6 Xu Yang 2026-02-12  167  	if (role == USB_ROLE_HOST)
> 76fc9452a6bfb6 Xu Yang 2026-02-12  168  		/*
> 76fc9452a6bfb6 Xu Yang 2026-02-12  169  		 * For xhci host, we need disable dwc core auto
> 76fc9452a6bfb6 Xu Yang 2026-02-12  170  		 * suspend, because during this auto suspend delay(5s),
> 76fc9452a6bfb6 Xu Yang 2026-02-12  171  		 * xhci host RUN_STOP is cleared and wakeup is not
> 76fc9452a6bfb6 Xu Yang 2026-02-12  172  		 * enabled, if device is inserted, xhci host can't
> 76fc9452a6bfb6 Xu Yang 2026-02-12  173  		 * response the connection.
> 76fc9452a6bfb6 Xu Yang 2026-02-12  174  		 */
> 76fc9452a6bfb6 Xu Yang 2026-02-12  175  		pm_runtime_dont_use_autosuspend(dwc->dev);
> 76fc9452a6bfb6 Xu Yang 2026-02-12  176  	else
> 76fc9452a6bfb6 Xu Yang 2026-02-12  177  		pm_runtime_use_autosuspend(dwc->dev);
> 76fc9452a6bfb6 Xu Yang 2026-02-12  178  }
> 76fc9452a6bfb6 Xu Yang 2026-02-12  179  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  180  static struct dwc3_glue_ops dwc3_imx_glue_ops = {
> 76fc9452a6bfb6 Xu Yang 2026-02-12  181  	.pre_set_role = dwc3_imx_pre_set_role,
> 76fc9452a6bfb6 Xu Yang 2026-02-12  182  };
> 76fc9452a6bfb6 Xu Yang 2026-02-12  183  
> 76fc9452a6bfb6 Xu Yang 2026-02-12 @184  static const struct property_entry dwc3_imx_properties[] = {
> 76fc9452a6bfb6 Xu Yang 2026-02-12 @185  	PROPERTY_ENTRY_BOOL("xhci-missing-cas-quirk"),
> 76fc9452a6bfb6 Xu Yang 2026-02-12  186  	PROPERTY_ENTRY_BOOL("xhci-skip-phy-init-quirk"),
> 76fc9452a6bfb6 Xu Yang 2026-02-12  187  	{},
> 76fc9452a6bfb6 Xu Yang 2026-02-12  188  };
> 76fc9452a6bfb6 Xu Yang 2026-02-12  189  
> 76fc9452a6bfb6 Xu Yang 2026-02-12 @190  static const struct software_node dwc3_imx_swnode = {
> 76fc9452a6bfb6 Xu Yang 2026-02-12 @191  	.properties = dwc3_imx_properties,
> 76fc9452a6bfb6 Xu Yang 2026-02-12  192  };
> 76fc9452a6bfb6 Xu Yang 2026-02-12  193  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  194  static int dwc3_imx_probe(struct platform_device *pdev)
> 76fc9452a6bfb6 Xu Yang 2026-02-12  195  {
> 76fc9452a6bfb6 Xu Yang 2026-02-12  196  	struct device		*dev = &pdev->dev;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  197  	struct dwc3_imx		*dwc_imx;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  198  	struct dwc3		*dwc;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  199  	struct resource		*res;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  200  	const char		*irq_name;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  201  	struct dwc3_probe_data	probe_data = {};
> 76fc9452a6bfb6 Xu Yang 2026-02-12  202  	int			ret, irq;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  203  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  204  	dwc_imx = devm_kzalloc(dev, sizeof(*dwc_imx), GFP_KERNEL);
> 76fc9452a6bfb6 Xu Yang 2026-02-12  205  	if (!dwc_imx)
> 76fc9452a6bfb6 Xu Yang 2026-02-12  206  		return -ENOMEM;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  207  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  208  	platform_set_drvdata(pdev, dwc_imx);
> 76fc9452a6bfb6 Xu Yang 2026-02-12  209  	dwc_imx->dev = dev;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  210  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  211  	dwc3_imx_get_property(dwc_imx);
> 76fc9452a6bfb6 Xu Yang 2026-02-12  212  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  213  	dwc_imx->blkctl_base = devm_platform_ioremap_resource_byname(pdev, "blkctl");
> 76fc9452a6bfb6 Xu Yang 2026-02-12  214  	if (IS_ERR(dwc_imx->blkctl_base))
> 76fc9452a6bfb6 Xu Yang 2026-02-12  215  		return PTR_ERR(dwc_imx->blkctl_base);
> 76fc9452a6bfb6 Xu Yang 2026-02-12  216  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  217  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "glue");
> 76fc9452a6bfb6 Xu Yang 2026-02-12  218  	if (!res) {
> 76fc9452a6bfb6 Xu Yang 2026-02-12  219  		dev_warn(dev, "Base address for glue layer missing\n");
> 76fc9452a6bfb6 Xu Yang 2026-02-12  220  	} else {
> 76fc9452a6bfb6 Xu Yang 2026-02-12  221  		dwc_imx->glue_base = devm_ioremap_resource(dev, res);
> 76fc9452a6bfb6 Xu Yang 2026-02-12  222  		if (IS_ERR(dwc_imx->glue_base))
> 76fc9452a6bfb6 Xu Yang 2026-02-12  223  			return PTR_ERR(dwc_imx->glue_base);
> 76fc9452a6bfb6 Xu Yang 2026-02-12  224  	}
> 76fc9452a6bfb6 Xu Yang 2026-02-12  225  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  226  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "core");
> 76fc9452a6bfb6 Xu Yang 2026-02-12  227  	if (!res)
> 76fc9452a6bfb6 Xu Yang 2026-02-12  228  		return dev_err_probe(dev, -ENODEV, "missing core memory resource\n");
> 76fc9452a6bfb6 Xu Yang 2026-02-12  229  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  230  	dwc_imx->hsio_clk = devm_clk_get_enabled(dev, "hsio");
> 76fc9452a6bfb6 Xu Yang 2026-02-12  231  	if (IS_ERR(dwc_imx->hsio_clk))
> 76fc9452a6bfb6 Xu Yang 2026-02-12  232  		return dev_err_probe(dev, PTR_ERR(dwc_imx->hsio_clk),
> 76fc9452a6bfb6 Xu Yang 2026-02-12  233  				     "Failed to get hsio clk\n");
> 76fc9452a6bfb6 Xu Yang 2026-02-12  234  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  235  	dwc_imx->suspend_clk = devm_clk_get_enabled(dev, "suspend");
> 76fc9452a6bfb6 Xu Yang 2026-02-12  236  	if (IS_ERR(dwc_imx->suspend_clk))
> 76fc9452a6bfb6 Xu Yang 2026-02-12  237  		return dev_err_probe(dev, PTR_ERR(dwc_imx->suspend_clk),
> 76fc9452a6bfb6 Xu Yang 2026-02-12  238  				     "Failed to get suspend clk\n");
> 76fc9452a6bfb6 Xu Yang 2026-02-12  239  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  240  	irq = platform_get_irq_byname(pdev, "wakeup");
> 76fc9452a6bfb6 Xu Yang 2026-02-12  241  	if (irq < 0)
> 76fc9452a6bfb6 Xu Yang 2026-02-12  242  		return irq;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  243  	dwc_imx->irq = irq;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  244  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  245  	irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", dev_name(dev));
> 76fc9452a6bfb6 Xu Yang 2026-02-12  246  	if (!irq_name)
> 76fc9452a6bfb6 Xu Yang 2026-02-12  247  		return dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
> 76fc9452a6bfb6 Xu Yang 2026-02-12  248  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  249  	ret = devm_request_threaded_irq(dev, irq, NULL, dwc3_imx_interrupt,
> 76fc9452a6bfb6 Xu Yang 2026-02-12  250  					IRQF_ONESHOT | IRQF_NO_AUTOEN,
> 76fc9452a6bfb6 Xu Yang 2026-02-12  251  					irq_name, dwc_imx);
> 76fc9452a6bfb6 Xu Yang 2026-02-12  252  	if (ret)
> 76fc9452a6bfb6 Xu Yang 2026-02-12  253  		return dev_err_probe(dev, ret, "failed to request IRQ #%d\n", irq);
> 76fc9452a6bfb6 Xu Yang 2026-02-12  254  
> 76fc9452a6bfb6 Xu Yang 2026-02-12 @255  	ret = device_add_software_node(dev, &dwc3_imx_swnode);
> 76fc9452a6bfb6 Xu Yang 2026-02-12  256  	if (ret)
> 76fc9452a6bfb6 Xu Yang 2026-02-12  257  		return dev_err_probe(dev, ret, "failed to add software node\n");
> 76fc9452a6bfb6 Xu Yang 2026-02-12  258  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  259  	dwc3_imx_configure_glue(dwc_imx);
> 76fc9452a6bfb6 Xu Yang 2026-02-12  260  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  261  	dwc = &dwc_imx->dwc;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  262  	dwc->dev = dev;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  263  	dwc->glue_ops = &dwc3_imx_glue_ops;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  264  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  265  	probe_data.res = res;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  266  	probe_data.dwc = dwc;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  267  	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  268  	probe_data.properties.needs_full_reinit = true;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  269  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  270  	ret = dwc3_core_probe(&probe_data);
> 76fc9452a6bfb6 Xu Yang 2026-02-12  271  	if (ret) {
> 76fc9452a6bfb6 Xu Yang 2026-02-12 @272  		device_remove_software_node(dev);
> 76fc9452a6bfb6 Xu Yang 2026-02-12  273  		return ret;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  274  	}
> 76fc9452a6bfb6 Xu Yang 2026-02-12  275  
> 76fc9452a6bfb6 Xu Yang 2026-02-12  276  	device_set_wakeup_capable(dev, true);
> 76fc9452a6bfb6 Xu Yang 2026-02-12  277  	return 0;
> 76fc9452a6bfb6 Xu Yang 2026-02-12  278  }
> 76fc9452a6bfb6 Xu Yang 2026-02-12  279  
> 
> :::::: The code at line 74 was first introduced by commit
> :::::: 76fc9452a6bfb63a297fa0410d5368a691ed411b usb: dwc3: introduce flatten model driver of i.MX Soc
> 
> :::::: TO: Xu Yang <xu.yang_2@nxp.com>
> :::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

I appreciate Vinod applying this set
https://lore.kernel.org/linux-phy/20260327184706.1600329-4-vladimir.oltean@nxp.com/
onto the phy_7.2 branch, but it looks like the set crossed paths with
USB commit 76fc9452a6bf ("usb: dwc3: introduce flatten model driver of i.MX Soc")
which introduced yet another implicit dependency on <linux/property.h>
which was transitively provided by <linux/phy/phy.h>, and that's what is
breaking here.

I would prefer just going through the regular merge process here, i.e.
drop the phy_7.2 branch and send a v7 updated to current linux-phy/next
(i.e. v7.1-rc1), so that we have a more complete image of the build
status on various architectures before applying, and not get taken by
surprise by the kernel test robot.

Dmitry, I got some notification emails from patchwork-bot+linux-samsung-soc@kernel.org
saying that this patch was cherry picked
https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/commit/?id=2a0ffcd5456c
but I couldn't figure out on what branch. Is it a problem if I resend
the entire set?

Thanks,
Vladimir
