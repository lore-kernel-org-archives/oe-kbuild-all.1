Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792576245;
	b=shpraOtrDQW+rQAhZRjmFHYMryYFHTG7ywINO/vfaOOtfgnQYhR3AtbeDK2QlsNTO1O2
	 zGrq70UBQUfoBSXCTPyN1JmOy5GWrWY5oVopnk24WYNXGJymLAbkrEleHcmIbKfgwWo24
	 wXw2oanw9C9Xn3RE14f9yE5lvN0e71yDu0Qf9wp81JeUlWJoORpl/FrnyArUTalV7CKM8
	 7PzF/DMQT/yZhRVHsL5tXPc4+Nu96ZCDZ3gSQXH++trnT3kvR+Xm+wiF3kKfdPkQ+rafY
	 W+8TB2v/XMQB/oK+4YmTSCjWj+pSJ8IxrDDXGm+XheoKgReYqvfUQ232azw0YoV/Alw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576245;
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
	bh=yXD5NKFTgqQUEqojjLAf/+yCV14MNt7xdcGSmlMm4AQ=;
	b=JpoFkBSoRM1OMpuZAizrYMUpQbwzW8sLL7Qkh6ux6actIgADSjJ4Le2/L1ytL+pbVAst
	 mJvf2j4xTsdisx5ovDSAWrvYgh6exm40EVGUC/3QyvIpNeETkTX91E1hzp//Vu+56DgZK
	 LcbmNbtYUazE1o5mQXKTYlllAQOY0g6LomHi0xRUy2a5zPSUCfkGhXIxQGowtuzQgcuXw
	 tndPkeKHVEej1BLDOOB0XKPMkiXEihCZ/VXY9eANGS5I+yF/uJsEFv+Q2nmnNFVmcV/lE
	 DFBnEz2nItcwOD85+No9WMPp5sB/WEwOM/GY/PvfGL9EALfk602bvrz9dBeOQ+XKr8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=axis.com;
	spf=pass smtp.mailfrom=axis.com;
	dkim=pass header.d=axis.com header.i=@axis.com header.a=rsa-sha256 header.s=selector1 header.b=TGtgJ6z9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.10
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013010.outbound.protection.outlook.com [40.107.162.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE065606A31A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Oct 2026 09:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE065606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256 header.s=selector1 header.b=TGtgJ6z9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pLkSiFFtg2QlgEw19M0DqGq2qDbmPek2t0qV5x5HMhiErVAaXyZ8pI4l3VNYdjK07DaCV1IyRj/ZAsY9D2P7mP1pesPxmX/xeyGZzBIi7OphPIKadpPC0TNlGZQkjv19QlVhinunVD1gGPI7vIFmK4MfcZdEBcwMmaQxsej49FG8tRX5mjm2CUW/orVjFW0lj120Ab4II3G47U63VU2XpdFVmEu92lHpcKfmjNnWcrGZ268UnuGx1ZzJt9yflKG5qL6/w1cYo4YVb7THN6cAWg49mho2ttsVxT3FsRwDAIuMUaTfbYwTLUqlYtCgFW4KpUtGpaTWwRdyDQFtZevvMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXD5NKFTgqQUEqojjLAf/+yCV14MNt7xdcGSmlMm4AQ=;
 b=rs6T1bAyNqI+KOn2L7Iy//MfOFFyM4Ar2hYX0ZvXT/fZ2iQue+n84N1Yn1Mx3HJexiXCVmfD1rzJIn34eEKn13fmJr1qOZkuNfVy9V0YjhLu2/fm++pTFDSW3MtHRVjgUkH0KP9CqW87Vs+JdpmnTcG5t04HSN86Ksbsxz3j/0x+ugdUXOk95FCbLL9DQYCkBKOLqbcw2tnlAgC79N5Mn41mSIbvvC3ikseUH8nW4/vSDleraZGUgxpRLWPqWc7QLKOJj5qDp7yT686/T4vs1mzg1jVTNlEUE/qegUkGux6WwiDTu+Q6A+IbwIV74SWGL+si9rrjK3QmHraFkXs2bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lwn.net smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXD5NKFTgqQUEqojjLAf/+yCV14MNt7xdcGSmlMm4AQ=;
 b=TGtgJ6z9gO9vmDNCnz4rZhDQJTbDE8ZOXMC5mJASGJoK2ScB3aoQLuwZ80oF0PlOEk8/8EwLe5WFkQ2eASziosSovWGoQ+cufbWBA9+OaZ4Y49pd7YfLN1YNKhjioz5I28sRsBTr8oSOJe2cpVhSOmOPtOFO0B67eTWn5Z7tP80=
Received: from PAZP264CA0108.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fb::23)
 by DU4PR02MB11004.eurprd02.prod.outlook.com (2603:10a6:10:593::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 09:50:40 +0000
Received: from MI3PEPF00008556.eurprd05.prod.outlook.com
 (2603:10a6:102:1fb:cafe::1f) by PAZP264CA0108.outlook.office365.com
 (2603:10a6:102:1fb::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Wed,
 21 Oct 2026 09:50:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MI3PEPF00008556.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 09:50:36 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 21 Oct
 2026 11:50:35 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Randy Dunlap <rdunlap@infradead.org>
CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, kernel test robot
	<lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, Sebastian Reichel
	<sebastian.reichel@collabora.com>, <linux-doc@vger.kernel.org>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [linux-next:master 3622/16987] htmldocs:
 Documentation/ABI/testing/sysfs-class-power-rt9467:1: WARNING: Inline
 emphasis start-string without end-string. [docutils]
In-Reply-To: <16d0bddf-cca3-4ef7-ad68-4017ae275e80@infradead.org>
References: <202610151025.1g5IgCv2-lkp@intel.com>
	<a9c10b54-be65-4448-8d1d-fde894336484@infradead.org>
	<20261020101625.01874245@foz.lan>
	<16d0bddf-cca3-4ef7-ad68-4017ae275e80@infradead.org>
Date: Wed, 21 Oct 2026 11:50:35 +0200
Message-ID: <pnd4iefjsb8.a.out@axis.com>
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
X-MS-TrafficTypeDiagnostic: MI3PEPF00008556:EE_|DU4PR02MB11004:EE_
X-MS-Office365-Filtering-Correlation-Id: c8d6ebee-586e-4132-8cf5-08df2f58c1c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|376014|82310400026|261009223027099003|10067099003|56012099006|22082099003|18002099003|13003099007|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	M0Lp9Qasw4WhhOLpocsnMkT6zxnBvYVthupbYuot2zWZwi7cJXk2Y5rZXBVzF6/GFFrsRB1bXzcnggAgJ1O+ffUMIgPmWyJheasNU6vTu/GFknhFukMCPyCuk8YuybFtl14zGcMMPhS3KvyTHTciuJfrg6RUhL4aQ4eHo2DZjjJWR1jYgU6Z6XEVgQzwDcBBRMzC84tQdoCsRujkOILy+EUQbZwGN7L/cKGstxir8moJlM8ud1eaSsVOuRGl+VYuC7/899gnjaHKLeNPwMQTpVgJf5rSHBHsDdvL1pIruKtTpwyy+jyd4ZaGpKEwKEQIOuNLi+ptSvvKX4mWOO3npqbNkPRL7FCayZ1COij0zT/FtQnvvFBKQdQIY21jWfAyu88vBDnUnXam/ufP5t8vrQChQCtPldF/BFGQxfNHAqgNRfJdWiQ+lNq/79RzgGjC3Ik8TR25XZ5nDeocav9FI0DsDI9ss5VtfbX+dXeN+saFyUMMX9WKHfJMR4uAHVfHO/YguGq1kPf+4rjBvpANGTPZNjCyVTZtNw9RnIIOrtJeTkyc9CRCVmaP4W6bBk4CIgjeBgggeAxL7wJVd4T6ylnJ8hIo4ZtTCwoUh+rPq/FVgN4njm4gvt7D0XiP1l+Mw0t0WA5Z5bn8d2qOG0zmIZZXESiQPY+EceGMQARhPxo=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(376014)(82310400026)(261009223027099003)(10067099003)(56012099006)(22082099003)(18002099003)(13003099007)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XRdVIh9UAaNX0kJ8N7xtE8c6tDW13BRDc/AYwg3k64rIqn3vV4DWG6Cw5XgXuPe3sXxR0veNmBXXOJhj1GxBkOO8Mn3zwbSj7OOD+FZxrOX8ChH2oPIzmYCwzfe3E3vZaIrd8jgnFYtklZUhGmCU8iwbaai1vm2lYmOe2FBpsVXw7u7QyCI3Ks6OiZVbS+1YU1of3cN3E3GvBr39oGdNKlASMRCQB8pJTR388UISyW4hrP0oXjavpbFmUE1D+VfyWf2PRHIBd/+J5cEnPvFeHnrFrycp7SJ4mlaOnESWUtT8ezo1aisR1baKm6TMYCwBky5xW5HL5N4cSJo0lXut6cCmLDzYODLuAiYIZePiJHwzME1hBT7lOv8ii+68B4c4W9fBQEeeZB7IirjkhvLlXYnLbrSXnSmfYeu3CnTMiiBz0uRxJA01sZlX2GTmmKsx
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 09:50:36.3797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d6ebee-586e-4132-8cf5-08df2f58c1c5
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008556.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR02MB11004

On Tue, Oct 20, 2026 at 19:22 -0700 Randy Dunlap <rdunlap@infradead.org> wrote:

[...]

> Thanks for your informative help.
>
> Waqar, do you want to update these 2 files for the 2 issues that Mauro
> pointed out?  or I can do it...

I was waiting for Sebastian on the other thread [1]. But as I answered
there, I'll just send the patch instead. Please stand by!

[1] https://lore.kernel.org/linux-doc/pndse3cp5s6.a.out@axis.com/
