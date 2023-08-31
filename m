Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EF510FA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 02:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693447729; x=1724983729;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=fo2vnFlfyP+3INNdavCbIVp4SaO6j5PzQOnKTbhThD4=;
  b=Y3vgRPqLFthGKD3B1EnEtkiK/WMWDafqYJ4u2LOcUDKTvDz4JnSifzd0
   oc8hCA87/9C0mUk0UPojPV30usdv39rG3WOgeztf4lWnfaMGyFov27Sid
   6bpdzPuMeG5AtJJ3upSt0X4X+IV1EW6e7g1O4re0gGfG+fMSO1IfP+xFT
   aKEoSv2V+jkSq3778kh50XlU6MK6BHXkhC6H2+XoiQMtocpjWf6Lcnxjz
   LpOtU+J/Ap3+itkQRVIl7TQNecslAAnTmXITMyTVZUxzRCvnE2eQZbUpN
   kbYSnVMLtoopD9WB8zv4NjkQwm3gTqdG0TxLtOecqEjHzy11RbFKNaqBV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="374707111"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="374707111"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 19:08:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="804753997"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="804753997"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga008.fm.intel.com with ESMTP; 30 Aug 2023 19:08:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 19:08:47 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 30 Aug 2023 19:08:47 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 30 Aug 2023 19:08:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fQ/QTQNxQBaxCxGk/90gmv1WjwZoH0wClGPbOqp6kskzRCfzlsjRPrGB9jj1Bu/dYqtnGOWSCmy9RG7Krdmgy49C69+3+Zyn+aj29Rl2vfEyweFvwl9OO3ca1fdU0saIC5Aw4I/jAj1N9D39w97Wb32XE5QuAH8EB4XLEzQWTI/XYedATwvCcSsqQfl+qogywAjGMaspzUaRNNiF7LgP6vvC765lpD0u7Yg9wljcwIjMedXIuSrcCyRR+esxdfv9K3Au09OmVKhpLffitknpOfOvBx/UC8jc28GW+7P+9RiuXz1cEOscaHafpJfnt5mo3/y5ykQ7SeAkTjHbrHtNuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SeXp7dcaBtncfJAiQqRnHUtC317eOX4afoM01WamQ5Q=;
 b=CBA9QUq5+NgmISIEDGCOBH2VhTHrpP+0Qq8uceHZ4CEHBnGnUZRPXosBL27L1VDAmsdQFHPe2WPIhZfN1bBTMAP+Y2AasrKRE8dbvSIh6C+f4Rmma9fqYCpyAE1drtBlUM26lx4E02EEFS3repkPlRxn0tO3rdTzTumgpJWxZW0ZBfvSQ1pby8yHJjUYEKGwilRMNRHQGKz4xD+E5/lPG3pDBkYJSKh+e4T9EgS4s+QifA4N6F3fcCrsr6GiNjHv8hWvcU3yRHINAMkY2I7bGwHhTrhOM/j+WObmxJDvLlVFrEa9LlfxmNgj60Kn0UMJE8HmvEi9/vViHMDt4U/Beg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by SN7PR11MB7667.namprd11.prod.outlook.com (2603:10b6:806:32a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 02:08:45 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::3130:de4a:9f73:a5b6]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::3130:de4a:9f73:a5b6%6]) with mapi id 15.20.6745.020; Thu, 31 Aug 2023
 02:08:45 +0000
Date: Thu, 31 Aug 2023 10:08:35 +0800
From: Philip Li <philip.li@intel.com>
To: kernel test robot <lkp@intel.com>
CC: Arnd Bergmann <arnd@arndb.de>, <oe-kbuild-all@lists.linux.dev>, "Linux
 Memory Management List" <linux-mm@kvack.org>, Masahiro Yamada
	<masahiroy@kernel.org>
Subject: Re: [linux-next:master 10401/13390]
 include/linux/fortify-string.h:65:29: warning: '__builtin_strcpy' source
 argument is the same as destination
Message-ID: <ZO/2I1SHFlEQR64P@rli9-mobl>
References: <202308301542.li3KHkJl-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202308301542.li3KHkJl-lkp@intel.com>
X-ClientProxiedBy: SG2PR04CA0165.apcprd04.prod.outlook.com (2603:1096:4::27)
 To BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2995:EE_|SN7PR11MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d584bfb-9ce6-4559-95a1-08dba9c73481
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dpg8maudQ7HDjQmVScZ+KFTQfkhnzYD3cm1/u9a0F0GkHPOBxdOZ5150cK++wqIJmcnNmTFFrenFieNnxSifkCp4/LjbzVY3aEq2Pjjiuf8MuOq1tu67hz6wEbG8nvWzsaAm3o4AeSeQcyt+QAPKJTSSyLw6/DI3XJgqNmY9h1y/ehtX3uvdhfIfbdMDn2YwCqLg5v/j6VbGfIMP1BWrF36PGMH+CpHq4DjbjXqNJmCzKP69EkQ1gYEvE7C7WWygbAoAzM5LvMZTQ2ElpsubN08c7JIIxYnoxN0PzwP0121weVF8A17OQx/DwLFfhTVPoqe7kTVN7aRTGu6cSKTJwViPesyt/JfaF8+N/u6G8iGD5bmXaxmrXhhSgrCdpHRGyg84xzoTdUhDBoHHBt1i3bL5kgZswXG48KJInEbyF5hW8TuPsd94fNmApErCYEHHBkumaTUtJOr06yzWkfdL2opY6EVchG7vYBH31x0anmeGn6R+s458dTZx5m8U0fXCzhFOr/LRDA8w/ruYMnFqRbbqVjTtMuQQ/IuTJJWtssDepGEdRF6Bt4L5b0ukYEt4ViqCXutk4slEFN2fdjttRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199024)(1800799009)(186009)(6486002)(6506007)(6666004)(6512007)(9686003)(966005)(478600001)(83380400001)(4001150100001)(26005)(2906002)(33716001)(44832011)(54906003)(66476007)(66556008)(316002)(41300700001)(6636002)(5660300002)(8936002)(4326008)(6862004)(8676002)(82960400001)(86362001)(38100700002)(66946007)(66899024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DhBGNO8zwaGIzECfe2KN/h9cO9F0iV05XYxSGZEZ/RSVbMSQ0ptcLz++iBDo?=
 =?us-ascii?Q?FHdIFss68EACKB5kIfEYds5D6LcAbUWyDTaUveznHQb66QWmvYx1WY2hH2ww?=
 =?us-ascii?Q?SP7ecWdBH/NN7qSWPdfDpaqdqCVbO6gfpdA2SmxzLqTG4tgUioXl7/rZ83k6?=
 =?us-ascii?Q?Q4kUD84rxv8I5DqNiVQsKP397zsRV3Px/pehSIVT5rhI3+d/NviI4x3lXhRL?=
 =?us-ascii?Q?pHDs+HKyTG/tjee7dp413cP2kr3BhKwh10wPgKCYQeFhxO9YuYJH9aiyE8Oj?=
 =?us-ascii?Q?wy4obZc+Aa2K9rsujNPsMvZ/7Dtait9pQ1WIe6hBp/6J5OyrA7RVq5mbsXj/?=
 =?us-ascii?Q?jRRKBjPsOvOygNOmpT+nBKw/TmzWXDQ/QW+UxZSvakbl3MPTM0PPS/OevRZm?=
 =?us-ascii?Q?S8K8z9K0IOnH4L8N4HH6RSAx/qg3Tgrvapgk+9TwH1XlIZEH8CvEzulJamPp?=
 =?us-ascii?Q?F/ySJt7PGavLoNgRDZRYBVnodzAc2wsIrwjaMyw8QXXoudAQkIBlfXAOHsHZ?=
 =?us-ascii?Q?DYNZLBfglZfZOtHqjDS9vpCOjKsX8jcuGgpPR8n7tvEQJjVvkn6GpkdTbTot?=
 =?us-ascii?Q?ES4K9njcKZXwKWc7xGI48zdN/yls1MyLTVJ9wLATMbf3Vjvb0DD8OW9UqME9?=
 =?us-ascii?Q?kDLjaHZI1KAAk6zP8qm71ofrrE0Qu/TC9cb37koq6UxqIvLj1Z/MiIp/aGDN?=
 =?us-ascii?Q?Fojrj60vb1dNytLOAdHBqWxMfaIyI11wkJdFh6cGAI761lI3ni1XXeOQf4D2?=
 =?us-ascii?Q?tJbUwgnCNHf8iZnH9mQLngolhnrqtaUikXZerBl+jGC1SlRyvUO/EqKKSaG4?=
 =?us-ascii?Q?JtDAWyN+YnRqSky2FszCMiJgkn195td1+nuk3Wxw2s5ZmB8tIPGjKogmEkID?=
 =?us-ascii?Q?sXTz98r+NIn9/AAXazAeafvHz7ASbCMOKrBfo1coem1+6C+q6R2YRDBAuAra?=
 =?us-ascii?Q?EKNrNv5Qy2VwI4LObdMe6NIfyI/ZWT68mh1blf6+T5QvxOSbPxv5C/bvYiZd?=
 =?us-ascii?Q?sXEv4lfjMv7Wj1NjfFaITD6anCQLG1oIh97YrLhEjIf6W/jqo9uu+eUmwOva?=
 =?us-ascii?Q?p2FHltd7nrAETiG1rb1gLMUKR0HmeeklI1ls3wJgHSNMuuRkhnAh1ymw8y14?=
 =?us-ascii?Q?wDMOd9NSB7bLvmwfv6b9z4kwaLxFaBP3HAGJqpeHYyd2AzCuOjquXDSOqkoL?=
 =?us-ascii?Q?pXOzRzYt1bL8PtgplSMUdW49fMSUfPAelnleV5OwLLDmtd0ZrRZpWlf/yHue?=
 =?us-ascii?Q?/WBgpBQDzglWySlfM64wgw89MlhL9T7M3t7z9UX0b2CrwFphCUtKEKmL4FEE?=
 =?us-ascii?Q?AGTtOQ42WDIoLb4vr52EOwJlU27fW+1NX6m3Y3uMw8NSTuhTnaHg6jVr8nnU?=
 =?us-ascii?Q?uDdRjJ72TLpHhOSBDZGLu3HU6e42SNVoJj9acQRoUNWxJ9Vxjwz8a4KpLsJd?=
 =?us-ascii?Q?W4ERU+qwhpKrC3jU0xGflXyWVydW3a6gwvgTfy9YfUc42DZbwBZGEFY69YHN?=
 =?us-ascii?Q?cKuVUmLNkymBXt+/8zA+pOCQVNrNbHF4d68VT1IcD5Auw8uih/p4n9W4kJS1?=
 =?us-ascii?Q?RXwN+r36LcBn1SrjO8Y3QNuHT/bQAXCDrYoe++bg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d584bfb-9ce6-4559-95a1-08dba9c73481
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 02:08:45.1069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p0ke7pT/r2ztppx+8fIBEER42M0IgBaCxVkeP83R5V9coaUFw2m0KCHYqjD2ajISTDC98KCZYMyxtBbRIrKWAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7667
X-OriginatorOrg: intel.com

On Wed, Aug 30, 2023 at 03:18:34PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   56585460cc2ec44fc5d66924f0a116f57080f0dc
> commit: 26030cb984dd65e0cb2d0c2489d94941cf8897b4 [10401/13390] extrawarn: move -Wrestrict into W=1 warnings
> config: um-randconfig-r034-20230830 (https://download.01.org/0day-ci/archive/20230830/202308301542.li3KHkJl-lkp@intel.com/config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308301542.li3KHkJl-lkp@intel.com/reproduce)

Sorry for the wrong report, kindly ignore this

> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308301542.li3KHkJl-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from include/linux/string.h:254,
>                     from include/linux/bitmap.h:11,
>                     from include/linux/cpumask.h:12,
>                     from include/linux/mm_types_task.h:14,
>                     from include/linux/mm_types.h:5,
>                     from include/linux/buildid.h:5,
>                     from include/linux/kallsyms.h:10,
>                     from kernel/kallsyms.c:15:
>    kernel/kallsyms.c: In function '__sprint_symbol.isra.0':
> >> include/linux/fortify-string.h:65:29: warning: '__builtin_strcpy' source argument is the same as destination [-Wrestrict]
>       65 | #define __underlying_strcpy __builtin_strcpy
>          |                             ^
>    include/linux/fortify-string.h:794:10: note: in expansion of macro '__underlying_strcpy'
>      794 |   return __underlying_strcpy(p, q);
>          |          ^~~~~~~~~~~~~~~~~~~
> 
> 
> vim +/__builtin_strcpy +65 include/linux/fortify-string.h
> 
> 78a498c3a227f2 Alexander Potapenko 2022-10-24  61  
> 78a498c3a227f2 Alexander Potapenko 2022-10-24  62  #define __underlying_memchr	__builtin_memchr
> 78a498c3a227f2 Alexander Potapenko 2022-10-24  63  #define __underlying_memcmp	__builtin_memcmp
> a28a6e860c6cf2 Francis Laniel      2021-02-25  64  #define __underlying_strcat	__builtin_strcat
> a28a6e860c6cf2 Francis Laniel      2021-02-25 @65  #define __underlying_strcpy	__builtin_strcpy
> a28a6e860c6cf2 Francis Laniel      2021-02-25  66  #define __underlying_strlen	__builtin_strlen
> a28a6e860c6cf2 Francis Laniel      2021-02-25  67  #define __underlying_strncat	__builtin_strncat
> a28a6e860c6cf2 Francis Laniel      2021-02-25  68  #define __underlying_strncpy	__builtin_strncpy
> a28a6e860c6cf2 Francis Laniel      2021-02-25  69  #endif
> a28a6e860c6cf2 Francis Laniel      2021-02-25  70  
> 
> :::::: The code at line 65 was first introduced by commit
> :::::: a28a6e860c6cf231cf3c5171c75c342adcd00406 string.h: move fortified functions definitions in a dedicated header.
> 
> :::::: TO: Francis Laniel <laniel_francis@privacyrequired.com>
> :::::: CC: Linus Torvalds <torvalds@linux-foundation.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
