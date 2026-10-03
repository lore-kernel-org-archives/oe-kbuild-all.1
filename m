Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E7036C9C5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Oct 2026 14:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791038137; cv=fail; b=rNq6rlrE7TZo/e4jbqwf/k99NggJFcbZYDJLny1+L9p4XnWF6NnfZvpGhaR+J/zRnbrOMzrn8/k5LZrg9bnOS6GxAalHcyTUU65MVCsCcpxnn2No8BZFz4IOfhkDzlmsNHvq3nzf5LiZjoUvbJLvBfpxwWgKYiZzRdBiDHl28Rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791038137; c=relaxed/simple;
	bh=MioX0wdctXjqtixl8XNyy0gMNqoN2bdEeDg8j7twlIY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=tlVektZNA0HqjPs6NsjKhjjP6Prrh68L40ZGV5+PR5pEAeP6+1HdtuCv5ZDk/qDKWAzKor5q0z7wWVqimv8/Eb0URNtHfT6Fvy/laFnwDutup/IrL0bDIbvOGOH3ySk7hsrOmo0JxYC2CLmFDC/FYoWJtooneMDs4pVUx7q02Ok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IsXyhm6f; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IsXyhm6f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791038134; x=1822574134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MioX0wdctXjqtixl8XNyy0gMNqoN2bdEeDg8j7twlIY=;
  b=IsXyhm6fGF9l/1n0u8uakVTT8tc6SNvOtgNMgoGG1u72XsUfI4mNBg1h
   TnPp49wEggVoZOafJmuwglvaytFROotTz4Qg+PIz5FXRIOfeq0cRkZQPH
   TRUf4L6kYSXe1OM9dp7iU1AOaP07qFx/FYVi1ewLjv8CtIhpH7kqumUaU
   JOjGIXz6x7oaxOzSQPRyWBLHTxXeof+4Qr2Lvki3qb6KVjkFth6I8nVG4
   1OoREdAn3qgnu9Ojx3/z7Va6hi7Xl/hralAQgobi/MlIVj8K9zsYQfQhD
   iiUCcLEdbiLLJoyDaPMzsS5jM1kWcdd+iKjvhJpWov1BH2fRRPM6f1h9h
   w==;
X-CSE-ConnectionGUID: U2FF0QAQS6u3fLn//qx32Q==
X-CSE-MsgGUID: Qeo890pfSuKTp8cQ2KI64g==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="109264658"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="109264658"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:35:34 -0700
X-CSE-ConnectionGUID: 4JatgQdfSi6dDxLfj+sblw==
X-CSE-MsgGUID: Fe+rSfYRRdGlY4j87p5yag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="279707676"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:35:33 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:35:33 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sat, 3 Oct 2026 07:35:33 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.16) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:35:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vnXzg3NrK8hZmdAQWwOAip5cL6ItjVOcly+koLnNhggtMeSlXwEhTuqRYZFjDrD3qVcR2jIYl67rnJmqciy3nVA+2OmdQl6VxKGvAD2ffNrNsPKU8nOFPwcLDH8nDZ4ZGf/Eo3WOeNe6uP/qDG/pQCgeDeJDrIPfF23rkXgmWZ+Qa9AdsglGPO1Guiqu7zkCW8HF/Mm5Camyy0Uyl0riO712FxtdNjukldGlQ+dEXFATkELlZJQJzkmPfdNc5R33vQfwQojOENmKVFDpoI6++8bOvZf1ZS5zRx0vsLIrKmd7li6CdDI+RwjO4t6tCrCcRJ25AJ5b+fBg6kHgF9R+Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUtAjjUP2DDf1S2Ufpg3AgUYeLxz3R9VK7TL8gnvwr0=;
 b=rpxbUmVITUqv1/cNaOTqOlFtnXx6aFdBEF59O+oCRWdfOMESHHueKADqxtZXgANvE8xus4WDu6Mp36paj7/TWCXbnMoX9LkS+VHQhdXI2jUf5kS9YapN/etWFS2fnJUF+fFCi2ILcIjI9tQ7MDKz6sPBWRQFl1f4lsb4qJ6UYEWrBl3LVsUnbVTwXm3eBxHJGDDUTQthqc6hhByijxw9vAReHFVnky2C6XKBvaWPZHM4wCQibqcoHg1PuxBW1gtIH4UQIMWcrZJel6oGS+JP/jzfmTZXvfDm2v1OjflDTM3Kb/TGzyu0gN76YVBXA+T9zgx22AaKW8+W5uA7EkUibA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by MN0PR11MB6057.namprd11.prod.outlook.com (2603:10b6:208:375::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Sat, 3 Oct
 2026 14:35:30 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 14:35:29 +0000
Date: Sat, 3 Oct 2026 22:35:20 +0800
From: kernel test robot <lkp@intel.com>
To: "T.J. Mercier" <tjmercier@google.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: kernel/bpf/hashtab.c:812:3: warning: 'memcpy' forming offset [5, 8]
 is out of the bounds [0, 4] of object 'k' with type 'long unsigned int'
Message-ID: <asESqNIrMQXm4AC9@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TYCPR01CA0198.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::19) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|MN0PR11MB6057:EE_
X-MS-Office365-Filtering-Correlation-Id: ae599290-3a01-4c88-fb90-08df215b92b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|11063799006|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: cuV8lVjgu3RRUtLbxtU/uGlN0VZcqSKlKBTQ+TWZoBtRnH4kImACskkAImn6p5cXMUdStw87XoP6/pRgw+WzLBMRhr3kufW2fN9kdoqKWFsmKmSUebCnUHYcSAvuoy57Iq0QhO9wpokPAjOOPwa8pgP6c7tWwFvXOY92My85NyJ/L735PSzgegLy9t1TcvNbWNaLkDA/NB+WgwRL0eNXJQSH60xJx2Y+aNHjO91rHokOS7BT6C/jIB7V2EwNJEuKwqcki+kzf3Bjynxynf3N1nwIoVV5lS2hGEfphVIqFeOKuQyJxokTBNvL/Of1xjJ8FUcU0tqvlHcJGWGExsJ3ykjgJk08uRVgd2ZtFQYPqzydsSJzqjrv84VsB/3QeSjh78Nb7v9c/8BBodDJ4+KHQwfEEaVwUwunaSDHVb4lyZZAlhB5i1ZNoZxMuZRWj4vk3WW5rL0h9rtULaHPxRSSozjdXumZ/ntVFQYvwcTPIsk+R+Qo1PVvwJXHRf0ENgQ569y/a3Nu8HjX3Y1ajH0JJxzMKPHyxdYuf35UxbNOfYclsw2hNVxNVt53KDWwdkb0jsaE7AmA4cA1Q8CsDuoD+i/BOLbJsMbJS1Ruxatgx6APjLBviPwgu9/9rrKgIbL8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mnLtutf+EoWtCklPkh4ESy5a9f9GDMQDVa/qqSrJSxOZIi7jbCuvJd/qskfR?=
 =?us-ascii?Q?DoS0i51KK471xKSy3coz+bEUwJ9C6qlWXBxDbm8qjHvsjh9ePsM6GgKYnTP6?=
 =?us-ascii?Q?k+hmLQPadk8PYVk5Cte5kqiXcCIcrwAwgKjQpJm/BMgxGNofmiVlqyoR0t1v?=
 =?us-ascii?Q?7JeUwrRZKkHi+ZrurGu6de7O68Pw4dUbUpIJhUyhsby286tZbiWnx5wEsQGR?=
 =?us-ascii?Q?MGCstxCkTxB+6sx/Hwam0eMTMFOGjDMJG7wKOc+3JHaw1MC260f4O0Gd3OKB?=
 =?us-ascii?Q?VEwkn/KfOJ2eApcm4KEHIcXXuQe4J6xVn2Jz8X9uP8GIplcl1qS1TLoUQ5w1?=
 =?us-ascii?Q?GqE55YV5BKl9zuYo4ta2WSYCYQLS5PQRIlHoeHiyYjlhFhXdgbMocKYTFWhy?=
 =?us-ascii?Q?DCJCPJgUT4siVbmBYPldlYEoUTFbbHblPYfY43f0aK/cP1mOFhuEaqnH9JyV?=
 =?us-ascii?Q?CjZFydD1UWiwqVESzWCvpOJcitEEV+eFmKLW3s7rLnR3lUsxe8GyCTMDAgmG?=
 =?us-ascii?Q?g05Hxh1gwsblkJqptR8FnM+WC7SGgO62OkvXkidJ28T3m4C7Tf7oFa/3a/u0?=
 =?us-ascii?Q?bJwMpHgNqcvHUGvizX83En0mU7Lr6HwqQKhUF6kVSLcJ41cZh1sS/0NlGbUG?=
 =?us-ascii?Q?+e/8FUniHFsXjAj6Qt/8V3u7Qf7ZZeh4nokghjwyu5uqWBrDNCtvkhTAT1OR?=
 =?us-ascii?Q?vwRNJxyaxmniRqR/h0kMCnohyJ7CMPKu9HOBkHuWGOFUUZIWSp4pps54zqLO?=
 =?us-ascii?Q?XHd4E831N7XnhwcubfkXzKcexgr0//AWX9i8vERC52cYEuFW3d+4AVan43tc?=
 =?us-ascii?Q?X4L8y0hZ+EhsDxvyM21OTpHZlurJ+wie5ev3iun7z7mXEkS1J7uxGFDi+lC0?=
 =?us-ascii?Q?/tKPrrbzg3/E1w1H/lFU3twoDopUHVPmzu89kmjf46/fW62CqH0AXzxvK4IX?=
 =?us-ascii?Q?ruOtlPBi5vAZ0VnnycgIgjjU/IoXOx/UuvCqzkLamCx0ufNM7LmTcu+oz9hA?=
 =?us-ascii?Q?A0cQpLd23LBmtrUF8hn4zZBxdVDSKckLm+bhK7D/3CKwkkrG9WnhjRWCyjHF?=
 =?us-ascii?Q?l1qS9cqO1V9ZD2RDwYKZpHj5j86FsPbstV6/bG4EPvSzq+9TJl2x4dc+I1yF?=
 =?us-ascii?Q?xX/awv8prVjFrzgWi4+ca2pvoRM5i1wBrN+4GjGR0QJclAoVzWaKNP22t5E3?=
 =?us-ascii?Q?Wkc8BmHOWgj9k+cArHbsWsDC1fI+sWbctYF2s59IKk1Obu9zie6ji0KWDpKB?=
 =?us-ascii?Q?nYoa+0NnYmNNUtnHBmRpakmFS7nYWI3OgoD1nFlkgGEGajFQsjzf7qR7ERgv?=
 =?us-ascii?Q?/PJbVSnqPg/LVK14zOtoFPX4+Otxz99AqTjhoYMHxp7KIkktQ9JTD8JrvSPv?=
 =?us-ascii?Q?3cMvfJb1YKCYfY7QD5yFQLuSCpvF93jstxpIi9aakYHSwtz4x9CCUJbBJYAk?=
 =?us-ascii?Q?+ntRs3Sy2dJN7bwKdspwqz/D3FX1CdTiSWoqAhPxl7ubPD6/GBfJWQrD7Wr7?=
 =?us-ascii?Q?pdhIaR7/aK0IH2YEuneBYLaGukb72+bPk+gG2y81XplEGtKmg4v75MaSMNSj?=
 =?us-ascii?Q?LI+IBNPVF6j04nYLqvjn+IhqPUgzGRYS4xVAgSpFEHLc7/pK47RIcWqeuZlm?=
 =?us-ascii?Q?LkyaHYhtaEN7FYkoAt5gYahRdm1AeZXEY05C3A5uHFlDxQEsnHj/z50IocVu?=
 =?us-ascii?Q?nuC78gldm/oWuhJMY2r9KnTgZ5i2n8XzDdU3vXHntRyf7aAJspplRn9sbCwo?=
 =?us-ascii?Q?8oQRFZv8PQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: Zz7IHRFxYAgJF4invhE0w9FltgmXnvoI8hfZ+LNvDqz5VF9UyjYnYirfHwDDI6cV3kXnTFYIuHFvEn1FncuZQY0IJs8D4lz+nLP5wu7/kYGHS/+Do+CODNcyNV/GVDWu248htuA+SRqktPsvQtbAZrLP0sVF3D2mC7NnLIV/TGkgG1htyrLiki0B4rA0Kp+eEY1qz01WwpBmsYK4FmMysXXjblbTbktQymAvGI5fI1pKEabIN+JXAmgB0sdxaS1kjNIzd4cM+bNlkXEovCtVB0xhteMrV/eNeaXr7jvu73zavkuG3c5Xa258M4zOAXVSn5humozRRs2if2eO9oLjTA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ae599290-3a01-4c88-fb90-08df215b92b1
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 14:35:29.8216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cCSaDsA48JPo3SgJDwrdD9fZYsJWqC9a8Mb/UBWYrXwBhb5UUoeqZsJAIDDFC3zekeJZIbvGyP8UKTdxZqBprg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6057
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/T-J-Mercier/bpf-htab-Split-htab_elem_lru-and-htab_elem_pcpu-off-of-htab_elem/20261002-091734
head:   ff6cf05dbbb8d27bf0e53e860d6320dd75ab8f78
commit: ff6cf05dbbb8d27bf0e53e860d6320dd75ab8f78 bpf: htab: Reduce elem_size by 8 bytes for small key sizes
config: arm-randconfig-1003-20261003 (https://download.01.org/0day-ci/archive/20261003/202610031355.lDxHBnxP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610031355.lDxHBnxP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610031355.lDxHBnxP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In function '__lookup_elem_raw',
       inlined from 'lookup_nulls_elem_raw' at kernel/bpf/hashtab.c:843:6,
       inlined from '__htab_lookup' at kernel/bpf/hashtab.c:866:6,
       inlined from '__htab_map_lookup_elem_u64' at kernel/bpf/hashtab.c:890:9:
>> kernel/bpf/hashtab.c:812:3: warning: 'memcpy' forming offset [5, 8] is out of the bounds [0, 4] of object 'k' with type 'long unsigned int' [-Warray-bounds]
      memcpy(&k, key, key_size);
      ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/hashtab.c: In function '__htab_map_lookup_elem_u64':
   kernel/bpf/hashtab.c:810:17: note: 'k' declared here
      unsigned long k = 0;
                    ^


vim +812 kernel/bpf/hashtab.c

688ecfe6022051 tom.leiming@gmail.com 2015-12-29  791  
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  792  static __always_inline struct htab_elem *
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  793  __lookup_elem_raw(struct bpf_htab *htab, struct hlist_nulls_head *head,
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  794  		  u32 hash, void *key, u32 key_size,
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  795  		  struct hlist_nulls_node **out_n)
0f8e4bd8a1fc8c Alexei Starovoitov    2014-11-13  796  {
4fe8435909fddc Alexei Starovoitov    2017-03-07  797  	struct hlist_nulls_node *n;
0f8e4bd8a1fc8c Alexei Starovoitov    2014-11-13  798  	struct htab_elem *l;
0f8e4bd8a1fc8c Alexei Starovoitov    2014-11-13  799  
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  800  	if (htab_has_hash(htab)) {
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  801  		hlist_nulls_for_each_entry_rcu(l, n, head, hash_node)
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  802  			if (htab_elem_hash(l) == hash &&
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  803  			    !memcmp(&l->key, key, key_size))
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  804  				return l;
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  805  	} else {
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  806  		/*
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  807  		 * When hash is omitted, key comparisons must be atomic. Zero extend
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  808  		 * the caller's key to the word size to support an atomic compare.
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  809  		 */
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  810  		unsigned long k = 0;
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  811  
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02 @812  		memcpy(&k, key, key_size);
4fe8435909fddc Alexei Starovoitov    2017-03-07  813  		hlist_nulls_for_each_entry_rcu(l, n, head, hash_node)
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  814  			if (READ_ONCE(*(unsigned long *)l->key) == k)
0f8e4bd8a1fc8c Alexei Starovoitov    2014-11-13  815  				return l;
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  816  	}
0f8e4bd8a1fc8c Alexei Starovoitov    2014-11-13  817  
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  818  	if (out_n)
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  819  		*out_n = n;
0f8e4bd8a1fc8c Alexei Starovoitov    2014-11-13  820  	return NULL;
0f8e4bd8a1fc8c Alexei Starovoitov    2014-11-13  821  }
0f8e4bd8a1fc8c Alexei Starovoitov    2014-11-13  822  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

