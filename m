Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011025.outbound.protection.outlook.com [52.101.52.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED73C3BF692
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jun 2026 05:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780982887; cv=fail; b=rOVOJIGNJKinQP+1kEzbUOisW/bE+A15jp8g4N/XNT2rKEAZrrrigDcDCQ3OQezO6WipakCLWLwzk5hP2Ytf1zDUvffgC6sRDJRKXXS54egVs08ZDVoC/DhuoUgbdQhk6mXYkwsPtmkEfcN5d3MQk0RmP8B1HtNkoBZpOuN7Gsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780982887; c=relaxed/simple;
	bh=8Rk4Vc/6l7yWgCK1/a2na3+QacGCKPZXG+R7GAPlU5w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NoJemk217qcaF2uv6wBXTUn9lHO7tgfwtwWTipjL3GIfyS+ZRISC333/nRw+Kjrn+h60gt+1KcWcUyK7t134KqgknRaYnWmsyztLDxdbMQrLV0oYzTlofehwnG/ZBbxdeO3qm/2H1ekpA9diM0tOjytl2tB1DXzL9ed32lRJnCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YXiiJaYf; arc=fail smtp.client-ip=52.101.52.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YXiiJaYf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TwKEM0odjEt6NOXctqkYnEqtza0kpl56IfohCK8ugcjWYolTG+H55gvtcqBpavAdY2ZhPlkhelz3jAckSpmJDSi7NIa7NOp4VoglCHLr+7UrVn0UssEX0jvR135efhHV17B7Q+EGYfke7AtYy8FKh3yRktTEjjxg7P+20Dq6BcvjiQQ8oWO0apd5+iPzr2d8cgdP0TOSvgP7iwcbjlyJ0hS9zBKlFZ76lRO73fUGtLfaYd38zI0W39wcduZsRJiFj/n9Q97EiUYT4dVsPuk9EnH//+7b1WV9QjuZmgHQeVERaFa38Be0mRWBzaVwSzoq6kjMXbcd+TrsRA40PJgQZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIkk2+2SvrOLCV/vyxOmCsU+9IffW8EHdHrejIr7tLA=;
 b=qMd+oGfynuVTBd0mgoOfGaIuXdPDaZ8tbfDnaQ2foSLW+quQgp6xcsPYFIHSV3lIlndKqihl/5uVPFOGlXH5lwcajWMPd+ynLr24t69HMGew4s/FiEP2wqF5e7Elrkl2w+Amf41e/FgZdLPjdqVUHKsDgsPMe1cUU417S1pZG1/sH7JhwbSOsg01jAghH76i5AF4Bdp267i2XhbB1pZuA99jbHfmupX4zg4T6MHTDz01PfXpapyEZqFtYaIrXySdMVaeyGA0jZtlvjB+oe6+uwRRZFyrV3KmgOoaV1BHvQKCiejh/MYGSLbcgM/NV/VEcjMV7qLxFZQFle3WM97BQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIkk2+2SvrOLCV/vyxOmCsU+9IffW8EHdHrejIr7tLA=;
 b=YXiiJaYf1WNeCMXKWzCEMsx9L8PBqPU4fiBh0UKI4FGKT59bLOrZSWoQFql7I1lZT5zGV7Ojd1XvK2smGPUD9//c87ZQ7VivEFUN34pZIi7BmWzx1TO2R9HgoAOrsUqNF+lmEXedpZgaof0t+K0wiQRMybYJLdNVw5lYBDBVdXaQMbS+rGIInAxdgqtBbo/DoPu88bX13eMSg687SHxr2AACHQvqhsyfeSp2F9zGqjKOLAfNsBBe+XmrbQkOO12pYC6Qgtm47q77R6YTFYxWR/9y2vDSoTPrNEjPwdrj9u3rNZNMk5bJa78c93FDSpOCP3mSagKmYG714S9HPEUEJA==
Received: from BY1P220CA0045.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::14)
 by MN2PR12MB4191.namprd12.prod.outlook.com (2603:10b6:208:1d3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 05:28:00 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:59e:cafe::4a) by BY1P220CA0045.outlook.office365.com
 (2603:10b6:a03:59e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.14 via Frontend Transport; Tue, 9
 Jun 2026 05:28:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 05:28:00 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Jun
 2026 22:27:52 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 8 Jun 2026 22:27:51 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 8 Jun 2026 22:27:49 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <lkp@intel.com>, <thierry.reding@kernel.org>
CC: <akhilrajeev@nvidia.com>, <jonathanh@nvidia.com>,
	<oe-kbuild-all@lists.linux.dev>, <vkoul@kernel.org>
Subject: [linux-next:master 10559/12096] arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: dma-controller@8400000 (nvidia,tegra264-gpcdma): compatible: 'oneOf' conditional failed, one must be fixed:
Date: Tue, 9 Jun 2026 05:27:48 +0000
Message-ID: <20260609052748.1734763-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <202606090602.UHcNu9dL-lkp@intel.com>
References: <202606090602.UHcNu9dL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|MN2PR12MB4191:EE_
X-MS-Office365-Filtering-Correlation-Id: b7eaa344-963e-43ec-41c8-08dec5e7df1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|13003099007|18002099003|22082099003|3023799007|56012099006|11063799006|220923002;
X-Microsoft-Antispam-Message-Info:
	3z6yOFO2KFpICBFd8uXaxR03v2MTMxt6kz3D0X4oRTh2qRk6s+LidAv76l3gRVC/g/YxGx4rIj4WzzqEbKEC1ComlJrHhchK3FIsmwQHN4uQZ/g0WhqJMGjbScBv4NG01/zXHKPLMRiLkiSUZw7lVus3KipvB89cpFcO4YeD1nql3ZnNndfilHsazwrp0ukI+Rwtwm/My/8KooRBdz8hWPPjGurE/AnDAk+VeaL7+uHb7+jyJUKhLiv2r6RhlIWvQl8ezZ4FuIaGaAm7yjGBsznUDRw6+ICin7MfCpZiUav98uN5Q+03ACRSg4NFAim2FTw1pbui2Koxo3zuzAA31J1krB6NxHDqEQnWpviVJ5gbDZr4lN/e2Htfz1v/0ss4Atmn5aH8KI+nD3yTA/ZxUpLsZcouxmW1KdBvhD8RL7rxpW1grmqlNtg27ON5dp6wdVSkIU5dy9a0AQqMwbQ+9uoTEYlS83xfyVGvgaiN1j79IZUa77bPkqsaYbOmiMOKM+Y/sA/eUaSgIhvpXNYqd4h04IBKs00XMf/Z9whPQ7GmwILAAg00KSJ0E8mUP5ARY0Xcy+QFxvnrkavP53kdVTLpGw65cMJ+8XIdHJqKDi60N9UWFnVe+19UxEVBLr6ImBFfZGp3GWhqgYtxTIw9hYSwQf1AEy15IOzSa0Q5Z0HyARM5rkwEkl3zg4Ige90hhx5uKqdyeOnDVJWKU86zJgTPBM2PRyQDQAzussdXbFQwXxxJy4dX5b3W9stGodJ+ysO+ViZhDPmRK3WTDNByTHkUtak5vtDl0nMd5lbyDMI=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(13003099007)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TS9X3f1gcKFRvsjElti5mJV6/U57gFdBiGfGQIVBQZiNIyYiyoJq+nVlQS7SaUCzxxm/ybMUk01K3p6Wx9qFKi4XxXZ/UeEsrjaGpTInnJ56fjRSy6ehuGF4nOmCEvoydY5SztzUgwjKL1KC8yYDG8LrS5tviHz4OtCJ3ctL3Kj1p6CxsnruLMDAR5DATWiFwauWrYBzidUiUEcBTz2hjTXvo52ACGR7DQK30SKp4Wch+nanrfAl7is89qUd1fwsTt6tJop/W476bVNkJNSlDw8oMOSzW3qRCaqY19ZP6w3aiyJqqfNx8kg9ZU+xUXCig7Mx9BtvSgNva/3t/UeL5/Gw5YW1l478AcO0QL16AdcOqZeqYt3VDFjxbjRaYnRuydS3QB4VPY+nzADK0LlwDQWCq7k0PfXprTZwO5gXPG1yqaBk262gK96EyqM/ZSIb
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 05:28:00.4047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7eaa344-963e-43ec-41c8-08dec5e7df1a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4191

Hi Thierry,

Could you merge the dts/dtsi changes from the below GPCDMA series to fix
the issue reported by testbot?
https://lore.kernel.org/dmaengine/20260331102303.33181-1-akhilrajeev@nvidia.com/T/#t

Best Regards,
Akhil

On Tue, 09 Jun 2026 06:45:24 +0200, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   a87737435cfa134f9cdcc696ba3080759d04cf72
> commit: cc6049bd3fa8501ee27042df469a19ed69cf406d [10559/12096] dt-bindings: dma: nvidia,tegra186-gpc-dma: Make reset optional
> config: arm64-randconfig-2051-20260608 (https://download.01.org/0day-ci/archive/20260609/202606090602.UHcNu9dL-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
> dtschema: 2026.5.dev9+gdf9ad30c5
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260609/202606090602.UHcNu9dL-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606090602.UHcNu9dL-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>    arch/arm64/boot/dts/nvidia/tegra264.dtsi:3557.15-3587.5: Warning (simple_bus_reg): /bus@8100000000/pci@c000000: simple-bus unit address format error, expected "d0b0000000"
>    arch/arm64/boot/dts/nvidia/tegra264.dtsi:3893.15-3923.5: Warning (simple_bus_reg): /bus@a800000000/pci@8400000: simple-bus unit address format error, expected "a8b0000000"
>    arch/arm64/boot/dts/nvidia/tegra264.dtsi:3925.15-3955.5: Warning (simple_bus_reg): /bus@a800000000/pci@8420000: simple-bus unit address format error, expected "b0b0000000"
>    arch/arm64/boot/dts/nvidia/tegra264.dtsi:3957.15-3987.5: Warning (simple_bus_reg): /bus@a800000000/pci@8440000: simple-bus unit address format error, expected "b8b0000000"
>    arch/arm64/boot/dts/nvidia/tegra264.dtsi:3989.15-4019.5: Warning (simple_bus_reg): /bus@a800000000/pci@8460000: simple-bus unit address format error, expected "c0b0000000"
>    arch/arm64/boot/dts/nvidia/tegra264.dtsi:4021.15-4051.5: Warning (simple_bus_reg): /bus@a800000000/pci@8480000: simple-bus unit address format error, expected "c8b0000000"
>>> arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: dma-controller@8400000 (nvidia,tegra264-gpcdma): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['nvidia,tegra264-gpcdma', 'nvidia,tegra186-gpcdma'] is too long
>    	'nvidia,tegra264-gpcdma' is not one of ['nvidia,tegra234-gpcdma', 'nvidia,tegra194-gpcdma']
>    	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra186-gpc-dma.yaml
> --
>    arch/arm64/boot/dts/nvidia/tegra264.dtsi:3557.15-3587.5: Warning (simple_bus_reg): /bus@8100000000/pci@c000000: simple-bus unit address format error, expected "d0b0000000"
>    arch/arm64/boot/dts/nvidia/tegra264.dtsi:3893.15-3923.5: Warning (simple_bus_reg): /bus@a800000000/pci@8400000: simple-bus unit address format error, expected "a8b0000000"
>    arch/arm64/boot/dts/nvidia/tegra264.dtsi:3925.15-3955.5: Warning (simple_bus_reg): /bus@a800000000/pci@8420000: simple-bus unit address format error, expected "b0b0000000"
>    arch/arm64/boot/dts/nvidia/tegra264.dtsi:3957.15-3987.5: Warning (simple_bus_reg): /bus@a800000000/pci@8440000: simple-bus unit address format error, expected "b8b0000000"
>    arch/arm64/boot/dts/nvidia/tegra264.dtsi:3989.15-4019.5: Warning (simple_bus_reg): /bus@a800000000/pci@8460000: simple-bus unit address format error, expected "c0b0000000"
>    arch/arm64/boot/dts/nvidia/tegra264.dtsi:4021.15-4051.5: Warning (simple_bus_reg): /bus@a800000000/pci@8480000: simple-bus unit address format error, expected "c8b0000000"
>>> arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834-0008.dtb: dma-controller@8400000 (nvidia,tegra264-gpcdma): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['nvidia,tegra264-gpcdma', 'nvidia,tegra186-gpcdma'] is too long
>    	'nvidia,tegra264-gpcdma' is not one of ['nvidia,tegra234-gpcdma', 'nvidia,tegra194-gpcdma']
>    	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra186-gpc-dma.yaml
