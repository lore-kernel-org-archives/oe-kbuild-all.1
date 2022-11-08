Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901A38F78
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Nov 2022 11:56:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/2NKCBAV/97kz4S6EjFTLXBOe0JBK+7lSZKXhSk20cYJOcDnCZPyVtRika93jZPs3orZnvF3jGTdZmPKtqaivMvVX0L8p1tdhUX5mh9aQFq9wQWO3COyLBqxv/Kn5haIBxiIsWxy6Di8eH9+jl+JVVbySpCNbZWobm48oPp/9v8dydO2J7FO6x1XdOI7RR/eQtaqy6S1JZu5tX1uI4WkN5M41wVyEeIu4srWspCjfKxxGwQyQwjOmm/7cRC3gHkCnZ3mBd3hcQi9k1iQnja+pFfgbrZ4NRg5xUFbIDOR6Ay9ux0JGvtxN45H1dRCna2N3tpxvUDnHy+KbGZOz9QCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a48eUTjTnttI4W5htehaDmQZgkqN9DwYAISkEPOYG8c=;
 b=PAgquNEkyBJXd3vdnkPQ0Y7OwjHnbFhaHdCklcz4RbB003sT4ZYx2rCZqg+OUvNy62kaGOoekp5Z+FqVvX86e35kZvNcq9Z/uqC2VrqeVfrtqtO9mRZU3KYKyYKdibk2NE//ElSH4bd38Clu0UOgLJtbv7CykFTWINDFN3QdLtuMh1vY4sR1u45XXaNe/8Seu7/uUlBV0PqVVES+IQg7XLIavTyY1n5OrRZdiL2V0uNvxh1VE/IwzL1L4hKXSnVc+I8cuXd42HyrPXZ3K6lhzhLFxEUztGguFYgtdfM5crS2G6RSSMw0qLSzQMMECa6BV6bK4TZpmKZ9/a2cfQRY0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a48eUTjTnttI4W5htehaDmQZgkqN9DwYAISkEPOYG8c=;
 b=GYfQfWTOsc0RrBsuBYjeatkL4x4ZVa4a65Umll4BTLSSyKiEoS3b7ypCFzZ5y8HU/zaLhvfAv1KXOl1tNMfArQOzUT2EWJMG98eI59nW4mXLR8pBuWj67ilDArM5iL8O5NkFEZfSFbmj6grVmhogvkRHNUYW414Cjy/N9zn8LUBWAw5j+iSVDfbHpn54T3nRcfSjC50Q2qhFYZ17Z6TyE/912t15xxSwrZ5mWsAF++zglnXKk7USkxKfpkWLCIpY08oO82b3guvCvahfl+wo+J00UzA/OLlfrB9HYpN6eufIIoILoYXGmTlB7sEMoikuLvqvhEnODgdcSe4/fSpO3g==
Received: from MW4PR04CA0222.namprd04.prod.outlook.com (2603:10b6:303:87::17)
 by LV2PR12MB5798.namprd12.prod.outlook.com (2603:10b6:408:17a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Tue, 8 Nov
 2022 11:56:56 +0000
Received: from CO1NAM11FT114.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::39) by MW4PR04CA0222.outlook.office365.com
 (2603:10b6:303:87::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26 via Frontend
 Transport; Tue, 8 Nov 2022 11:56:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1NAM11FT114.mail.protection.outlook.com (10.13.174.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Tue, 8 Nov 2022 11:56:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Tue, 8 Nov 2022
 03:56:41 -0800
Received: from yaviefel (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 8 Nov 2022
 03:56:40 -0800
References: <202211072213.KSrsyiuE-lkp@intel.com>
 <87y1smpwe0.fsf@nvidia.com> <Y2luYj9zmLDuiTnl@DEN-LT-70577>
User-agent: mu4e 1.6.6; emacs 28.1
From: Petr Machata <petrm@nvidia.com>
To: <Daniel.Machon@microchip.com>
CC: <petrm@nvidia.com>, <oe-kbuild-all@lists.linux.dev>, <linux-mm@kvack.org>,
	<pabeni@redhat.com>
Subject: Re: [linux-next:master 4744/6155] net/dcb/dcbnl.c:1230:1: warning:
 the frame size of 1244 bytes is larger than 1024 bytes
Date: Tue, 8 Nov 2022 12:49:19 +0100
In-Reply-To: <Y2luYj9zmLDuiTnl@DEN-LT-70577>
Message-ID: <87cz9xpslm.fsf@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT114:EE_|LV2PR12MB5798:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a658955-bdd1-42c0-1cff-08dac1805579
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/pUzd0hcYv8B2tAYactpspO5gCobBoass1EEHolj+KIhyBPCPYi/vGqZzfQCNksYc+Ote+KjrvcH5Sma28NLhq3gHrVYfF3QIkiW7uZw36j9553IBkMdOPmFniC72Hbc/ZdoQxkrXE4t7Ag3L6y1vTFvXFhlRKIuLqHEAamimlPIAkS9Gz3Nn6jhqUeQBiR4S1SDl/xwvWGrou3qU0dQ3BUVvTYy4bmRwC/JtShJdwdSop8Of8OSi6I/Udxw2lQi7Fx8aYfhL3QfheVw+stFZRG1e4z8+90JBtEyjIzjQ1OBF8yOquP7O2/SAQ9YsSDHC+7KoTaQYd0wMty/ijXCeBWbSsoNr6yTUR6SFNISSUVRqllqc92ms14p/kpkKnM3kxzpmW6PURxhUjXIsdFfsHd6sUiaCg9v581RYrwrw8vhC94ZrWH8Oa3pPushsagMCdSiRccrjSJHj0C+z/bOG+6D+UEgztoW/P5Wh/DjV/Qm0Im/hBYFzQghJVMNrzg2uZcQAsmvEljdvD6n76+YkTvcjAriAkI3z5/MAvj1v+PHCMoSwnYZ057gV6e9lXIsHC8HNe51yKoF/act2FqnL8p2550rvCklK/pTVzKGV1uXfD1zmtvsge06IXscHyNZDJd1L2NFh3DvePeVZYfSAWQuLtGSc2UUfM5cNBlBlwr5qfGnoBw83tn3G0i9bpDB5vdH8Zd4nFOinGVrMkyKLPTpjamoSHuGuIMbpyKxblpCf/TT0AjXGUgQdh12asL+ANaXtfgPPrSpWQ800HYWtith0E7Ui1KViLJmTTUDKjNA4il/IWvfBG8ApOzV8834wPNRPe0zW0R7MOHrHuim+IdrzMsdhokOljx5xomJPW377051ipoTncFxjz3F0y4MbU2r7kDJeBH/KIFTGBVDmA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199015)(36840700001)(40470700004)(46966006)(186003)(336012)(16526019)(6666004)(26005)(2616005)(36860700001)(426003)(83380400001)(47076005)(40460700003)(2906002)(6916009)(40480700001)(54906003)(478600001)(8936002)(41300700001)(5660300002)(82310400005)(4326008)(966005)(70586007)(70206006)(316002)(8676002)(36756003)(356005)(82740400003)(7636003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 11:56:55.8759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a658955-bdd1-42c0-1cff-08dac1805579
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT114.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5798


<Daniel.Machon@microchip.com> writes:

>> kernel test robot <lkp@intel.com> writes:
>> 
>> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> > head:   d8e87774068af213ab5b058b1b114dc397b577aa
>> > commit: 6182d5875c330a5a611687caa05f47752455720c [4744/6155] net: dcb: add new apptrust attribute
>> > config: i386-buildonly-randconfig-r006-20221107
>> > compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
>> > reproduce (this is a W=1 build):
>> >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6182d5875c330a5a611687caa05f47752455720c
>> >         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>> >         git fetch --no-tags linux-next master
>> >         git checkout 6182d5875c330a5a611687caa05f47752455720c
>> >         # save the config file
>> >         mkdir build_dir && cp config build_dir/.config
>> >         make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/dcb/
>> >
>> > If you fix the issue, kindly add following tag where applicable
>> > | Reported-by: kernel test robot <lkp@intel.com>
>> >
>> > All warnings (new ones prefixed by >>):
>> >
>> >    net/dcb/dcbnl.c: In function 'dcbnl_ieee_fill':
>> >>> net/dcb/dcbnl.c:1230:1: warning: the frame size of 1244 bytes is larger than 1024 bytes [-Wframe-larger-than=]
>> 
>> The on-stack array that was added is pushing things:
>> 
>> > 6182d5875c330a Daniel Machon   2022-11-01  1170       if (ops->dcbnl_getapptrust) {
>> > 6182d5875c330a Daniel Machon   2022-11-01  1171               u8 selectors[IEEE_8021QAZ_APP_SEL_MAX + 1] = {0};
>> > 6182d5875c330a Daniel Machon   2022-11-01  1172               int nselectors, i;
>> > 6182d5875c330a Daniel Machon   2022-11-01  1173
>> > 6182d5875c330a Daniel Machon   2022-11-01  1174               apptrust = nla_nest_start(skb, DCB_ATTR_DCB_APP_TRUST_TABLE);
>> > 6182d5875c330a Daniel Machon   2022-11-01  1175               if (!apptrust)
>> > 6182d5875c330a Daniel Machon   2022-11-01  1176                       return -EMSGSIZE;
>> > 6182d5875c330a Daniel Machon   2022-11-01  1177
>> > 6182d5875c330a Daniel Machon   2022-11-01  1178               err = ops->dcbnl_getapptrust(netdev, selectors, &nselectors);
>> > 6182d5875c330a Daniel Machon   2022-11-01  1179               if (!err) {
>> > 6182d5875c330a Daniel Machon   2022-11-01  1180                       for (i = 0; i < nselectors; i++) {
>> > 6182d5875c330a Daniel Machon   2022-11-01  1181                               enum ieee_attrs_app type =
>> > 6182d5875c330a Daniel Machon   2022-11-01  1182                                       dcbnl_app_attr_type_get(selectors[i]);
>> > 6182d5875c330a Daniel Machon   2022-11-01  1183                               err = nla_put_u8(skb, type, selectors[i]);
>> > 6182d5875c330a Daniel Machon   2022-11-01  1184                               if (err) {
>> > 6182d5875c330a Daniel Machon   2022-11-01  1185                                       nla_nest_cancel(skb, apptrust);
>> > 6182d5875c330a Daniel Machon   2022-11-01  1186                                       return err;
>> > 6182d5875c330a Daniel Machon   2022-11-01  1187                               }
>> > 6182d5875c330a Daniel Machon   2022-11-01  1188                       }
>> > 6182d5875c330a Daniel Machon   2022-11-01  1189               }
>> > 6182d5875c330a Daniel Machon   2022-11-01  1190
>> > 6182d5875c330a Daniel Machon   2022-11-01  1191               nla_nest_end(skb, apptrust);
>> > 6182d5875c330a Daniel Machon   2022-11-01  1192       }
>> 
>> I think this should either be converted to dynamic allocation, or the
>> array size should be reduced to number of unique selectors, instead of
>> the value of the highest selector.
>
> Yep. Dynamic allocation sounds good to me. Alternatively, could we move
> the getapptrust part to a separate noinline function?

I think the reasoning behind the warning is that functions with large
frames consume too much stack space, which is scarce in kernel. Moving
the logic to a separate function might silence the warning, but wouldn't
make the issue go away.

Extracting the logic to a separate function might still make sense,
because it's going to make it easier to manage the dynamic allocation,
but is not enough on its own.
