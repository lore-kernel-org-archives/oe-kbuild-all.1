Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792576149;
	b=Q6gF4JpaAgwqhifPuNgO0pQ51GE3ky1yf7jInG7vsaPv/DjRRHUN+OiThWgKEc5LIdz1
	 a3QycqIvtGc8VWs7bhzbH/gPfs5syFvhA70PyPBAfKGhGPfrAD5DMkTpS8uaYpfF2By78
	 xjIFF1eMpaXRDqVtXTZf6BwNKFQSNOX2SjFPIxaGph4AvrMt5sdYSQOZOULwbXXE7N4E8
	 2+vewX+rkbroFwlULfEvzjlTF4jhzs4oVw4CXqnU7lljUcCj6y4wKHQ4PXHu/gOhHqksT
	 zdZh/fr5nf/cFpLLY7Z5nRFse7T5OVmTUMgB6wh+8kBu3lPjjJrov96XI3pOFZa/RgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576149;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=PbB7TYQeWcJnJ8ssulaBNyIhbps3F5bTqDEBZSs5888=;
	b=mwC+y/aNETVF0U6j/DG7p1xxWFv/r9K8u8j8zEoVbE/WJEpnV/utLkvmPB39NZcO8UcG
	 HQEirV5o2MjtlG/ricnONafh769cpKFvezLredZG26K40WezkAOLRqG5KFhkOKrx2Vwyu
	 VITwWOeuEeoawsGDwAqiPzO2PonE874M0XEtTEvS36RR1W9A0Hmts4/+Agl3NMFwZ8jAY
	 Kog9B6vijH3Pto8hQwLiDVDxd40bpksjn/Em2o6fRilRJ7+eu2hQPhyy81n7muMpHolDs
	 fOgcjU0tvlNLbL+xECbcjMii5N0YWzXwKACskqwSIzQzhdTSU7s7QTExApOZyFROP/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=axis.com;
	spf=pass smtp.mailfrom=axis.com;
	dkim=pass header.d=axis.com header.i=@axis.com header.a=rsa-sha256 header.s=selector1 header.b=pxLeoSr1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.17
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013017.outbound.protection.outlook.com [52.101.72.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A927C606A31A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Oct 2026 09:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A927C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256 header.s=selector1 header.b=pxLeoSr1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dazlKa7cnu7Uf+T8l/SabOI7EFSOXLdcYzeDQGH4rtrG0Xwrx+z4DjtwoeYFyMbvQ08z+GPS7hxqUT4jLBkiFVaVRG7pvGAmXjMxLNqy0kTQHecPpQfTNQOq/hfDA76mRN2SRHvfScuS27yMATzMbZCg87bFJCqMIuJIvgQZW9zbRTRkw0zihWgSW1wHGSdo3wg78jWmSc51RxgiJzfP0vVEHhOfzvlzJSCKUS2MBgaRXZgZBcB0zNd5qXA5EjM8d8Zk7ZuBdDqhc4SJhlPV88oRCIRO+0T3ApqTSJ+2z4itNJnfYmLQCemuz7PzjcQf+GT+zl/QiM73Iy304vLOnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PbB7TYQeWcJnJ8ssulaBNyIhbps3F5bTqDEBZSs5888=;
 b=gC2Hc53OqdIP6wkBcjHZiCbEIL0FArR38RqDnZhziCb4VsexLzwHT6q1J4loCuRfQzorSXnvPi3jFpFZ2iFGmMNxX42IbmvR7/ph7XsbXC+DmW6T1B9owZ7ozp7oJjzNa311AxgNuT3fo4TpbAoXKJCckFl9/8/4zz1X1bD0J7SAVgIbkc7DJFSkYyztLDJ04C1kf6PYsmvhq47bNblU8jKP72vYAOIemVLOZlJVOovy9OWWf5YwgpRdUAGVTetqe2RQYin+04q+c56d5C/3VqAd2tkNAA0udNK7EuCSWelZlxEapgorIibgl0fwGWrzWIJ99n9lnrjRlFJk4mxrKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbB7TYQeWcJnJ8ssulaBNyIhbps3F5bTqDEBZSs5888=;
 b=pxLeoSr1lK57z/5PJwjYM2aUAuP0t0Cp7nFjEU8dhLCfje/NBvu9JhazDAx3gSY1e1aTGR+JX1Z+lSCWC70MKbAw4mzSn6GMvajMo5ZB27hifA2cYFOg4amJZIDo29s+EvNBKadsQwUcKc20Zo1FdlMtmhrXxm1IY1oTUL0ISNg=
Received: from PAYP264CA0021.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11f::8)
 by PA4PR02MB7055.eurprd02.prod.outlook.com (2603:10a6:102:107::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 09:49:02 +0000
Received: from MI3PEPF00008556.eurprd05.prod.outlook.com
 (2603:10a6:102:11f:cafe::a4) by PAYP264CA0021.outlook.office365.com
 (2603:10a6:102:11f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Wed,
 21 Oct 2026 09:49:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MI3PEPF00008556.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 09:49:01 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 21 Oct
 2026 11:49:00 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Randy Dunlap <rdunlap@infradead.org>
CC: Sebastian Reichel <sebastian.reichel@collabora.com>,
	<oe-kbuild-all@lists.linux.dev>, <linux-doc@vger.kernel.org>
Subject: Re: [linux-next:master 5111/5916] htmldocs:
 Documentation/ABI/testing/sysfs-class-power-rt9471:1: WARNING: Inline
 emphasis start-string without end-string. [docutils]
In-Reply-To: <853fd4a2-e3c3-46cb-844e-57f0002f86c8@infradead.org>
References: <202609110722.GAZVme6v-lkp@intel.com> <pndse3cp5s6.a.out@axis.com>
	<853fd4a2-e3c3-46cb-844e-57f0002f86c8@infradead.org>
Date: Wed, 21 Oct 2026 11:49:00 +0200
Message-ID: <pnd8q3rjsdv.a.out@axis.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: se-mail10w.axis.com (10.20.40.10) To se-mail10w.axis.com
 (10.20.40.10)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008556:EE_|PA4PR02MB7055:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e0bf765-6d9d-4276-c765-08df2f588910
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|10067099003|22082099003|18002099003|261009223027099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	WLjSKUvzI6Vfz5bi24YeAyqtm8/u/SeMrnieuVXkpwujW4ceMbTJxZH9eGz+6eNdJXCMpnxWPlq9lchJsV/CfHS1Xu7CIP2GnegOEwAAxHmKNJ3XofQyrABhdZgG17hnOzEyLdCsBBe7QdgU1RdnO9SYudFhf0Md53VRalNCuF+3RhfbMTkfKfh6xtMFw3jk9ADUrYLT5IXomFjF6WsxYcD8fQ7HyEmOlvtCD05CIO37vwVBuTTaZIIbLVPHRavvtjqggwsjksITU/IG2s2e1semh7IAfVr+BlnwwqQWiNTXvXlXM8ol7ExfJkJvTr1f6ZMDAOeneKffUqyOh1zEtcavMtbdg4m5IWkyVHhj3MyRtY0sLp0p9YfZvz1/NgUyS3NugOoT3wUD9J0CTHS9uPeuXoOKNpDthPvGXGdKJJ1lTKxTzvTaN0t/QLJjR5P2NnWhB1IIDa+OSgObauJcx8IqJDIub2I4ifmXM+AVW9Dq7bA08mWdUJbwxezTKXDOkgh7RWNHWGXzPSPRUq7zuLDC+GCvxmUUt1P2VBJT4d1Yy0DpwXCSI54AFwJlqoUJlOnuRzacF06uu6P2se0Tm88tol5gkPCIWV64rdy1lIH/AqhKezUIvOzAaGkKAfKVEj8TLa01v6rf677Sx32JboAg+7ccPnjWrHZ94f2ocmAKLv1ZhPAYaXFfIbMGQVKoROxh62gYukjN7BfZeND9GA==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(10067099003)(22082099003)(18002099003)(261009223027099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mxaEw8BhKlL6wwdt/gcEreqLt+Ms3iquk+qVPzLczGnc+zCWr1ojeQYSjtOOy7BO5pD20KdZrvvmbLdum5XFIc+Y5AfmZyvCpT8IMCnh65H1N1OrrGULoe+zQPXYELBbm16O7zVqVOyAjNCnNnij3dKbX99X9m2SVjT1DNVplIo096wJEfN8xOdUrBG/QMiYCNNewbdQLl0TmeLoB8tYYGhJdITaQ/ji3BeB6Hk7QHRCs40TI7kPffxDs0KCRT2+8/s4wltEqHbIj6Ym1whe2acDdGxswkW0/utFFrd8YYbWLoSOBlKL0Wra9bX/bzN/u8GzZkO+Bx7ByBSjWdIN93kbLHFgpm+8HB/dYdBGU3kwy+CRkbtO5ySugxWPlt7hO/Spx+5zPYon5/HFLY4z0OL8863jA7G5rRuLuzdDzDmU4OgZlukJ0VuBjhz9axzi
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 09:49:01.2482
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e0bf765-6d9d-4276-c765-08df2f588910
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008556.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB7055

On Thu, Sep 24, 2026 at 11:31 -0700 Randy Dunlap <rdunlap@infradead.org> wrote:

[...]

> Please fix it (the warning in sysfs-class-power-rt9471).
> I don't see warnings from any other sysfs-class-power* files.

I was waiting for Sebastian's response before doing anything. But I'll
just send the patch instead. I can't see that Sebastian would actually
oppose this :)
