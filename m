Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11021118.outbound.protection.outlook.com [40.93.194.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75538279DB6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 19:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771961579; cv=fail; b=g5TkAxGgp1bn3oai4K85gSimy3iTzOG+EAiUuZoRYOTs27l2lEn+e6vIz008UlfQ2Tprp8I9Il05jFOGcUpvtDu6eOylHbJ72iVaKQF6QtX9Bl+2HSzNue825Cdvo/nbRxDUDVrgxswgH9fT0TYuW/hU7uEtRGAgPgtzZFajl3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771961579; c=relaxed/simple;
	bh=JWIQxr4LTXPbDyl8oj6Kriv/WAiOGJxiNFFkVdQ5G/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CzMtbO/c0d+3Z1UeGSb00wK+pUUxJvZaYazlGD+LvNBBYJYU83IHtAz09fheEok+OlC4A/ejZ5DzPjWShAJ8wle5wylIYOTcjSKH3obWvb471yMsdt3a/J9y5y0VGN74QxWwibMB7ydyr4hqrY6tEMKAnHY2nExgSuLJ6jNox2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hammerspace.com; spf=pass smtp.mailfrom=hammerspace.com; dkim=pass (1024-bit key) header.d=hammerspace.com header.i=@hammerspace.com header.b=RGEJ4Ppn; arc=fail smtp.client-ip=40.93.194.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hammerspace.com header.i=@hammerspace.com header.b="RGEJ4Ppn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YCA0W+rfvV/km1TgYVFKBKfjZIkk3Zqt8/aTwXL1C5zayX9xlsuRtcn8X/lFSDFoLhv3kKXWb/9u/BPayTLmvXBcOcOJP0QZAg9y1YIz3jkUot40yaeH1Hv7+mgwMF91/XyxWMDSuwqpyH2LuqpF2L6rQBnKwxTGsBcy8yySDE0fXBwGkdQd+LeARTAfUdTgQwXTSBuBN6mcKXa2Xae+MilVVt8tl/e4AUqrdKlfAMFC21Tg/giH8Z5mx0AkRQchu+Qce3nblCaF/+do4JQBuLPhOYEOrvzJXlQ3NVVhXH3C6pj8XFH8uADNQ5gQ9zpqdeh8QOxezqAh1iiYegg5cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6o7u5pKCX48O3tAIRMjbwPy2UIm2hH2hTc+/fRSN+HY=;
 b=x34V7IkRTgq764/+JmQKkQUvlooRAM+1wq6r8CzDUXYZ5J8/1ZO69S3KBea7C1MHV5CW+6Obv9m5N33s8DM0PCLITp+yZk2TE/kMHrBayx29vPxHoeNXTn3PLQO0tHCj1N3wb1cP4yzzeixpD5BcWdmxVt3UtpeaVlTFmRH6e6zj7SJRxU5XLRvOphgx7ioF5K4qN3KTsVw2kZDRQB8k/VUq0FeeVNP6LkpI/zF37+MceELWMjS2PY8VlpOAqN1WwrXSxdiDTCaMwXS5EVn1p//c7ypVJ9yD1wRfOqqy+bJ7xoM1hnHenZSHpanuMgrSHjOGxiCabwSgoec0zvAmkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hammerspace.com; dmarc=pass action=none
 header.from=hammerspace.com; dkim=pass header.d=hammerspace.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hammerspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6o7u5pKCX48O3tAIRMjbwPy2UIm2hH2hTc+/fRSN+HY=;
 b=RGEJ4PpnxGz3Cd+UOR5kYnnK/hKxQKi4Q2mIvt2OIYdVfmLf5LpzBJyjK5afyuY5VyBa0RSyumqSpEb4HKwVAkJPk3FZwQEP76RhoMSbSx1znKGaIIsr3/h0XdJ6xh315a3+qyFUUFTzfFZHLqMTyEoe1F4G8lN4ar/IZZR/Dps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hammerspace.com;
Received: from DM8PR13MB5239.namprd13.prod.outlook.com (2603:10b6:5:314::5) by
 DM6PR13MB3627.namprd13.prod.outlook.com (2603:10b6:5:243::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.22; Tue, 24 Feb 2026 19:32:54 +0000
Received: from DM8PR13MB5239.namprd13.prod.outlook.com
 ([fe80::fa6e:7b5:d1ec:92f3]) by DM8PR13MB5239.namprd13.prod.outlook.com
 ([fe80::fa6e:7b5:d1ec:92f3%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 19:32:53 +0000
From: Benjamin Coddington <bcodding@hammerspace.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Jeff Layton <jlayton@kernel.org>
Subject: Re: [cel:nfsd-testing 29/69] ERROR: modpost: "__crypto_memneq"
 [fs/nfsd/nfsd.ko] undefined!
Date: Tue, 24 Feb 2026 14:32:51 -0500
X-Mailer: MailMate (2.0r6272)
Message-ID: <DD8C2378-606A-4991-85FC-A095BBF7930E@hammerspace.com>
In-Reply-To: <de821329-d25a-41a2-99b0-382ff55f36b8@oracle.com>
References: <202602250104.IwFsHK6w-lkp@intel.com>
 <E960A26C-F3A8-438E-BD28-AB5C29FA4EC2@hammerspace.com>
 <2BB51201-EF40-4334-8D8E-30112099043E@hammerspace.com>
 <de821329-d25a-41a2-99b0-382ff55f36b8@oracle.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN0P221CA0002.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:52a::26) To DM8PR13MB5239.namprd13.prod.outlook.com
 (2603:10b6:5:314::5)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR13MB5239:EE_|DM6PR13MB3627:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b2e041d-f1b7-4378-b51f-08de73db8130
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8mnBwG6/pgckMsn7arMDXmUaXdzMiV2gOKQyFLBX6/jdNWyI6FSCpU7TpTmF?=
 =?us-ascii?Q?so/uC2urC7PxzkDVu0IZcozBnsM4F7BFRbRt+SXUJJyOaAJrFJzwqq4pmiIo?=
 =?us-ascii?Q?aqeP/KLrf2pxmv1HXAEdKzxA/b+ZsywWOMxa8+dmQ7qWDsLOepGln9C+9CSK?=
 =?us-ascii?Q?DZVsn+2xT+vtm31ISP0o69OR2J6Hp/w52hWRgAHwsRpuiPhkIWJeFJg1bxoY?=
 =?us-ascii?Q?mUQZiMSa6QNEZFy5m8IYOTEY41OA87zDjKxRxHoK5y/nWzugJ0uqlDxmsrcO?=
 =?us-ascii?Q?YnpwT9xxuZrbW7bHmyUOfV3lZikRNIxYJ8AaJayuq3pU/GCnvr7jFg7vUgHG?=
 =?us-ascii?Q?OpCOYr27qtZ5tBez4G/qq9J0Sz63tA/OiM0oLyDi3g9lpKUfmh7u/I0Fm2RW?=
 =?us-ascii?Q?VAkyBUBqYI9h0RTgYqCvPK8DI1HAJh26HRWTMdl4/rElqySzta2LOs+6oJ6Q?=
 =?us-ascii?Q?SClgHGEudOvOjv8LdVkkkaOVAW0xsjNeqFOqsK59p/ncu9czdLR4Z668kr15?=
 =?us-ascii?Q?FnSVI8e4kkjGqp2IbrFF+jHki5L9/66PfjLVD6gAK2WugenofTTjAxS7X3iX?=
 =?us-ascii?Q?5gtMVMQ9srovibzbGy3QhkqN0BgTJ+dNNvPs4WOHUk1rYXL1Cd8/YnQnYuSy?=
 =?us-ascii?Q?9CHUjrepp8yCypbUbAX5X771KxGuaNhTJkiJ4q507ng4PdW53V1J/Fj7xPxv?=
 =?us-ascii?Q?st+h5bcpPOepqNlV8cGHGBC+SN5sROm2m5OvQRJ7NY4puVsW0yV8qTUlBE1W?=
 =?us-ascii?Q?ripP8K1Gsgg99M+JyeoUysCIg4DtJb0ht1IxeRwIsbb5AJe/EzXw0XBBm2bw?=
 =?us-ascii?Q?dvUXRr//XIuQCJ+hvvWmXCYK88Es4igSvW5M5ZCqh5sJSB9+7/KAojjNprZb?=
 =?us-ascii?Q?otx7u2ba2F66N4YRO2tKeOy0ETO0Wy4KmKiekoZ8bdt0wtiRvycshZ1kvFUx?=
 =?us-ascii?Q?pqH//OG5LCJy82SGMljDbhE3Dhv6tREosWT4UTJRAQc4MG48iYnDLSU31Mwh?=
 =?us-ascii?Q?Vvqoz+WnevFSqM21s9i6NeESWuipwBHNzav4Kjzt92K0iarr4KsLy9EUGaKC?=
 =?us-ascii?Q?S4RCmVuoiSuEzbeNBzUgQvfRxwWIRpduww1yMbigPp0+738he4YcmMHwE8JZ?=
 =?us-ascii?Q?McSm+vIH2baPe/1YYt7cK9j4U256oVLLNd/EiuXY/I816RlwXIyIGuhnPCZW?=
 =?us-ascii?Q?eySN7LHHORfE5sRWpajzfdjxJHpil5Ex6RymkKjgSyWzbXS2AOReOivT6STq?=
 =?us-ascii?Q?MnOIlS97ApiUBfsCuGsI0gGOyaEuRqMaBpnSSq+p8lkbojrt8e/DLMujrIwo?=
 =?us-ascii?Q?ELvTqwX5byFOaxT7EcF69YDpUYYIhz3xkXp+LKle36WY67rn6pUzV29NGo4r?=
 =?us-ascii?Q?tJ61BlOhn+ZgJwpSyPn8iN+dLUFJUjuiBPmRcdl7J2NJQbI1RomaXrdHeHYy?=
 =?us-ascii?Q?OUI7D4wZb1d3kCkpiRRsfkeT1dsZx6/oqGYySziA1Cd6x1BTFJbuPBe6i0ZI?=
 =?us-ascii?Q?pmOsV/iuAafnxL+xuV1YGKZveM8Qy3WCtJ4yArzQ5CHaHhs8Y2Q7jHavOmIV?=
 =?us-ascii?Q?wXS7bmsldFyjiDbfTtw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR13MB5239.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?idKQGDQzxgyxCuYbymtAvauMCi4lIAI5WPPx9lL1uge8ocW9gnNtFLXBfF/L?=
 =?us-ascii?Q?/6cNZEJGm2VRgy8TFcgCUfAJGsWu0+sW7FRr8eYMpcqMBN6Ipu1zUYRbGCC3?=
 =?us-ascii?Q?R33+hvgFMIMUlGtunBy67EKTkCXnHDmki6quymYDCtjyFRj9cVJEQWmZmBB6?=
 =?us-ascii?Q?bJ+aAfl0raDgA7daF9lSvphulfORPebB/pmgM9ZrIIb5xsevO9m1bR0y3ESo?=
 =?us-ascii?Q?jeW3GGubnsu7KxlIoq1/xitn2dDBXH8nkqCjC41a+1ZEgfZ+kyZL7kR9kbYO?=
 =?us-ascii?Q?tECslFAchQ6TGn+lDy5BREQ4oaxP1kcPaRSlINCraA5KJGCd6up2bRboxoVc?=
 =?us-ascii?Q?IqtqniYlxZ3SOwQRvFnDIbv3dINP93o4U030vLgS86GdK2XUMR18DKAgPV4T?=
 =?us-ascii?Q?qDMzRbQ834E5cMJKF15LTvVctSFjBdqMt+K0Jlsh1PhDHrTTKrcXqMUHnOLr?=
 =?us-ascii?Q?hBMnDJczsM1VE2pgD6gPHfde+bowp+Awlm2SAg6GsMM33Nnpa7Fkn186LiR/?=
 =?us-ascii?Q?omnlUiMj+qVB62TJ9BqlOQVDobFzcPBMNmzXPY/ZcQTRBWlVIBHPJf6tUkN3?=
 =?us-ascii?Q?zFvCOrGQN23QocF3kGpbCtnIlXF1QG3FUo8Wa5e08yZaGBMy2b7XTZrp/r56?=
 =?us-ascii?Q?S0LN7jxNQGIULoSX96k+F2wUmd1Vy8hWkDYXtlr8v1Jsy2pQ+ln+QQfqq14t?=
 =?us-ascii?Q?8lyKrCa4+wcm1rapIw9JoNT5xdTeaQQWzobJYrpkFbIXXEIyHDkFbxODysF/?=
 =?us-ascii?Q?lxPLHYfd31Wx6IbdXMdE4R8KLEjpx2KURA+DQHUx9Vld3ieUNkxI+g3ML8MS?=
 =?us-ascii?Q?caG76e7/JL3tECgrKMKUPCBWY6EIdagqoQD8k3wJfhXR/eXPEkzULkjqUQe7?=
 =?us-ascii?Q?hUlTm1fcqmBuPctUIuyIDPcxX+xrkaQc/9Ft+ebwXt+xst4W9ISYlV73U0gW?=
 =?us-ascii?Q?VaSkJrso9iTaRzmLZqVfYOQ7cX9Eq5vp0v8cusGaRznng8kECSfEfFfLi5Uk?=
 =?us-ascii?Q?m46T6dBT7Yz/vcePhqeMGo75yWgIed+7YhV3vqKSl8SO1p3ZbC/HtJcwed5K?=
 =?us-ascii?Q?UVOSSqz6PyNDWUoZkLr30zHUKQYrXsMD1XXFN++Ks/bCLRrWHQ+qHN9QEcN1?=
 =?us-ascii?Q?h02bNF8aJwC0Y7LwCtisdI9wAqGUG/6CgHuH5DvzYUedk7h+4iI9tLZ41mVL?=
 =?us-ascii?Q?Ljkg6+i0/i27yxOGTDmpFyiQ8REJURq6j8ey1uQSV6yY7FI36o0kJELNFccW?=
 =?us-ascii?Q?o9Zh1K7NWwuAtwo4Nac4NebqlCKnL8mJZ1iUVbspHBermVQ+lK1/zROTo5gZ?=
 =?us-ascii?Q?sCpjAS2GgFimMKvVc9uBdy0i5VPA7rXwMeDPl+8X2/hILxeJB7xUctZL5oW7?=
 =?us-ascii?Q?OjwQsrMmRXZCY5jjON5pqZcx1o1PvJmB8YL+e4Ww8c5Xnp42l0A1kucdLSS5?=
 =?us-ascii?Q?23UVs8xxgo87XLIpE8BdkqyJkd4UGMIeGfnPMaF/MOSZcv4lmswjpLpwbESM?=
 =?us-ascii?Q?X3rIMjKjNkByxkD1fq/1KdMzL/6zjL40KIHnWvbR3Pey9lOretxAnurG1kJC?=
 =?us-ascii?Q?FQ64UrS7nv6zAbbLPdPQjSZ3bvkOKlvXHYFvg7Zf+u+mwdwtG6HdFU8DNj00?=
 =?us-ascii?Q?1Y65Tt2DFQsLt7VF2zbjwLtOOYBYq1Agkg4pnEIaO5MPB72Vxy5p8KoEIF2g?=
 =?us-ascii?Q?vgUKLfYFHn92kQe0JSLlisffjBwdqVFLIi+VmmwCGWCUMkQYYUJFVop0MWbD?=
 =?us-ascii?Q?84ZeKp1f1nJrapGH/w850mjxbjSQJbU=3D?=
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b2e041d-f1b7-4378-b51f-08de73db8130
X-MS-Exchange-CrossTenant-AuthSource: DM8PR13MB5239.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 19:32:53.6836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6icrKGdMlNMvXizbSSDWZjJu4aLarOoXzAU+tr96o7ZZGIq2RgPe/r7bysrkAAAT65DZebSz82tzd8N2kjFYxIEoDMkyhW8Jgq7U4HYRVWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR13MB3627

On 24 Feb 2026, at 13:54, Chuck Lever wrote:

> On 2/24/26 12:45 PM, Benjamin Coddington wrote:
>> On 24 Feb 2026, at 12:35, Benjamin Coddington wrote:
>>
>>> On 24 Feb 2026, at 12:20, kernel test robot wrote:
>>>
>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd=
-testing
>>>> head:   70a2007855af80c48aa0cc86ad2a1c50b907e37b
>>>> commit: 35a0423a2954050da493296010d5c57e0d76f8bb [29/69] NFSD: Sign fi=
lehandles
>>>> config: sh-landisk_defconfig (https://download.01.org/0day-ci/archive/=
20260225/202602250104.IwFsHK6w-lkp@intel.com/config)
>>>> compiler: sh4-linux-gcc (GCC) 15.2.0
>>>> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/ar=
chive/20260225/202602250104.IwFsHK6w-lkp@intel.com/reproduce)
>>>>
>>>> If you fix the issue in a separate patch/commit (i.e. not just a new v=
ersion of
>>>> the same patch/commit), kindly add following tags
>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202602250104.IwFsHK6w-=
lkp@intel.com/
>>>>
>>>> All errors (new ones prefixed by >>, old ones prefixed by <<):
>>>>
>>>>>> ERROR: modpost: "__crypto_memneq" [fs/nfsd/nfsd.ko] undefined!
>>>>
>>>> --=20
>>>> 0-DAY CI Kernel Test Service
>>>> https://github.com/intel/lkp-tests/wiki
>>>
>>> Probably because:
>>> # CONFIG_CRYPTO is not set
>>>
>>> .. which means CRYPTO_LIB_UTILS is not set, which would compile __crypt=
o_memneq.
>>>
>>> Several parts of NFS won't work without crypto - should we just set up =
the Kconfig dependencies?
>>>
>>> Ben
>>
>> This fixes it:
>>
>>
>> diff --git a/fs/nfsd/Kconfig b/fs/nfsd/Kconfig
>> index fc0e87eaa257..ffb76761d6a8 100644
>> --- a/fs/nfsd/Kconfig
>> +++ b/fs/nfsd/Kconfig
>> @@ -7,6 +7,7 @@ config NFSD
>>         select CRC32
>>         select CRYPTO_LIB_MD5 if NFSD_LEGACY_CLIENT_TRACKING
>>         select CRYPTO_LIB_SHA256 if NFSD_V4
>> +       select CRYPTO # required by RPCSEC_GSS_KRB5 and signed filehandl=
es
>>         select LOCKD
>>         select SUNRPC
>>         select EXPORTFS
>> @@ -78,7 +79,6 @@ config NFSD_V4
>>         depends on NFSD && PROC_FS
>>         select FS_POSIX_ACL
>>         select RPCSEC_GSS_KRB5
>> -       select CRYPTO # required by RPCSEC_GSS_KRB5
>>         select GRACE_PERIOD
>>         select NFS_V4_2_SSC_HELPER if NFS_V4_2
>>         help
>>
>>
>> Chuck would you prefer to fold that in or take a new patch?
>
> I would like the crypto folks to give a nod to this, they are
> particular about Kconfig dependencies these days. Can you respin
> the series with all the To: and Cc: ?

Yes I can, I'll rebase on your current nfsd-testing and retain your changes=
, this will fold into v7 3/3.

Ben
