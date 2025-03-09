Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827221C28E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Mar 2025 04:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741492839; cv=fail; b=LMAnjuvjFzILOBgnddxQfOBnN75JCjHisZUwM6lKjtpp85F51fuiqVJ9lRO/BJKJSr8biRa84DicrF9w8efiAdZc9GEZXQah35+UNXdNiCqLdXMPrfboW11X6M/DcS2Io/eZpe9OneJrndSMk+ovb+kjX3l4Fpse50CyN4i1DDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741492839; c=relaxed/simple;
	bh=ChxqvbwyTGdfPhO+qo9xXWUmM/UEkHStdRhaDbtd6t8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b1I9Ny/eYJcOIN2bx1HJbEq3h6YIyUHXhP5ZWAIfEWaSA/kdYBvpjnGXWGZ3KKYUmMHGhSkJYPWiiadTJ3LefAVR3mcePIapE9BTaJDOfH3oX1owzA5U33SQDTHQeuzgnmCl8P4gik/JyrOLlXEVPCOaEN7mTX9Auuhv5UODVso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Rmpk6l3C; arc=fail smtp.client-ip=40.107.94.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Rmpk6l3C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AdicjOSJLO0hgYZQo/Ubqjpm1Mx2Y+zrhAgIqakOjuV9mUiQ13KgfUcVnpY3/hwvEneP9vTezmalNZh6asBINZaEWsLQzPtJPknCjslM0q4BpTW2jO3LrWrDnWKBfDvSV0mzHcHazMrVA0nUFo9MBQaUA1p9+e8DKDML0Vp1soqEG7DvqQ6H6E38LmC/9OUIexj4xkyNespWX75018WJGwjbUgF0GYmcH5vwGigYT61bySDb1xgGrnNSBrlpn4kWanJipwT5kMQeo7/F2FFo49oUtVGgi6uJkdEQQS733iG65UfRbVL7RtG86xe9qfzIDWN0wXZjWIv+a9UI0/s+IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ks6HJBTgvkRilhWQSO78pHv4tuHbSXRFp/OBOFNwrmo=;
 b=sIFUcPzwLbMebohOrEpZLCI06rScQVf1YZIZImAMmoV7yhCqFnenuq29CHX6vsFXLmpBrqF85ZWY7uqvmHNv23WrJUWPoQvFYWBmIUf2xygJTgTi4pTDex/Yqp0iH3UiODRvah+4dkHFphSjbghCzLYHYJ9coJfwYE5nKkH4rRCpFmCjUbheCVltEMTkfHKBP1djffeNdXbFrYEw7uxo6zkN+Dko0Bqpp3QOKFVH8f8vp7PBT5YdfmweDELvfcfl0t7HmoGBeZIynPzoLaDj8hJZpmNce1xwLfQPa3srpT/DNTiTLzRjUZsi+QHNWV2rS8/tJFdz4rWSoS7GPeZdkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ks6HJBTgvkRilhWQSO78pHv4tuHbSXRFp/OBOFNwrmo=;
 b=Rmpk6l3CGPZt0fCUr7hrdX/M/SmBt+pUbKMjNdZCxtiH3iWKxMWEiNHwogPQ8ldKcrQ0vFU+UN5fSgf+o5gX+t3t74cOnADeS8bTHregdSUXwKuaoivgxsXaX/ptdtbX0A1n8QjjnsxtP1Ekm1vt1K4ROejojA/HqZbirdNBqvLqH05nA4KWCZBNwvJUc4soT37sykSwLexzta55S/s59i0AoSBRDKrwF/5ZfmX33JY0HjW1QqzGzwi9ZJEJ1NnAa/qZl9oEjEHfm9thxWvD2Zecvx64sd3Oqg0mBCJWvehaZSVlL7zZjxf/dq9fPi8Ndlv/UWJElsu80l58ZSiGQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM4PR12MB6086.namprd12.prod.outlook.com (2603:10b6:8:b2::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.24; Sun, 9 Mar 2025 04:00:34 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8511.025; Sun, 9 Mar 2025
 04:00:33 +0000
From: Zi Yan <ziy@nvidia.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [akpm-mm:mm-unstable 481/507] lib/xarray.c:1251:14: error:
 redefinition of 'xas_try_split_min_order'
Date: Sat, 08 Mar 2025 23:00:31 -0500
X-Mailer: MailMate (2.0r6222)
Message-ID: <07CB0079-5D7C-4438-A9EE-03A72904CD12@nvidia.com>
In-Reply-To: <202503091121.RktXlKnp-lkp@intel.com>
References: <202503091121.RktXlKnp-lkp@intel.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN9PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:408:fc::7) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM4PR12MB6086:EE_
X-MS-Office365-Filtering-Correlation-Id: f7d9bd72-6461-43ba-8167-08dd5ebef0d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L6KJbydIgR3+D121sP/iEmK6sQVi1Ddxvb/u52d/TPt3F9hcSFp8RBhZLZ9K?=
 =?us-ascii?Q?qyFGprZDyyy37ACtFz3XI7Kcxj2J0bmzSUvWrHjhmJYYdbNl166RoKjxa6fd?=
 =?us-ascii?Q?YXHHaTmB6O4fqW74aNhOHpZXyWSMJPHudXekKNNkgh0RVz9SrGt3jajAxT5p?=
 =?us-ascii?Q?Spl7KDYpH8fl2bbifZar9uP5aw1faBspwPnTmu8UUMZDbUCHahC4VN4slbrq?=
 =?us-ascii?Q?iFpVUQ/iMZ15oxvDsDgeZxtZF9odVu/ulrg2FjUTf4NyKpZ2KaSUpqyAqNM6?=
 =?us-ascii?Q?HSPSmuAabTBDVcne9btkyj9G9uC0lVVpou+9kGvbQrXpBzt5BQDM60Rty2qo?=
 =?us-ascii?Q?1DeMdwLwOqiDpoc0yVkZNBUMi2pmVegWMsh06+NIE9eqvsv2sqtPCq28SFCT?=
 =?us-ascii?Q?Ww1SfA+P1wAD/5iu3AOGyJ/kUJSlONQ8XqRF0jPGwMrbBPMWNSbsECwQ20cG?=
 =?us-ascii?Q?SWWFZtjQBEtTb+NWko8tRLhZA1n7OlXKmWOAxdzNuS+GTnpaIMj1gpTkY30Y?=
 =?us-ascii?Q?NH0hSboziVJvJb14esBfMxJsCGhW+GUcyJrCXFA1WRtnW+iBSvx3yoZ1a1Qa?=
 =?us-ascii?Q?Q+fZNCQdRXzrreWeh0m12ccQyYWq3Xjl4Kj0A73pWyeS+CvCDFj+LCMyhDY9?=
 =?us-ascii?Q?mwB4cjYorzu3N/gspONonGSYwZ1d6BCe+3p3Otq2zXKLVrWHBxk/ZGOY+VT/?=
 =?us-ascii?Q?KJJYJxW87eBAS9pwCZOZkBF2/Zj0I/BPfdu4YsmGtQTIOF9YeA7MsFT9c1ni?=
 =?us-ascii?Q?KF1ZWaq4l86v6xwGQI+tdas2Qu+U1UVnKnalQ4zPrCE1kABsyyGJfEXZJM8Z?=
 =?us-ascii?Q?D6ALF33LENeMNNg/9g8KyWdbpkR0FKy33HeIujqYgUniUDWlo86QNZ6YPFzG?=
 =?us-ascii?Q?6oSf9e7IQ/N0pbx6fb1OoHPMI8ZvzZvnT4NA1YrFtscRpqniwow5BzUfG826?=
 =?us-ascii?Q?DbBYdD0rbrLuZlz8gDIxyV72yEVm7+ggUv+sPGT8d5v+MZ2aiXH3D9QLqADi?=
 =?us-ascii?Q?MYU16cKLGMoq1V83/Q9ZtZ3f0Yb+VjnZfZZru9fLssJ6/Oo3wn0Q+X8tYFhp?=
 =?us-ascii?Q?2jsFwKAbDUlKQXKwVPnDWzvQxc/Oi1hEg/FF250yI0RZJpAMHXfNnCZlEHsg?=
 =?us-ascii?Q?HaM/F3eAZ9x7jt6zuQd2BqWge1D5HKdQI+8eho2T1Vjkr7M7U0mclUojH0kB?=
 =?us-ascii?Q?ovvz0IjJTXSHHPJgNaJRJQ+FFFeXSjhB5RpGzFzLPH0A71vdpt4IiPTfyB+V?=
 =?us-ascii?Q?GdInE9AsAs1pB97kNLLUyVWRdRJINnnYl5UcI0nA3CgNArQQmGR6V7bgUOpC?=
 =?us-ascii?Q?L7E2+POG1e7NwpgwQvQ+cNWq7KcAjgF2I00PJWqFX6FsiLSS34qb98Hvkh+4?=
 =?us-ascii?Q?wREeq1slOrQCibe5UmnUg3ias/3g?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xm98JL9iM3ijgPiEf47Tyl2e4b+cPBFqhggMCw3GrwDIJ/76HpC0YPeYt/bU?=
 =?us-ascii?Q?gLJLwyRmkfhMOOgxBxs8gSZa+l8N4qRR3MOKPTn9Tve1Jimqi2l9/frbxVpm?=
 =?us-ascii?Q?iPZ4xOemhIKgjEvr/i0gD1sb0yXf4lT8WwahHspSLf6hYAlImRBxDE+Zgqlx?=
 =?us-ascii?Q?JR/+vGy2MKV1H/dXU+ZwNTVOmg+MTwjSfcBQpY2xMsE9MZTYxs3HRMsYCan7?=
 =?us-ascii?Q?XmA1OkiogLIBMVelxNJcnsaqaC2VkWYjGWMdBhMuH0WvNJN09Huvy0CVtfVs?=
 =?us-ascii?Q?bA1VcUgSRx+5ZU4OIE+wPgDukqeZ+Lb2qzOaAuWLFx51zAz2e7XTe0/WPdB/?=
 =?us-ascii?Q?5KhZznOvGrhWz6rSxGJw/puEklZu9vw6JEocqywAb6YHuFWDVzSMfUh7wObV?=
 =?us-ascii?Q?I3R1RhICbptPU+nVWUxQq5KY5ySW0vcubdtPwSVt5K87rMdMosIZciR1Esg1?=
 =?us-ascii?Q?ZQmu6Y3YD2jnU8s2t7aWHYSHOJiQDQwwH42Pdr8CxcNUjygxDoHby6oOgrRC?=
 =?us-ascii?Q?wIVLj5jPpLsDMhgQkMkVDn71WS/4dC8j0BBmlyq8XqyIe9QsEXHH5T1vLANp?=
 =?us-ascii?Q?QASJgmz5uuT0FvHJFu+c7061Ln9ZEvvv+wDilH7V6TcliNoGjT+y/tUVwJ0d?=
 =?us-ascii?Q?/d+pvW/8JA69e1h2K2MJkRCtuqVgLmQ/J67triImseA70OiYY1Ad3CupzkmM?=
 =?us-ascii?Q?66I57bO+QsDVmzxNwfb7qNuMCPcUgWp67lLun3dmlvLVdEYaqi5Ajw0Ti06S?=
 =?us-ascii?Q?RcZSDxol3/JXwaC0EYqNlN2oYfEFEwPjE2tt78Pzi9o5Y2HSrmALF98ohdEZ?=
 =?us-ascii?Q?GfqE/5LgZBSRwbDzM70TrErycf+hj1bO4bJTNgdPyVyqXfPK/iXhqFUWVrCr?=
 =?us-ascii?Q?fCwRgj1/kF9nRjuRFlEzaw6vi466PNsrzafVHNGiJjC9vgTTw+ANus7bPoan?=
 =?us-ascii?Q?+PmMWVJt8X5EIOII/VpFWIt0/ckD4thi07cHdLtQ/VWdPnfZ4kPweF20pDEz?=
 =?us-ascii?Q?TBSHBeBQS8DbsNDIaD6PEuhhd5JQ0ZgHZ5Y+Lu1qJQX8u99llPw7mFmPl98a?=
 =?us-ascii?Q?9UO7b47wFka9+qm/d324gpUrjJYMbaqII/zgJxWpxD9PpjxUXJZsffnXzwZI?=
 =?us-ascii?Q?7BkiuNQ/Vi5LRyfo0it66QEsEl/g0s06kKx5TMjKmxfCEnaYqjGpnKLzj3CB?=
 =?us-ascii?Q?/1hg1icR4g/zh2Wy2F1BhaTj17To0F7FGPf8tkDv+P10bxGMbjnPi4H1xEDr?=
 =?us-ascii?Q?jMu4EBF1aPDLZl7HDq0Wf+oIZcm7ED1pBjFrOUa+LPu7RWQIy4XAestmIBpj?=
 =?us-ascii?Q?DbncZU2sIRDL6TH5IVuO55z1fJ+20EvqkQyxQxYq7QgEI0vQEjgEWC2ZhYXf?=
 =?us-ascii?Q?zdq4ZC2yImFMUaQBTWmESbqjk2KYbszre6JyYaumWo+na4pMSd2LDdfTQFyN?=
 =?us-ascii?Q?S3vMtccRz2gzeA4UnhFqHlj4I4ooyQj39gU+gjurqeI29Q9oObXua9UnHO/x?=
 =?us-ascii?Q?xz9zT9su0Y3XOdlIoBKuLkQEwoHt4Ny79esxKQ233axWnExKTI+T2V9IXEkV?=
 =?us-ascii?Q?veQxAFc/8HAX+spMSkc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7d9bd72-6461-43ba-8167-08dd5ebef0d2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2025 04:00:33.5006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AwkE+8OiRQnqa/nzzJOWj6g6zqTQpkAAfcVOMgzpDLIRZIw70GUZ8dvqoQwiJvSB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6086

On 8 Mar 2025, at 22:52, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-=
unstable
> head:   2f0c87542d97822659e81f55ae5e5cc1994f3339
> commit: 835714732ae42a4b4f590316b06d06826bff2483 [481/507] mm/filemap: =
use xas_try_split() in __filemap_add_folio()
> config: i386-buildonly-randconfig-003-20250309 (https://download.01.org=
/0day-ci/archive/20250309/202503091121.RktXlKnp-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250309/202503091121.RktXlKnp-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503091121.RktXlKnp-l=
kp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> lib/xarray.c:1251:14: error: redefinition of 'xas_try_split_min_order=
'
>     1251 | unsigned int xas_try_split_min_order(unsigned int order)
>          |              ^~~~~~~~~~~~~~~~~~~~~~~
>    In file included from lib/xarray.c:13:
>    include/linux/xarray.h:1587:28: note: previous definition of 'xas_tr=
y_split_min_order' with type 'unsigned int(unsigned int)'
>     1587 | static inline unsigned int xas_try_split_min_order(unsigned =
int order)
>          |                            ^~~~~~~~~~~~~~~~~~~~~~~
>

It seems that something went wrong when the patch is applied.
xas_try_split_min_order() is not included in the CONFIG_XARRAY_MULTI guar=
d,
whereas the original patch does. Moving it back fixed the issue.
See: https://lore.kernel.org/linux-mm/20250308213400.10220-1-sj@kernel.or=
g/


>
> vim +/xas_try_split_min_order +1251 lib/xarray.c
>
>   1237	=

>   1238	/**
>   1239	 * xas_try_split_min_order() - Minimal split order xas_try_split=
() can accept
>   1240	 * @order: Current entry order.
>   1241	 *
>   1242	 * xas_try_split() can split a multi-index entry to smaller than=
 @order - 1 if
>   1243	 * no new xa_node is needed. This function provides the minimal =
order
>   1244	 * xas_try_split() supports.
>   1245	 *
>   1246	 * Return: the minimal order xas_try_split() supports
>   1247	 *
>   1248	 * Context: Any context.
>   1249	 *
>   1250	 */
>> 1251	unsigned int xas_try_split_min_order(unsigned int order)
>   1252	{
>   1253		if (order % XA_CHUNK_SHIFT =3D=3D 0)
>   1254			return order =3D=3D 0 ? 0 : order - 1;
>   1255	=

>   1256		return order - (order % XA_CHUNK_SHIFT);
>   1257	}
>   1258	EXPORT_SYMBOL_GPL(xas_try_split_min_order);
>   1259	=

>
> -- =

> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki


--
Best Regards,
Yan, Zi
