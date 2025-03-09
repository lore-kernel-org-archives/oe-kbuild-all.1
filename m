Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2086.outbound.protection.outlook.com [40.107.212.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826617602D
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Mar 2025 08:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741509466; cv=fail; b=Q8W1Wvjc9fw7O8pyyQTzyKzfAfAcDabfesAczoBLN3txOdbCFSmnA5l7PgHzIZm7bLi6nYSmKOPGCQYAyqLtZLsTdArB87pM7cy1xLUzN6TWTZmrZnZGSUAQl/UCRyUjz1qmn64DdArtiQ/TItgXdE+CR7F2nDIEzSdLpaYZFmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741509466; c=relaxed/simple;
	bh=3nqSbQAwenV1L5KDt5mw/ge+IGknvHFSCBQiSO32u7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=C4FZPvF0cfBKiR2xI5hdgJl7sIbZ0QE8sNBoqxng2j5qmG6P2DDbl5XbG5O5jOwGk6SMPZQMhzSXw+pIFYBx2ul9oy2++/OrCoa0hf5eo46oHFqQso3AJneqVymUe+fN6/khmK/07qMbedowBVZI7P7SKl4RbfVXjC+YSzDSIuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qJylA2cQ; arc=fail smtp.client-ip=40.107.212.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qJylA2cQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zF8Pd4du+bxNUwQ9C7NlEG3+ZU2hFxT4/vwctV1jecnT7XMlxuhfi40djTPUWHBip3Afri5uGjE99JwnbEZQYCnOpPppmCxV8UrWErhLoYfbjw+Wr0NfDl9v4gILD/+zm+yov+WN1g1WgT2qB8KQs4pWurptBQ+aFFFDmaUP0WlROnJef3ZhXgf3mDxfP1HKwwhS4Y7LqUBlQtAWEkCbbylDFUGpfNIt2ifY9clI7ydDm6Ih5Sfh/xkPHbN1utfSLxuNYWbfAbT2hHRWsMTWDdqS+84wxFwPXNHNee6wialiB1jVrxjXHtNPWMN0hRvE3i7tP+BbBZIfi4RIA+zOlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuf2sW4aS9je6QTUTeOnyHUzfdcxa5uleIWVoBO197s=;
 b=EW+z+pDxM2ba2sP3r5YeUt6vA3jtaYgMPmd/1BhjXiqnSLZQUP1Wd5qx0fZmkcdEi6Q77tKT17x+aQwIWgEMLirRwr5lzS3UeIuah58Mv4ZYmhB5Ll7MrmQSyHEZV2Ed/sPl+iv9MYFkff8kj5Nh+RgCTAhKzjN6MNNMA51pf7UErNCng08VwBZANXEZKrYzjaxyFWXoB23ZD9zGwEleo3xMLXaZKypF916mABpYSeEAv/uTLcfEvGvB/wlCgn6giZ7MxFGN5XQKgGtzZs6WMmE/k8n+whSShN4Zvr7OhSOcZ7lPTkqt2FO6Co5IFpe5NR136UJfR1ui8cc2idmbYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuf2sW4aS9je6QTUTeOnyHUzfdcxa5uleIWVoBO197s=;
 b=qJylA2cQen8ocMQBOede1g2arsZ9M+YyTysfa0Ge1TGwib11ooEqqvMeaUG8Pr/0Jitay1jbLdCmLEJGQ5RNYIU3/Nxc+U3gsIbC5mW0sERMp90hXMTiFvRrJHWo8AkwqF/oNqeRYbmoh7nqh/s9ndOJLG1arJ/od+QzE1lhhr4Ti1o7DxKO7b9tdc8cSTbrhaipO1qlhJ76Z3ZHX+KS5q0UTHQ5AuyU/JxE9CLLNGwqteBBM8sFUMLraPdyjkXCWaZvpm3Z9Bv4yve7w/XuhzlpnuwxXRyCGqyy6MTdCBS3xqzkZ59vLxhodsANJDUQZZcH1gv/M8hTnk84LtBwQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6424.namprd12.prod.outlook.com (2603:10b6:8:be::16) by
 PH8PR12MB6963.namprd12.prod.outlook.com (2603:10b6:510:1be::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Sun, 9 Mar
 2025 08:37:40 +0000
Received: from DM4PR12MB6424.namprd12.prod.outlook.com
 ([fe80::8133:5fd9:ff45:d793]) by DM4PR12MB6424.namprd12.prod.outlook.com
 ([fe80::8133:5fd9:ff45:d793%7]) with mapi id 15.20.8511.025; Sun, 9 Mar 2025
 08:37:39 +0000
Date: Sun, 9 Mar 2025 09:37:29 +0100
From: Andrea Righi <arighi@nvidia.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Tejun Heo <tj@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [linux-next:master 3203/9634]
 arch/powerpc/include/asm/bitops.h:126:26: error: constraint 'n' expects an
 integer constant expression
Message-ID: <Z81TSQHHaNq_Aj4x@gpd3>
References: <202503090435.wITkzD2e-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202503090435.wITkzD2e-lkp@intel.com>
X-ClientProxiedBy: MI1P293CA0026.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::10) To DM4PR12MB6424.namprd12.prod.outlook.com
 (2603:10b6:8:be::16)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6424:EE_|PH8PR12MB6963:EE_
X-MS-Office365-Filtering-Correlation-Id: b1e184b6-bb19-4198-8b27-08dd5ee5a6e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7FoGwisdVnbXqqe1HTxoGqLD/wpu4Rv+8+N9AIXJpFg/H3UxYqDfL5smKIsl?=
 =?us-ascii?Q?uhLut2kGpLyVq/xChnT45egRJ4zBX42ueMp0IdhdNwXom8GwZpWc1GK3Lv04?=
 =?us-ascii?Q?ZDZi0NWlIe4W4RY5l4w+RBPGWKqxIBC+vUVASVVvu4o+GrZKnGQYMZrS/CHE?=
 =?us-ascii?Q?Ptx03C5y7+dSqQnSnQiRm/gYuWjVVGt3Ux1vBnEq5U7NhQFvosFxjV9gjwEX?=
 =?us-ascii?Q?vOYEyCnrJ7yz5M/NJysLbKcFL63LFWMlGJf8bQJL9l4FBgN2Wj1GLVTEl7D0?=
 =?us-ascii?Q?tPa+y1hZVvWHbbqzTeycpRsVewGluo0ZbhhGIRoXi0uMxBXz/oUPXSCljwJ1?=
 =?us-ascii?Q?9BdQ9Awo9SVrhc8swx2TnaPk7GVhyUSO3ik9KK/YP+amxtt4Vpt8BMXoCc8c?=
 =?us-ascii?Q?MLLLlzEWOAiPUIeOIfoDS8kHf7kcf9yzptfMGwFCrJWT9vxc8xUpV2uQG0hJ?=
 =?us-ascii?Q?5+r4OYt5yj/smcYG4NFfqJ/St+aAqFW1tEmQYPHxnJy8gK59pFS9MyoSpigY?=
 =?us-ascii?Q?HL2/4d9g+VEqgcijJH5TwEAMYSdYGQn+4Tv8CBQ4C643GJQ27K69taKryjkO?=
 =?us-ascii?Q?zGE7BcGAVt9U3UFxTWmoJF8UjY1Dh2JjPcQRmwIep8s63C2Wgh2pa+6OaJfw?=
 =?us-ascii?Q?ZQCTG6jK35HghUNZQ9vnNIR7nQR9bccZlCUwv5Okxkz00rTHowc9GXpzVAWB?=
 =?us-ascii?Q?iJk/ukSjjnkh0KIlJLcS74y/ZHT6agPQ3lo97koLRGzqNdZh8pEADZCTB/X2?=
 =?us-ascii?Q?OLRGV+tH7ztULmQIf5tEnCyPmcbW/GmOWO7mVC8Y0gaBKxywdUYsaBB7+X7q?=
 =?us-ascii?Q?aH0hrY7cB1CqU5r0aJ4nHLiykjD8g5QRBar3K+lYXg600AUBtwZwG2yszRzK?=
 =?us-ascii?Q?HgDOlOtn0RoGcgTaeiGODeydm1ME3Ei4kZh9Kmtg1JwJH0vcg2l7bDqTpcHc?=
 =?us-ascii?Q?G3vdz9MQtsHGKghz6lRv9/nwxyk0wbvQ9AHorO+5Omm1Zc18tmUl/7HbXl+r?=
 =?us-ascii?Q?LGbNeMiQrE2moI12gEJ22rcVIqeemE54zvCoMrfSgvNXVEeSFqyuT7YaYwVi?=
 =?us-ascii?Q?JjLS9/Fz41pDq2OyfxwReEOXic5SV2qdjG6RO6pttpXds47pl9olJvq8NxKB?=
 =?us-ascii?Q?JBE6ydX8223OOpqAYyZivPEjBV26a+ACR0/umAJwQnxKx2nTqB7fGXH3Rytx?=
 =?us-ascii?Q?KXv8XxMtekSeafZK+MSPPPz2bQJaZOpX0BmjUEwCZ00tS8UlgDqn6P69XVRH?=
 =?us-ascii?Q?UY6RYu1JLOPoNP8IdiUgBAX2u6fKTiFSVEvwIn6/0tKAW26K2YxhHD2c5c0s?=
 =?us-ascii?Q?6NjsOfkNZxU328ya8ijcbJtstPvNammzZ+tCSTnog7QGrg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6424.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J9IYLI5kPyfbFvrRt5QdNSqIzCUhpxYOMEfJ5osJKsCQmwuZ6GwFq2hAnTk7?=
 =?us-ascii?Q?uu3jhQUYnww2GaEA4z+zYXpoQPEUMVEquwy0N8f3TUkZWOMDiFhcaMg/m7z3?=
 =?us-ascii?Q?kdc6YCIrEDn20NVHkLG1OAAM+vfsb6+KuT028dNa8jaK3Ad/ofhERPGfhCPi?=
 =?us-ascii?Q?k4HgDqlK/jdhFP0y3zS9dQiYYX+9ovRnG+oPPAvRa63V+UqTD4rpyAu+B7f8?=
 =?us-ascii?Q?VFZAXYpo2geREMZDcJjX/MiuKAuDJ+ArOWxVt1nlfaO+GqawI0lKLATbblDv?=
 =?us-ascii?Q?36h+bHrgNypGAIm2vkYdQOtRIcBj53m8+ZEPBm4VVzB7VhZHcbLVvuJDFdWO?=
 =?us-ascii?Q?/quTRpC3kX9n2Su287Qwxv9sG1kiD3LeemZywjGXn6qqKRb4XOAHXiMzvgBd?=
 =?us-ascii?Q?RtHPc6WiWFxpwfekeLG5QBweXSs/RS+FX4yVY4wnlctDaFZrYDxsGTDvzQl1?=
 =?us-ascii?Q?asAxcY+nSstc2noD1vlXoGTScJ3uRi0S71a0ritUk94xc5pxhiiD6Md+GQpb?=
 =?us-ascii?Q?ebYpD5pAs5LfcIfNHy6y0Pp7DgZRoKumhgNaMXfnId0plk6gjC5YKs3KsXbd?=
 =?us-ascii?Q?0cQXEwsdDmUYH9YYkAQy0J43sCDGAp1iLgFyzWoaFtALFrfOCBP7M/0YSnqM?=
 =?us-ascii?Q?GEzCuLSMPC8QkLIKdZ4JheQdCp619hlmzXhgnWfUhWfQZYKOerfLcIcX1MPe?=
 =?us-ascii?Q?8yYUzZsV9unsP5CVx7tY7RY5ycjX+wdwycARsSkB3OdsBSmB88hfO2HzaTrA?=
 =?us-ascii?Q?wwswTfryTgjcFjW48onOyXrorD3vRhMBdr1KhL6Cso6FNM+8svHRAJiF7a64?=
 =?us-ascii?Q?LN9I8wnrZhhioysGkk/GDqXjwgM07AEl+TwzhUqiulH7qzruJt0F/f71JNc6?=
 =?us-ascii?Q?8TjWMbbCnGQpB/0r7RehBuEIrj9b7YWVUVw54Clz3wSQWn+1ylf5alGXRMxz?=
 =?us-ascii?Q?KB6dtlNjxKgzRIWgHKrDyyiYtkqmgY5IdMx0Tucn0r7KC0yj+JhDLrriRzFM?=
 =?us-ascii?Q?hKG/KjYE9v87waD62i9cmuPZuSUr9PC98VsPsy9f7gusR1oH7gwi8JwAIwcQ?=
 =?us-ascii?Q?dV/wLcyMtomzOlCQJ8ivTpDteCQUzo3G6Ww28Rf8hChU3An2Lul4d3crXQSE?=
 =?us-ascii?Q?Sj7bB4j4XFBNFvm/iJzFT8gTs86PsJ4k2nV1EOqGnOmQEykm3CavnuJ/bgeU?=
 =?us-ascii?Q?T5/XipbSpFTGlrL691aPqOAMMJpaH1zDC+n4CrjDnVegQZpKKGq4EVRFNCFA?=
 =?us-ascii?Q?ZnBtt7S7FlH+rhBjT5H4IMDLDzFAq09XlmggwfoM94qRjwX1kUeXnnzoyCTn?=
 =?us-ascii?Q?2nKYLKe8UE5/OtJg04SMj0wzq9KQInuKSmIARbkHnbaKkCkV5h8nPpJ9sgTt?=
 =?us-ascii?Q?bbUiGYKgu1JZRz6njBS6OcbIjHqWdUAmsyIjDJBbYCgsaRzAwKuzraXMl4bA?=
 =?us-ascii?Q?5Kyf/oNVmVPEUfj84dW5yROwSsWpfj8ErBiJkuDMVYwaJY0Vu1nFroJvhWtu?=
 =?us-ascii?Q?0wSUIuWSsdf+d9w9LxoK1fC7qFAHHKhyODeL6CajW2X+ZWnqp/vLHN1PnXRj?=
 =?us-ascii?Q?NCkIXQ+bs9bBq8AOnMtO5M10IQTzKmwoBFcema7/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1e184b6-bb19-4198-8b27-08dd5ee5a6e8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6424.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2025 08:37:39.9192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YWbrE+TsZiM6syoAZ3WIhM63+DeuHbTY6oz7kXkjPx1G8YcFopBPKzmE6A2+Ayg5CoT/8owkHcJZ3GS1ghxERw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6963

On Sun, Mar 09, 2025 at 04:56:45AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   0a2f889128969dab41861b6e40111aa03dc57014
> commit: 48849271e66114cb980a3bc44218b04d0f8cdcdd [3203/9634] sched_ext: idle: Per-node idle cpumasks
> config: powerpc-randconfig-r112-20250308 (https://download.01.org/0day-ci/archive/20250309/202503090435.wITkzD2e-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce: (https://download.01.org/0day-ci/archive/20250309/202503090435.wITkzD2e-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503090435.wITkzD2e-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from kernel/sched/build_policy.c:16:
>    In file included from include/linux/sched/clock.h:5:
>    In file included from include/linux/smp.h:13:
>    In file included from include/linux/cpumask.h:11:
>    In file included from include/linux/kernel.h:23:
>    In file included from include/linux/bitops.h:68:
> >> arch/powerpc/include/asm/bitops.h:126:26: error: constraint 'n' expects an integer constant expression
>      126 | DEFINE_CLROP(clear_bits, "")
>          |                          ^
>    1 error generated.

I've expanded the for_each_node_numadist() macro to better understand
what's going on, it seems that clang isn't happy with a node_clear() inside
the for loop, and it's not complaining about a similar node_clear() outside
the for loop.

Also, it seems to happen only with clang (gcc is always happy).

Here's the relevant code (with the macro expanded and comments removed):

===
static DEFINE_PER_CPU(nodemask_t, per_cpu_unvisited);

static s32 pick_idle_cpu_from_online_nodes(const struct cpumask *cpus_allowed, int node, u64 flags)
{
        nodemask_t *unvisited;
        s32 cpu = -EBUSY;

        preempt_disable();
        unvisited = this_cpu_ptr(&per_cpu_unvisited);

        nodes_copy(*unvisited, node_states[N_ONLINE]);
        node_clear(node, *unvisited);

        for (int __start = node,
             node = nearest_node_nodemask(__start, unvisited);
             node < MAX_NUMNODES;
             // node_clear(node, *unvisited), <- clang is happy with this one commented!
             node = nearest_node_nodemask(__start, unvisited)) {
                cpu = pick_idle_cpu_in_node(cpus_allowed, node, flags);
                if (cpu >= 0)
                        break;
        }
        preempt_enable();

        return cpu;
}
===

The code looks correct to me, but I don't know much about powerpc assembly.
Christophe, maybe you have a better idea of what's happening here?

Thanks,
-Andrea

> 
> 
> vim +/n +126 arch/powerpc/include/asm/bitops.h
> 
> fb350784d8d179 Christophe Leroy 2021-09-21  125  
> fb350784d8d179 Christophe Leroy 2021-09-21 @126  DEFINE_CLROP(clear_bits, "")
> fb350784d8d179 Christophe Leroy 2021-09-21  127  DEFINE_CLROP(clear_bits_unlock, PPC_RELEASE_BARRIER)
> fb350784d8d179 Christophe Leroy 2021-09-21  128  
> 
> :::::: The code at line 126 was first introduced by commit
> :::::: fb350784d8d17952afa93383bb47aaa6b715c459 powerpc/bitops: Use immediate operand when possible
> 
> :::::: TO: Christophe Leroy <christophe.leroy@csgroup.eu>
> :::::: CC: Michael Ellerman <mpe@ellerman.id.au>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
