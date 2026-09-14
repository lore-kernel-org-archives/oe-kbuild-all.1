Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012006.outbound.protection.outlook.com [52.101.66.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7023440FD9B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Sep 2026 08:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376396; cv=fail; b=iULNXukdMnhVmvNwyIxf5hMkodNaDOq3yI/wtvj3n0dFZWz3a82pllXdWokcmtfUuAYsH/2KYqN4af32PXXU7XAJ7cdmIfjNWFsVztl0ZIHllqMQsjddTvyi+Ey3MnEASgXz8Zefe5Mv1+JtW0CLXKrHvkT/SMGepLT3K/+NUQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376396; c=relaxed/simple;
	bh=wRRIUeLJRXKraOX+mK6oghQs0GFm8FBu9CzJpb4Av0I=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JcPglmSsg9HpMIqb77xiSt1bHxNCr1AVf631gBfK6CFoja1eB9FkMpzoduN9OsGvpxgrzKNDHR/mqQ7vgOWC3nmuVbxbPFEjvbsgRZw5YEHbCQUwTcyEFGl38T80lkrE1/6wQl2jgyvycXxHZ54ycprlIYwXd3Sy5ZnlxlSFzwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=jvY239hg; arc=fail smtp.client-ip=52.101.66.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="jvY239hg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zUFTn2mXr2nQ0nQcnlFWPdVfcLn0wObxb0JNgPgsFSBumU+nV/JisfqwTMinDSYz6xLzc4C2Jek9b87oik75kbuFhAOBYCWhJ0ySpFX1PJW78N3N9QTB8XwHZqb0Kri4KQ+LKgofLwf30kwYNmx9S7mFuwoBrNvb7MDb3iYKm45KyOPkfxoJnuxovAIe5LwgTB31Wmz3KCzxQdh825GV2g8429YKJ2blPXpjddwYMFEvDe9fPBiUDTZzZcYpELJ7jgGQ057mhG4AbHjj7YZ6rWQApjyeMsfccx9+DCKLEZrnr4HIJ0luAE7q3Z9BOU+F0iJNU42OC2gprqRqfQkOMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/iDdzeBJfcAsznYRQ71w2Qjq/3hEZfVxkctx8ANXoI=;
 b=UHUv23L8U9j5mCsGs92rWWZxdyob0CF47IrfYMlLRH2WxSsXnl8exiKZK8kAyjVhLFUZLgXjGyawNnvlkwmpwr6eX9qHpWx7XjtiPjMYIOl22wilNqe1mp/j4IyXriQb5ZpX99HNACBEMa9Tyhz0OHDNlBziZckSCV2Ds/O8bEXU4c+E7/MYK5Vd/j0GbrNyjiDXKO0Sb/3CpbuimccxfhLbv2UWatz6/RWxYwJcKxjPA+IqyJ2PUDr0Fvlzeu2grFBRWEjDqd8bCRtXBHlNxEpv6TtYPXMh760UnjuvtDX1E6z8r0kBf+cZauME8TArqX+6Z/lAxQU0viOZcACQFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/iDdzeBJfcAsznYRQ71w2Qjq/3hEZfVxkctx8ANXoI=;
 b=jvY239hgtf9tJKufMJiLWbq7AH20gOqzDdh6BspG7lFvKFwuj8i6UIyyQ6XdPQjqe+qY9c05ZDk8TTxQDPGq87X7zwmIHejBoHE4SOHs/y5CjJfRygV0KFhJkIh/KF1sbmrPvnqov9IOTbNTHmYg87FtxintyulcXHcodGKhoSM=
Received: from ZR1PEPF000077DE.CHEP278.PROD.OUTLOOK.COM (2603:10a6:918::40b)
 by AMBPR02MB453737.eurprd02.prod.outlook.com (2603:10a6:20b:7b4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 08:59:44 +0000
Received: from MI3PEPF00008494.eurprd03.prod.outlook.com (2603:10a6:298:1::5b)
 by ZR1PEPF000077DE.outlook.office365.com (2603:10a6:918::40b) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11
 via Frontend Transport; Mon, 14 Sep 2026 08:59:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MI3PEPF00008494.mail.protection.outlook.com (10.167.240.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 08:59:43 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Mon, 14 Sep
 2026 10:59:43 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-doc@vger.kernel.org>
Subject: Re: [linux-next:master 5111/5916] htmldocs:
 Documentation/ABI/testing/sysfs-class-power-rt9471:1: WARNING: Inline
 emphasis start-string without end-string. [docutils]
In-Reply-To: <202609110722.GAZVme6v-lkp@intel.com>
References: <202609110722.GAZVme6v-lkp@intel.com>
User-Agent: a.out
Date: Mon, 14 Sep 2026 10:59:37 +0200
Message-ID: <pndse3cp5s6.a.out@axis.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg=pgp-sha512;
	protocol="application/pgp-signature"
X-ClientProxiedBy: se-mail10w.axis.com (10.20.40.10) To se-mail10w.axis.com
 (10.20.40.10)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008494:EE_|AMBPR02MB453737:EE_
X-MS-Office365-Filtering-Correlation-Id: 33c648c8-ae2a-41d6-2bd1-08df123e84f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|10067099003|22082099003|18002099003|56012099006|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info:
	ImBcN0s1pZrv9waeuZM3sDVF6Xf/fWVf1jXs7HyhHM0Wd+3galPV17r2bLfaCI58+Dv5RAzz3tvj0L0991hEkmkMCMgZarmYWUE4Mv4BbpP/t/gLVpMBOjhjF2JtRbR2JGOyZzGHs0gzxn5XbUva0wuq8rETwCCC9MskfLsyQ1Q43yZL+BonZpF2SccOqqfL4z8JcbQ6Vmiy/9nGZ1wZn5STZ1wsVONa120oiuRGvf45iGMY6ZIrsMlppf9PqUakiZpwcChPrXTtgXgxHn/r+DdsxcoJ6O+108WU4dJy2yC0vghG57KJB62lfpboRxFXGXlI7ZyJcGcMbU81k2kW4pDIAtWT9kQl/Ye//2CzCw1BPFR1iH7z1cpd0cm6iYSeGog0idrhP+6t2eEkX+v2iBcy2kLBCQcK1/b1sH9KKJKxyaBN9DbOVEfR3bnrgBrxXHlrwrEue11Paug6svhwb/xMobWTEBGzNUk15p/4mhTut/H4dJvxxZ+pB+90pl+OXTHNw3QPTMZH8ES/C875ir/UFFrZoUE4cIWuC/qI7WkPCOnArGV9aVb8DYxwFxsd/XZcw5TLPZhrZYOxJ/Ju9lDMBH8mWd+9EIeOq6WP4HjDczsfnXPDj3mXMRnxHx5FWeCrRICSw+iIgcCSYl9S9qbFHAd1ZWENK5V0p3tjRr8=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	z4+m6omZQfdVAHdSUSUSdnjcTuDPdiXFhq7QKgYo7J+88DMbdVNnBLtZVyQlshcGQFGMVuZG94Wpnb6V0mgwVvsQA3TCamy8/eVjAe9iwBSh1j/gvd27+DqJuj7yv3EW+9BFk2ET0T0BoZWFC4zzoj1JsTr89kR+2KU3AVtTeYhPwCahP+0dQ5j1kSv7vurfi87Isnndwjc8pHgQ2n/ckx/P6m+7ZPOWZSciH0p1wDxLR9LMotKM6RxAvMDjHrAhbhEV9xsBM2n14pJIyKaBvq6JipThzPEIaO1mSfai7QKTZHTImF4+yiLqpbCUkXfgHgCjVpctY2k+kZ7oEFJnkZttNDxBVBxERcmx9mxZKWbF7em42rhEWZ6bp2V7pgW19DZT6a9UGotHfPF8ZWlCyNiE1g3sf9cRrtO23B/cSpXIKBbPCcQyPug4QmJN0jBT
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 08:59:43.6919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c648c8-ae2a-41d6-2bd1-08df123e84f0
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008494.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR02MB453737

--=-=-=
Content-Type: text/plain

On Fri, Sep 11, 2026 at 07:40 +0200 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   f2bfbc3554ca6919484030729424b9dee2942d24
> commit: cb012fe405f0f487e9480472f3558e678556ed49 [5111/5916] power: supply: rt9471: Use POWER_SUPPLY_PROP_LOAD_SWITCH
> compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
> docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
> reproduce: (https://download.01.org/0day-ci/archive/20260911/202609110722.GAZVme6v-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609110722.GAZVme6v-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    Using alabaster theme
>    WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:234
>    WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
>    WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
>    WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261
>>> Documentation/ABI/testing/sysfs-class-power-rt9471:1: WARNING: Inline emphasis start-string without end-string. [docutils]

[...]

I actually saw this in when working in [1]. Since this was present in
many different files in `Documentation/ABI/testing/sysfs-class-power*`,
I just assumed this was known and therefore deliberately ignored. Is
that your view as well Sebastian? Otherwise, I can easily clean this up
and make it correct once for all...

[1] https://lore.kernel.org/lkml/cover.1788290289.git.waqar.hameed@axis.com/

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJKBAEBCgA0FiEEJ8UDrpF3Qa2EMzPqAqqYDPCo9PIFAmqnt3kWHHdhcWFyLmhh
bWVlZEBheGlzLmNvbQAKCRACqpgM8Kj08n4vD/9WzUDTWNZaw3nDqKfh6Xr6pplh
3K/h0SClceJlrueYDKg4p/pxOVTRm1ZCibxJiaIEp234ivRgDIN9y2j0XZXlmDW+
v3f8QqwqoKpGLO8Vh92zUJ+qaQoa0+ifWXHSKZYlCIq3Qr8S/jCR5TEDNqA3qmG1
RZUjQmLKymvUfz+Jlh1Pm7+3SeosxIN3MqQLG54PgZ5FQyl9wccBMXMohckee4nU
ad5xY+1vGPk7xYB6NCpNRTWs9/qbMcRR3/JcgMeCM5UCbQUV+WqfyKz/U17mXo8k
kro8FU66TRLQ7JpovrrKYPYDkEDFqmsMfQxzjd/UFD5mSgOJOoXZrBkhzzCJo6V6
P6t84WfMpghtq3ymFAr11R6Drg4MKS9a9nGYGxtz5sXK8gb9NM9t6rqm+Ovun+C/
UUo+BTakXWbxbdOxH8xZpfkHAh+C2u8BV7M7wx043VVXS5rA2rMQ0Q0h5LDjdZGo
+hJpUt5OeZJGT46/w29HWXWiwD0GQ33d+lJRlO+7uBS3g2/VeloaiN7udI5CTtlS
ZK0AmFJWgTIDG0kg7niBYc4fie8IlZ2jU013fL77MOFKzPWa4rFqzrLvPsNak+oS
rzcdUya6EW8iL+AhjqeVh57b5Lk/TYf79OJl6XSO0DerR8TKDOXkY8byVrvMrCA4
j1J7VG6x9TQrHqxTMg==
=3z85
-----END PGP SIGNATURE-----
--=-=-=--
