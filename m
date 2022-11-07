Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2084.outbound.protection.outlook.com [40.107.102.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF29D531
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Nov 2022 16:22:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRin3Z1ymPs3fUVnXYMQQVk7o2W0Ut44jmwjh0MKzmfHCKNiYpUxp6mOvjCk33NuSMpKzyLSvazKbKnKLWVMOrOTCZ679n7LpSEGsu1DVyKjS+U40WtebC4wzHW4cVgYaQGH0LL2QCKWjdvFnjuJ7jTA6TtqwRPXk/rB13+goI4sD1ZKfHlMGgfdekdB5xKFs/Nf6FuX7mnyMdRLmvrCIw6xF5wSjJ9mXQ8w6rvTL8fCfG+nvle5uSDSFrAKIbAvQxQ3RaTAuqlA3fGgmKETAi867LNidoOFpEyvTaDXhndNj3jodn+42izMnvddTUQM4lBzWTAYhP0Dh+dNB8401w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+A9j9OufnmQhRj+YmO9PafhSIKTgySVlKm9deHWOcg=;
 b=fzQ5FO5sSLu8wnF13EZ+fm+PtbzP939aPRq1oC/QvLOhYVf+bICjQUUuH99qcUh1FrrVdM4p7t0vbuUBCpkGocUeimKUZHxZCyzL0KdlyttmQ0MDk+bkvY9+2E9zUU7+HSXx03yU0Q6AiRVzsCqXmh6p7/kxM25u6wtZmZZHmkPfP3G+V9nyoZzsDyROOIFLZ7GVxpqsK1EioptIh33h2KWUNEP5j77BhQgMSWxIhZYUTfrqZ/uXl7m6i2WzC3aj8eOsc1H9Sw50K8+uLx2U6lINPJ9gX8PW72CoJFtwfex8m6dW5kUvVhbD3RR5Wbl5ORt9CX4T+7jWcFTr1nbP1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+A9j9OufnmQhRj+YmO9PafhSIKTgySVlKm9deHWOcg=;
 b=PPWN3IHQXKfm1OK5io23pWiYk+Dfuu56C3mJO30SgKqyo4m1rjG9kGGyorncuIZgSxtvLNPo2U28eqz8/pkyJJTVVETGWA++3bGob9y4Kw25Xhtgr6eVJss4tpRB+U2PWZFTQMhtPXWZOplz91E8jvToFQ25rSZbTDMCs0GhRvRjZWqhFL+A3yZoGoXr2CMO0WfJE5B+Q1FvzMvQVrBd4c4MzHPiq2FjVjRabZYcuWHzbYD5NmWSB+oSg7pboPI80dUO0ErWYloyNe7xcQPNpRDmuMiCdbKSV+7G90ASxfnXGKwL4WY2MjLLmtRdGlARwgSOHpDdfR59ATOiPfXtyw==
Received: from BN0PR04CA0048.namprd04.prod.outlook.com (2603:10b6:408:e8::23)
 by DM6PR12MB4436.namprd12.prod.outlook.com (2603:10b6:5:2a3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 16:22:50 +0000
Received: from BN8NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::fb) by BN0PR04CA0048.outlook.office365.com
 (2603:10b6:408:e8::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27 via Frontend
 Transport; Mon, 7 Nov 2022 16:22:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN8NAM11FT052.mail.protection.outlook.com (10.13.177.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Mon, 7 Nov 2022 16:22:49 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Mon, 7 Nov 2022
 08:22:35 -0800
Received: from yaviefel (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 7 Nov 2022
 08:22:34 -0800
References: <202211072213.KSrsyiuE-lkp@intel.com>
User-agent: mu4e 1.6.6; emacs 28.1
From: Petr Machata <petrm@nvidia.com>
To: Daniel Machon <daniel.machon@microchip.com>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [linux-next:master 4744/6155] net/dcb/dcbnl.c:1230:1: warning:
 the frame size of 1244 bytes is larger than 1024 bytes
Date: Mon, 7 Nov 2022 17:18:25 +0100
In-Reply-To: <202211072213.KSrsyiuE-lkp@intel.com>
Message-ID: <87y1smpwe0.fsf@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT052:EE_|DM6PR12MB4436:EE_
X-MS-Office365-Filtering-Correlation-Id: c14e2f37-7ed8-4692-89e0-08dac0dc5077
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z2cwuWI5a6cgYuFaWWFwRzQh9Umrrh029Mwdsb1piPioHXuW9aHw/aetHcINjLGYRP+XjQ+9Xf8yl6FveKOy6fkse63jtA3hJYNy2RiG6PJHNVLkNlO/QrDDhaZbSFF1odBAAPJKZE2dMMw3qoP8DHbuSbI3UQyYteRxz58rjMWe/Pkaw3noYKugi5QGLCvHynICwG5M0AnOH/sHi6U1hHEp8xzS/G0qhrkXaRlxGI5BO2ACTOjTxvB/xLW5jxZHECHo4Y0v8qHhv1+rT3FC2toKcmyKDt5cr0Jq7qAZ4i6jS6pJmTyyYzc6793Ak7JTGpLnhrnd4xG410ThQ1h3Mz3CJnKnSJduBlDNcuKclEWzf8mIPk3JaFLidsBfJDdkditVwT+UAFCZ68tVRt40/qqNuJxPoZ6shxuTkEVWegSKs8G87kAN6ylXYxSj+McMtmizOgI0v15JrcTdqn/Xk5gafq/bvfxA/QGZ0SGm19sAOrQYomPee7No3/4Mq0oaYIf7QwYD8U3n6KY8a2b0q9I0y90jBXI/TXpavzOo5t4OML/hRgmMncFDJyEzy9ZGazA0XhbsEZouYBD5sLYGXcRlTmSqz+P7qeqsUtx0gdjwf0cCQsntZZUy7ITCOVcinRL/afPyH1izXsrl2PH6nqcsPADRFCpcKyxp627zUODpxYJ/DJhJ+i+swxtsoq49TTvMVOs3uoIzpVb6ZDvNEf0JJsASFrHknXnMjQb9MbdMtYmFlvdAjk4EuE5RNnPf5ZgR0PjGZHalK7O7ZZoofueSdyRvvTcqmj/tTiYrdZBr0BKBVEM58nWQAW2gb7RORBytfQBdM1TQeFfv1SP+MqT3gJ7iyMQi2Pc6Zm/3/bkOf+Pi1DaEvxciey4r8QIGMFwjD6X3Z4dcELlz0TjWJA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199015)(36840700001)(46966006)(40470700004)(16526019)(426003)(336012)(186003)(47076005)(26005)(6666004)(2616005)(83380400001)(36860700001)(2906002)(40460700003)(40480700001)(478600001)(82310400005)(54906003)(6916009)(316002)(966005)(41300700001)(5660300002)(8936002)(70206006)(70586007)(4326008)(8676002)(36756003)(356005)(7636003)(82740400003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 16:22:49.9664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c14e2f37-7ed8-4692-89e0-08dac0dc5077
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4436


kernel test robot <lkp@intel.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   d8e87774068af213ab5b058b1b114dc397b577aa
> commit: 6182d5875c330a5a611687caa05f47752455720c [4744/6155] net: dcb: add new apptrust attribute
> config: i386-buildonly-randconfig-r006-20221107
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce (this is a W=1 build):
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6182d5875c330a5a611687caa05f47752455720c
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 6182d5875c330a5a611687caa05f47752455720c
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/dcb/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    net/dcb/dcbnl.c: In function 'dcbnl_ieee_fill':
>>> net/dcb/dcbnl.c:1230:1: warning: the frame size of 1244 bytes is larger than 1024 bytes [-Wframe-larger-than=]

The on-stack array that was added is pushing things:

> 6182d5875c330a Daniel Machon   2022-11-01  1170  	if (ops->dcbnl_getapptrust) {
> 6182d5875c330a Daniel Machon   2022-11-01  1171  		u8 selectors[IEEE_8021QAZ_APP_SEL_MAX + 1] = {0};
> 6182d5875c330a Daniel Machon   2022-11-01  1172  		int nselectors, i;
> 6182d5875c330a Daniel Machon   2022-11-01  1173  
> 6182d5875c330a Daniel Machon   2022-11-01  1174  		apptrust = nla_nest_start(skb, DCB_ATTR_DCB_APP_TRUST_TABLE);
> 6182d5875c330a Daniel Machon   2022-11-01  1175  		if (!apptrust)
> 6182d5875c330a Daniel Machon   2022-11-01  1176  			return -EMSGSIZE;
> 6182d5875c330a Daniel Machon   2022-11-01  1177  
> 6182d5875c330a Daniel Machon   2022-11-01  1178  		err = ops->dcbnl_getapptrust(netdev, selectors, &nselectors);
> 6182d5875c330a Daniel Machon   2022-11-01  1179  		if (!err) {
> 6182d5875c330a Daniel Machon   2022-11-01  1180  			for (i = 0; i < nselectors; i++) {
> 6182d5875c330a Daniel Machon   2022-11-01  1181  				enum ieee_attrs_app type =
> 6182d5875c330a Daniel Machon   2022-11-01  1182  					dcbnl_app_attr_type_get(selectors[i]);
> 6182d5875c330a Daniel Machon   2022-11-01  1183  				err = nla_put_u8(skb, type, selectors[i]);
> 6182d5875c330a Daniel Machon   2022-11-01  1184  				if (err) {
> 6182d5875c330a Daniel Machon   2022-11-01  1185  					nla_nest_cancel(skb, apptrust);
> 6182d5875c330a Daniel Machon   2022-11-01  1186  					return err;
> 6182d5875c330a Daniel Machon   2022-11-01  1187  				}
> 6182d5875c330a Daniel Machon   2022-11-01  1188  			}
> 6182d5875c330a Daniel Machon   2022-11-01  1189  		}
> 6182d5875c330a Daniel Machon   2022-11-01  1190  
> 6182d5875c330a Daniel Machon   2022-11-01  1191  		nla_nest_end(skb, apptrust);
> 6182d5875c330a Daniel Machon   2022-11-01  1192  	}

I think this should either be converted to dynamic allocation, or the
array size should be reduced to number of unique selectors, instead of
the value of the highest selector.
