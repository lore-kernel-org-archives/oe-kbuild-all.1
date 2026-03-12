Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010069.outbound.protection.outlook.com [52.101.61.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E813DA5B2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Mar 2026 15:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773330192; cv=fail; b=Wyfl+eBlpBLZvwM98kzHIWWlGMyX9RTVT5ePVumf0hk9mVaJn8qiy0I5a454IBoBxXAwOuzhmCf4IqV3khURQ6g4/hWpm92jlfbShAZkD6Wx5cGO5E7GKQzkxxLgpTD1NteC4WjpoE+d++b+ih1ySqUnpBtJ2FZOd/26MoJpXvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773330192; c=relaxed/simple;
	bh=RDVG8uRpm1qVcZQQx7/hW2tfU24Vr5HbrzpA1+zKr0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YiQ6RyMr1FNARK5y/1F9E13r6TMhDOX6IuY+NRisqU/0dokbrdErv2qlKtaRef5gzz5q+j/jklvFOXDwcEAZeGfDLEZ/rSKpAuRnn5RG+6HlwQBg4swsFPh4kPwEwnZYsE4NGETfdOoV36Oq76r68vmx/fX2GeK0Q4wO7yj5WTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rgILuPan; arc=fail smtp.client-ip=52.101.61.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rgILuPan"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NDWiI6sHJljjrE8FR+vC6JPNrJKQSuwPKN7K4/r6flrt+jddiWqfGsHLDLls04/kxMA5vZAf80XNYmBp8f2wQjRc7hGMTnVkzJL2hJWcpGc1OzIRdZMQlmXAGcTzYa1Ek54H9bfMEg1pN20lUlBYB9Td06I62nvo+M0FGzpsVYGGea0jKTczFLzHs6yICmUCzUyPkLvDGEkFu0y6N3AG7O5xTg6GftCW8jEfcb9HGt+iD2k93i6DzkdrXJUmwGSggTeOTxzjVaJL7RbeKh6/vdoj8CLeYtiFc+G1dxBecypLQkLU/EgqdBarUmz7/cv6EH/fOypLg1wPENUO3E6sNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ecFyQrv6OabPXd6tooPNzmQWhAL2Fx7DSBZrEgUrVI=;
 b=smEL67c+o4bv1irMILzSCmLV5Ctxsts96HvnGROCk/9oSsAKk+MK29+SxMPjWf/ryeaz8cDRnovNLdCtHswI16HFtXx6JKuD3NKqOpjGang5dlztsPtBGoFoKKLjCF8k47CVg0ORq7K+0Tm67ivk+9wyIG1KCBlNDs5OA4x+kgsa6OnRqQGPGFaHbEls/5sWZ0fjo4MzlzNp8wk/YjL64h9Q0b440SS9lJ2Yhg8N7aM9+XcJIW0Zu5VdsdvwCYrGkKZMZjyyoK+Ftn9Yimjwnf06ASBSca6cJgBSfUHbvAufq1rlKqZiTF7XS3gNG0HJzHOEteIS6g1LykxNukjXsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ecFyQrv6OabPXd6tooPNzmQWhAL2Fx7DSBZrEgUrVI=;
 b=rgILuPanMsiybWLYtj0vrJ4RKfxPWtRACLOvt0abvoT+Q0PdQjZ4Mfb/rFhw22X93OgqBaFiTW+AwIjDARwCsVcV43Pn/MP0h/YX/O89yR/kE4TO1E3+xjxORp8oCSccYgq18BBtbxE4IpmQuK+trjEaQAIBcxvFB125/XNWZwc=
Received: from DM6PR17CA0021.namprd17.prod.outlook.com (2603:10b6:5:1b3::34)
 by DS0PR12MB9323.namprd12.prod.outlook.com (2603:10b6:8:1b3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Thu, 12 Mar
 2026 15:43:01 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:5:1b3:cafe::cc) by DM6PR17CA0021.outlook.office365.com
 (2603:10b6:5:1b3::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Thu,
 12 Mar 2026 15:43:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 15:43:01 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 12 Mar
 2026 10:43:00 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Mar
 2026 10:43:00 -0500
Received: from [172.31.184.125] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 12 Mar 2026 10:42:56 -0500
Message-ID: <96d77b4a-7bc2-46bf-936d-3687cceb996c@amd.com>
Date: Thu, 12 Mar 2026 21:12:50 +0530
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] sched/topology: Extract "imb_numa_nr" calculation
 into a separate helper
To: kernel test robot <lkp@intel.com>, Ingo Molnar <mingo@redhat.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent
 Guittot <vincent.guittot@linaro.org>, Valentin Schneider
	<vschneid@redhat.com>, <linux-kernel@vger.kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall
	<bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Chen Yu
	<yu.c.chen@intel.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Li Chen
	<chenl311@chinatelecom.cn>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>
References: <20260312044434.1974-3-kprateek.nayak@amd.com>
 <202603122149.xyvcIkPY-lkp@intel.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <202603122149.xyvcIkPY-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: kprateek.nayak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|DS0PR12MB9323:EE_
X-MS-Office365-Filtering-Correlation-Id: 8061ff7d-2cbb-4d38-3a0f-08de804e0b16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZdDsEgOA/5+dNADyJj4xJD2m/GfR0/VTQvk3Ekruscn68uuuvEo0YZGDb/iOTS9enyyO7WajjJ53ERgdQd/qdTJraX3dCVTyEPvOgcvJDVWaBncMC6wzM9VSUzO1d5mk8aYEkCasulWMbPQR/Ye9Z70mve//86avXPmkXRnEcqLnNm4fRWGEVGiEO18anERTA8crsN+r6FZdWDhs3i1gS/UHTr7m0KYzSzzGTS2y4MrDs+NeZTTw2thCZU6PgpxV1tQ87DJ9h7avIYnxwkSGFqRLj+cG7eb3tgWPI3GFnxeQ3QJq1z12zm13woTJG/eJaG1Dc0PzKa3Nye9EVE3Sk32Yt8rq1fWjPFQi5zxXqAylXyg8L7t2kD5T3mcdi+TlmjFTLezOZLtoxBxF3e9yQB+Mu6s5YBY8mHXq86zTtkh63eYrZb756FJhwG2NcLKZ1Cc+xrMH37m6ve3bwFRN7g7E6A8FHwSCyE1qTVe2Ezuby7cgt+Fkg7ZV3eY0MJsBT24hq0x/0E7KSVYfDa+EIV2qRFwUUBaMa91VCYv32W78iFKPHkONPV0dJNIUowCHRQM8lmYDPfmxDlp49JZyC16pqZogDjAGh86ofI3V4LYfDV39+9CBA0pQEB/+k3ubJlRpDuIuxf/KADMau3eHg6udNKpRF1CYhgIGgPm/ETK6JLDJBC20ZNygv0J1rj5d8SmquD+HnZYQqKjSlg9bMTmaLAy7pfZvNs0EFkFLfY4JwhhGxfxD6pDLkDhBolmP4jtZXkVMPSYL3cMRNk+Vuw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ITHQ58OeBLZ4nT+6/hJsWJP0FdPqpBrHMtwL1wFUfu8k5jTnPyj/DugzA8u6LkLN8MtsG8x8H3cln9pqO4ijrgDqLU/51/Oisyr3su/4oHoN0KhTPKyFcGbsWaDKgj0LM8cNkFK/fpG7XaNpv50YauY4V0uJiDTiJCceOuz24DV5bVcWQqXI5FnCf5k3ieSjQSMaWc7iz+0WVB3/b9AP8c0N0onRu/QZG1kwIqko/W6IJb6x93YLKTWoN13ot8poy38OEqkgNQFeaYPHAnSTpDiY+GgfPW2uawzlP/pf/K0z17ZCBGyRluNVZqcPm/XQFmqwwkkaQf87s8wSlf9zL2oGgpWhkHDbHVW/ILmuWVMkcKaVpmPg2q6cCFUSSMRmlWaxLaxTzZuSR1x+mUugtrtagsH2cAP0Q5hhPCKjt0sThMI5JW9ITFep7fh+Zjmx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 15:43:01.4208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8061ff7d-2cbb-4d38-3a0f-08de804e0b16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9323

On 3/12/2026 7:07 PM, kernel test robot wrote:
> sparse warnings: (new ones prefixed by >>)
>    kernel/sched/build_utility.c: note: in included file:
>    kernel/sched/debug.c:730:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@

So what is out official stance on sparse in the sched bits? Because I
can make this go away with:

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 963007d83216..7bf1f830067f 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -2591,7 +2591,7 @@ static bool topology_span_sane(const struct cpumask *cpu_map)
  */
 static void adjust_numa_imbalance(struct sched_domain *sd_llc)
 {
-	struct sched_domain *parent;
+	struct sched_domain __rcu *parent;
 	unsigned int imb_span = 1;
 	unsigned int imb = 0;
 	unsigned int nr_llcs;
---

But I can make a ton more go away by doing:

diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
index 51c29581f15e..7d1efd981caf 100644
--- a/include/linux/sched/topology.h
+++ b/include/linux/sched/topology.h
@@ -72,8 +72,8 @@ struct sched_domain_shared {
 
 struct sched_domain {
 	/* These fields must be setup */
-	struct sched_domain __rcu *parent;	/* top domain must be null terminated */
-	struct sched_domain __rcu *child;	/* bottom domain must be null terminated */
+	struct sched_domain *parent;	/* top domain must be null terminated */
+	struct sched_domain *child;	/* bottom domain must be null terminated */
 	struct sched_group *groups;	/* the balancing groups of the domain */
 	unsigned long min_interval;	/* Minimum balance interval ms */
 	unsigned long max_interval;	/* Maximum balance interval ms */
---

"__rcu" evaluates to "noderef, address_space(__rcu)" but we do end up
dereferencing a bunch of these directly (like sd->parent->parent) but
noderef suggests that is illegal?

One place this probably helps is to spot cases where a pointer *needs*
to be accessed via rcu_dereference*() but it isn't - that is indeed nice
to have but ...

Then it also complains about using rcu_dereference*() on pointers that
isn't __rcu annotated but perhaps that is solvable (although some of it
isn't very pretty like "cpumask ** __rcu *sched_domains_numa_masks").
-- 
Thanks and Regards,
Prateek

