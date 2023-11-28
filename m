Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E43FED5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Nov 2023 02:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nFWWuE94"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701139248; x=1732675248;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=BHZHC0jsCqxAJL+0LmCj6dHQseRRMevc3f/Bsl6jCIw=;
  b=nFWWuE948A7ZgWwTBpcmq0go3wFNjeMycchgb73OKUz0G5zdJUe6FykJ
   Zs//vQ6HF66PXwUt6cJWEaHBlOK3B7YJpX2sEKs17XyhIehvp1tPsds0s
   sMWY51XWo0zfkoeEWkkng44og1WMaMVoQ6mrkKI+0svcUJIdtUV6SlVGp
   M2PQgL7Xobt6+BuS89+R8rbeFjEd2ZB0087Rag9GSSHIW3mje0tPc8Qs+
   b4mRvNJuyPQGmZxqAJItWcRQv5x34sYl6ID9kQRFP0WEjguocrzmHOKpb
   7GM7/YBRwrXGTnnev/PU/gFOLJ+wJ+gCZAw94dbV6D+doDszCmxbOkULu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="6035167"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; 
   d="scan'208";a="6035167"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 18:40:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="838916968"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; 
   d="scan'208";a="838916968"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Nov 2023 18:40:01 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 18:40:01 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 18:39:59 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 27 Nov 2023 18:39:59 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 27 Nov 2023 18:39:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKcI74OSR2m7+ED/m0VsykYjzzUT30C7wie/uWnsm55FQpZtsq1z462Cm5ECGoM8LSWxMgH1hIcjOUFhyapcqDs3n+18c7IFdJCHKfRiP591q6dFA/79b5tH9TRSSZ3zS+6sr0D2P5xY98Px0kjV+HBujghPIJebyLJFa6youtk7DdxRuxBfR58UNlb+igSp99gnglWTyb52wVnW0iZP/1AeOmW3hp3gO2kt1QPEHSBwku/YaIgoS3GQyKXaP/XBotyTJkgfMi6lUrLWaNmkhSQ2yfALoMbZ+wsw874YeqiFBn6O10i6mcYfXJecNtMle0v3gA+6LuhLVVRrFL8Irg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWprRq0lxIHVi5zUoYgesoaYjoNlemX/7ZAWlhl6EiM=;
 b=dPc9jRCj7+i9DoBKa1EBNj/eo6bK2oXjFke8MNPKS4dNKiCslo4xHE2tvqVTKRfIxONvptZXH99QqRlxjBtJ4Hxj3Eq0OJiLJl1ELczNy7dIXUQwiXETHTa9W6g987bXtJ/wtKzM0lnEVVGyKcTdVyw8sZDsaLXK+T7mPNGvu0lTURHq0HTngau2x62LTgM7Sjwf9cIhaXbK2wchC8g9mkOXzvEte5XyW7Bh9H6m65Zu8zI7yazaAHARV49DrdlKRrKrsXL7B3RQJ+IfK4hYeXiSAcqcmpR+5HuBoTQBTH0PsOhhikAM3Z69YTuXjskPuQzOKUOVPXjhv9dVHbYvQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH0PR11MB7544.namprd11.prod.outlook.com (2603:10b6:510:28d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 02:39:57 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 02:39:57 +0000
Date: Tue, 28 Nov 2023 10:35:22 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Florian Westphal <fw@strlen.de>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH nf-next] netfilter: nf_tables: mark newset as dead on
 transaction abort
Message-ID: <ZWVR6izAiGh5UHRl@yujie-X299>
References: <20231127100040.1944-1-fw@strlen.de>
 <202311280410.7aUI1BHd-lkp@intel.com>
 <20231128005901.GC20086@breakpoint.cc>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231128005901.GC20086@breakpoint.cc>
X-ClientProxiedBy: SG2PR04CA0165.apcprd04.prod.outlook.com (2603:1096:4::27)
 To CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|PH0PR11MB7544:EE_
X-MS-Office365-Filtering-Correlation-Id: e5a37f58-3544-493b-2fd0-08dbefbb4f3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RBg0N9HNLbYvlEBw1cVR/7IHgSWCpaZWXH/k7uJ1Gppv0rDr+OUN6iAOqvi+SwwHNk99reXvZu3eIfZ9eliJwxdj+MVSGHOFIppUtK4RMhyX3cTxkIBwgqArOe6y80RK7gJQMfj5q2yBRUZMwaoeEA/Z0bzpYTlXpqGnjLgFYRvGRp4xs3VsXDUnexz9bDLq9AgR42iEX1lE4YAwwc/zRFIf4tw9RiFX2pUsQ8ed8tGlfCOVUPfuU0RpXolTiCpz7//lp1rQu+32jgrllA7Ck6hiqvj9gZ1bYyAHNNiNKxVA4N3BSb+3dJdPJSkHBeiVsy5iSTiJImNbAgRQ+HwsC5HB9dU6o/X6/Cj8upVKCJfooZUpvOCWuh1ba8V2trc6BsJd+deTrn3FinIL8eb5IefayD1ss0U7n9Xg8H6BlbCaKt92XJletvqhMUVBXo/BLjOrsb8omNgy4uV59pY6AU/9lY19u8FCdcT7RTmEH0lI7cR9H2dozM9sDLKX9W1aH9kBPWgODAXpx3f942O3VD8nW9O/MeE2o/o2sVM3+JCfmpFvQw8Zqng8TFhsH/Cie9a/YzWwEUvHBEKzxNOYIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(39860400002)(396003)(346002)(136003)(376002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(83380400001)(38100700002)(82960400001)(8936002)(6486002)(4326008)(6506007)(6512007)(8676002)(6666004)(66556008)(66476007)(66946007)(6916009)(316002)(5660300002)(86362001)(44832011)(478600001)(966005)(2906002)(9686003)(41300700001)(4744005)(33716001)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pRhazJZj5lkqCqMlbfjXLhQESz0lXKcNU9OWQl5sYfQ4xvyoQZIxxZ1Aag7t?=
 =?us-ascii?Q?6y0v0YkTwzvbnNrgWx5UOKBiiGwOFFLKevTBeqdmaeWGcwZht7Inykm1bOGu?=
 =?us-ascii?Q?mBOWyB0GckBsJ/Th+UghXzmcU2OBsUIzXEtgPkTkUceLXZUIlYbEjT+UDL3q?=
 =?us-ascii?Q?tntfcQm9Zos0V8FWdTKjHkj9PaJ1/REiuqkZ58Ije9kaLnmzNOF+5rPHOmVl?=
 =?us-ascii?Q?i+Ch84hDZq21OUudA7eI6UDJH55l1lmsvfOsTu60PZby+DuM87QjOhQt5jsw?=
 =?us-ascii?Q?U4yCVCBMNJaggBiM9lyXJetl/NOrx6QmVwAJ6X4biywkdcTT1tC3bqSQVAZj?=
 =?us-ascii?Q?sSAO2zHbGXXNPz+kU661tC/zpSoIjFJCpXUjAytggw8f9NHiN/sMAx3LrBkR?=
 =?us-ascii?Q?+OAdbMByb7olWOHf/sSS7OJVPisXiz7uNwTPF4K9ZuEuYsi2vEG8cgmV8da5?=
 =?us-ascii?Q?injyopLoFIRLeVeJgGRsedCGrdi1vPkQcXybCk/CwhoBXLlFtO21HgYrxjUo?=
 =?us-ascii?Q?1Vv1eEwHIe2OrUozKoVLWiP8cjaqtRgaliHBxz7rOF6TQAZwc66JYYRO1BZj?=
 =?us-ascii?Q?Qz3vu8Y+6JDbUQ03VhFivYOntiu+LDhzkKN3AMUPDyutNKz6qGY5FuKv5Z1t?=
 =?us-ascii?Q?QhxhvaEETDGa9qtKAVuQc8Jf08xm5AS8boBN/ms8DVK4oCNmoqYrV9ObvXfE?=
 =?us-ascii?Q?hi4+5GWatIT20kmVihPv41WzxbV3XPLpB+fU63p8Fk/3Bn2SkVHNnLPWAvGs?=
 =?us-ascii?Q?DOQOOjC/Kw8r4jbq5j/dxRViZjw1noJtUwunS8otYPOF27UWqajKe1xfM5mb?=
 =?us-ascii?Q?KJfih4AJH+KN31VXwufuJTvaFHrFbhAk/yWLzrMDvyt6WdisoQN04tblpW5V?=
 =?us-ascii?Q?cuVwUfgR7UllN9KBaPp4wtbdlE/kV4ArimPnryqqI+QO8G0xGdPRVhGotA2B?=
 =?us-ascii?Q?f0T5Nf3+GzMBoSvmaDYY8kzP2pFUwdgKvnS/g2VtUANtiiMg5BeweomgKayn?=
 =?us-ascii?Q?gTl0T1etpow1RPon5SmXLQJPbKUETzhN5pVOzgMlRPfpw0nIEbwxif+GdZBV?=
 =?us-ascii?Q?fRRiTp4JfkjQsWKKA78dqU1072VAg2Xelns3laWlnaVRXMEvnhfpG1e4cfzZ?=
 =?us-ascii?Q?gUcI1+FlZd+NA5bfr/yjUB1HPf6ewlYcRSzObvInp8VEqusHj4h/Eoe9cVCd?=
 =?us-ascii?Q?5hFGVxlcaFvTWFtcRl/O2UggpGfTfXK0E2tBsHfd7FmKIclR3VSea0pOkBLB?=
 =?us-ascii?Q?uVWTiLvZf4+Axe+KNmuau9IqM6BspVhVHEWCh30bs4ymdt3F5WB/L99Iu8tb?=
 =?us-ascii?Q?PVk9UmMjCPHV44lH3xHilloVfp9SjAvN8w/UWHlmOr8UdcQB6NM0X9aDCL9e?=
 =?us-ascii?Q?8HHDkDwGdtp30BtbxZ2v0sU37zpm3CNyYjT3wvEeZeu9+kRl4iIffARvGhXt?=
 =?us-ascii?Q?/7BrJ7dpaR+oSmZTnH8dKNL66hbXCuBp/+EowDar/x47jw8jT1nm8jmzbReS?=
 =?us-ascii?Q?Q2Aan4esvsamxXJRmniaHYgxA3fCNjpR3UIxDZ0teHKb+ArEqehCQ9VMqrrt?=
 =?us-ascii?Q?/VRTF8o0YOCzGj8CZVotinax4Lkx87kW/v62Uwa4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a37f58-3544-493b-2fd0-08dbefbb4f3e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 02:39:57.1376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R642gIXOhZyDY8yZ59pOQ8h1XKjKBreAfS3yjJglAUL63pphodV00saIbaskZwuPUXOx6wllm3ehJ7tHEdtpSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7544
X-OriginatorOrg: intel.com

On Tue, Nov 28, 2023 at 01:59:01AM +0100, Florian Westphal wrote:
> kernel test robot <lkp@intel.com> wrote:
> > url:    https://github.com/intel-lab-lkp/linux/commits/Florian-Westphal/netfilter-nf_tables-mark-newset-as-dead-on-transaction-abort/20231127-180311
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf-next.git master
> 
> This needs to be moved to
> https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git

Thanks. We've updated this repo url for the bot.
