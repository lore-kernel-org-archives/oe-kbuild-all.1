Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E99F7FF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 01:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693272782; x=1724808782;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=ovf1iOcwBCKoCpn5IVQimL4cnDjmR/nlH+yKBYgHysw=;
  b=BRS4ErL+VjL7yhtrsLuyuVQqD5tFvuZwv5minWWE69ak8R1sAw5b8gpx
   RfU9vdEis/MOZCXJA+jIuiF1DU6aSBUk5udu2OJMCdAXsNHTZFcl6Rh8c
   X2eFlvN21hoAcfMXEWqCtk+5y1MY0GlaEVUXWMYUWrOilAb2DzUjt9SZa
   jcJLiflP29Yi/Vg5a1D3QAQ+LePmiysJoNWm17UJru7RqXnYn3NCWu2Vx
   rm8+FiJHbakcGfTW4xiDQJj8BowEJdwzIYAZLJVWpbg4934E1ibHW9glX
   POL2/GRbgP1OedvKpOcBEn2CPfmYZoEjsuJpubCo4x+SXXpjEh+6Im6+L
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="372666171"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="372666171"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 18:33:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="773469277"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="773469277"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga001.jf.intel.com with ESMTP; 28 Aug 2023 18:32:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 28 Aug 2023 18:32:51 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 28 Aug 2023 18:32:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 28 Aug 2023 18:32:51 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 28 Aug 2023 18:32:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q4lbkzIKjpazcydyWYFliBifPIwDCb17RSjSOM8hS8GiSAY4xDa2sBVouPqaOxCg6hd1tm3YIsSffrhWmXze1MLqwPL8sOKsJaOOHk9Gv5zRUDM8NZ8uyrMAFz0vF3q/xuXTAvBeoZgYGocE/Jy9xgyuil5ool9r1vOyXed3tKo+wsXbcZCKg7NSkBJm4IjvcVOdvOLYB2/cV2a5ORSVfJuGY9tDH4lsT5Y1tE36+p/mp5KDBWrdBcBE3wzFr+9ibH1NXXPDytzBWFLAHRU3L5+EfVU7teLpJIPAsHufY8CrYfUBN28LbE+QLoERXw6rXOCPY+yTP/jutprglgO/yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ES8wSFOuq7SnNoQjJ6N0o+3570QqpOdcebOrwvxbpg=;
 b=C4yKZ4xQyHtEriqXaJtg1cmhfb9yKFjAiU9Ya3+SyMxo41sh2XbJ4gik6Labpm6L+StRZH48g/YGAlXRpaWXw5b3TOdKITfEE3okvB1N+nG730hlsV4erFvG4bITncuqFax5LVofatJSekzJ9DIcDeZfmrDtGpgKkG4OnXA3Yj8GO46BcRcj+hh48I/8OR2z2hPqXxiqQ+7d0iJSUv0FO/Nb4I5Yf/5k/OvAfC6Elzcq9bdMMQhdkOK+Apj4TwOEEob7HCTHb3eu8wy3rTk0uVkw945brq5jJNDXgtY8KJ8wc4HUguHoDV87kDMf1/SVLsxeHLzJJ+0JMUAW/iJZBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6397.namprd11.prod.outlook.com (2603:10b6:8:ca::12) by
 DS0PR11MB8231.namprd11.prod.outlook.com (2603:10b6:8:15c::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.34; Tue, 29 Aug 2023 01:32:49 +0000
Received: from DS0PR11MB6397.namprd11.prod.outlook.com
 ([fe80::ed83:aa52:335e:776c]) by DS0PR11MB6397.namprd11.prod.outlook.com
 ([fe80::ed83:aa52:335e:776c%5]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 01:32:48 +0000
Date: Tue, 29 Aug 2023 09:27:52 +0800
From: kernel test robot <yujie.liu@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [RFC] scmi: pinctrl: support i.MX9
Message-ID: <202308252347.LRqRzky5-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230824070611.3335107-1-peng.fan@oss.nxp.com>
X-ClientProxiedBy: SG2PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:3:18::31) To DS0PR11MB6397.namprd11.prod.outlook.com
 (2603:10b6:8:ca::12)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6397:EE_|DS0PR11MB8231:EE_
X-MS-Office365-Filtering-Correlation-Id: a81ac861-7e9e-4e52-c42f-08dba82fda1b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9whZmM42vFUGsyMbU0GBZ784W6bMTZz/2uqvmjqevvu8Jr+rv95UJRFAXpowJ6R1/q4D5s1GseZGCXrcvL68cEEZGmSP40zvMcgWWitogh0dacE22KgOmfu1mb0WJJwZ0/hGUZxHLHSXpvRnsxhckb1hVbm69HhSesi819mVsn/H6oL0gEy4Ki7LXm/trx8eMctCnhWulOAnRxtEBvlDsgfF5QMDb7DtLGMKckCjitbOwQ7i+Yxy/7tQSr1+gG/OcAIe3cPG3ZJFCfNUJfVeX07LZMdYB4D0UmYraecXwnoeadHu7ZjqnHlmhwSOhhz3TtTvEBSuv07b8y0EEPkdcpxeAcJyLtEZCtv/rZo7MqDpXY9zMR7fcltLI8QyV6gJjKCXfOtsmZX+SCD8CU4Fs8O3UNBibjdTQgobIa9PAre/dKPVvRT8b/XHmWjsAj6zWx7X8169kmjIWSax0Rm/Uk665ArmXT3xEBoCKjuj0ZlZTe760Y3xRIPJ/VUh31WWOO1IvVSsy93pGahLKJHvdlqBInrsaHjfNt55iTPLA9WLxxiflC3dArLXVDCiJG3ytv/rFpzbWhMxK+o6QT08pA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6397.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(376002)(346002)(39860400002)(186009)(451199024)(1800799009)(41300700001)(26005)(38100700002)(6666004)(86362001)(966005)(82960400001)(478600001)(83380400001)(2616005)(1076003)(6512007)(6486002)(6506007)(36756003)(2906002)(6916009)(66476007)(316002)(66556008)(66946007)(5660300002)(4326008)(8676002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HYO/Ra/wK1ftOdcT+6CfTG5MmjR20q/z/Qsx2T1EvtJqnBfjP7fIGy2ZNl0D?=
 =?us-ascii?Q?gevEcjlizLLMD123tJZ2bxVVtqp1cwWj1A9rE8qGQV7/Dd8dEt8wL6JeooRM?=
 =?us-ascii?Q?cYn1INZpQO6DZ/yEy4JFB7quxnYX1irOeE99syX/K2Oe96eP4bEJKspUKzPx?=
 =?us-ascii?Q?kK+nhNDlJ9JLJoTtpLKbcS6zhcLuAVPGiBNGjd7bSk11zLu8cZ7vjsWXfhe4?=
 =?us-ascii?Q?F4lIpbSOu7URw3CUdDUojjulwNlNniW0fhpQR3fWM4zg7jJEjmhTa+8AzIrN?=
 =?us-ascii?Q?YrfvGbaa26+stwPX9QpRfE4cm/179jHnyX/kPkKaO9yxH2LDDwzDBjAXdZoW?=
 =?us-ascii?Q?rzO/h40lMgxQSeu+uCHgx7tZMe5IkQL+r8Cy/M7wQ0QiyVTol2kqJxtc/PTE?=
 =?us-ascii?Q?cX+eINvI4FxrJmm06QJbb+bJOXZhjSuabkF+fvd1ex7AH/wEnBl5orcoyYLq?=
 =?us-ascii?Q?4M/aAlkNWAIyZrf5yB3Tz4paSWRtegfr+OdNw8Nnb3xvOny2YD7Zux0xHMNT?=
 =?us-ascii?Q?wFhXyA+k09sFd/n7UQ6mybWAtr8Z/qiDbc5JpZ5AXs6vZKs/KakJFP1SGYxF?=
 =?us-ascii?Q?/XTo+Duzx0zIuArq13w7hu20koDYEn6ADmsEp+RxCXQH5sC48pctp3J2W1aW?=
 =?us-ascii?Q?fhbW8O6mWOPNbrEpgUyJv631qM4YmK/EBdXESK2IWe+cRl0O3wl3WhOZq6f0?=
 =?us-ascii?Q?hJ474NtX4j2hqIDZe+LRt+OMMLK7R7tnYwF8nW0ZSAd6OBfgEpMAv21hmj4u?=
 =?us-ascii?Q?QjS3f6iC5Pc1fCXPEZ5JacpcOmhQjtOf5U7EWvyF0GD0Up/X2DHnOE8+tuN1?=
 =?us-ascii?Q?/Zp0qzj/dqrXwfQJaOQdNglAyWuYyQr7jw4/jrd6FqBbRYSVE73IirR751VY?=
 =?us-ascii?Q?yxSNMoQR7mzoX3NXS9soriPMQObglxrOTQAQLWadUUvN7xLZegVvi8JUf0rY?=
 =?us-ascii?Q?g7Y2yVZTJuI0nPGzmVl4cPWpdxDzBU91gyqGGo4T2vRn+8L7m6cMD/J7BlVq?=
 =?us-ascii?Q?57+VBDdASuANXLJ//jQgtYqtX+iPOv6XdAsSr7GbX8Zhqs4ZiBfOa6PuBtSK?=
 =?us-ascii?Q?wHZvTFGcoyNLNExrVlLGhNfkajL7k4WvGVdiHd+kaOmBenYDMyobsPdL/4Gr?=
 =?us-ascii?Q?CsSvpcUuk8SJYT6W2nnGC6e9Qb5BSb56cT6Mry5NvpMP2gyYz5gRr5MHm2dl?=
 =?us-ascii?Q?9fD93suKSvdrAueSO8cmhi8Qlg72f9FTkqdP0YgaSwHDgKZPmIGNYq4IpXDh?=
 =?us-ascii?Q?JWwrrWgXXNdc5zI1xxpIWsyHIopmO4l+0Yf8AeXM3+HoaQR3BQcYq+/GMc5w?=
 =?us-ascii?Q?is8nSJ8J6nDbzVW743LV1qQ3ZtM8vyMwyCaN5QxXgsjfCAV7BQhesS2Nqzoa?=
 =?us-ascii?Q?p+BiS+uwY5LrzcYJp6k7XJgz0Pq9f9vzBUiV5UhSvofRcfhxR6ovpbuJHEZ9?=
 =?us-ascii?Q?Z73EkIuEDlaSZe9tKCiGSr57Mytwu7e/6Bth4DLrcZu0MmugKtslYmJYZ3rY?=
 =?us-ascii?Q?QkRZY7FLRANdPmLFmhxyvbsr1tTwCqdeQ0XIo+bS615b4J2UhYDvB+No5U+T?=
 =?us-ascii?Q?bIivaCTzaHolBFWmi09xpsB1f83mf3/H2xSnvR39?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a81ac861-7e9e-4e52-c42f-08dba82fda1b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6397.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 01:32:48.4153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: koJdqcqtU+RAKNYWXytWMW0Slo5QFrrZ1rntUkyBTwdKLukThHX+FlJeirTu1xEmoKC4zM4Hifao1GUFAYTZ0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8231
X-OriginatorOrg: intel.com

Hi Peng,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next]
[cannot apply to linus/master v6.5-rc7 next-20230825]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan-OSS/scmi-pinctrl-support-i-MX9/20230824-150323
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20230824070611.3335107-1-peng.fan%40oss.nxp.com
patch subject: [RFC] scmi: pinctrl: support i.MX9
config: i386-buildonly-randconfig-002-20230825 (https://download.01.org/0day-ci/archive/20230825/202308252347.LRqRzky5-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308252347.LRqRzky5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308252347.LRqRzky5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/arm_scmi/pinctrl.c:308:6: warning: unused variable 'attributes' [-Wunused-variable]
           u32 attributes;
               ^
   1 warning generated.
--
>> drivers/pinctrl/freescale/pinctrl-imx.c:83:5: warning: no previous prototype for function 'imx_scmi_dt_node_to_map' [-Wmissing-prototypes]
   int imx_scmi_dt_node_to_map(struct pinctrl_dev *pctldev, struct device_node *np,
       ^
   drivers/pinctrl/freescale/pinctrl-imx.c:83:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int imx_scmi_dt_node_to_map(struct pinctrl_dev *pctldev, struct device_node *np,
   ^
   static 
   1 warning generated.


vim +/attributes +308 drivers/firmware/arm_scmi/pinctrl.c

3a61c44f60d18a Oleksii Moisieiev 2023-08-08  301  
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  302  static int scmi_pinctrl_config_get(const struct scmi_protocol_handle *ph,
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  303  				   u32 selector,
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  304  				   enum scmi_pinctrl_selector_type type,
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  305  				   u8 config_type, unsigned long *config_value)
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  306  {
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  307  	int ret;
3a61c44f60d18a Oleksii Moisieiev 2023-08-08 @308  	u32 attributes;
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  309  	struct scmi_xfer *t;
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  310  	struct scmi_msg_conf_get *tx;
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  311  
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  312  	if (!config_value || type == FUNCTION_TYPE)
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  313  		return -EINVAL;
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  314  
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  315  	ret = scmi_pinctrl_validate_id(ph, selector, type);
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  316  	if (ret)
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  317  		return ret;
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  318  
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  319  	ret = ph->xops->xfer_get_init(ph, PINCTRL_CONFIG_GET, sizeof(*tx), sizeof(__le32), &t);
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  320  	if (ret)
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  321  		return ret;
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  322  
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  323  	tx = t->tx.buf;
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  324  	tx->identifier = cpu_to_le32(selector);
1d613cbfa881b8 Peng Fan          2023-08-24  325  	/*
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  326  	attributes = FIELD_PREP(REG_TYPE_BITS, type) |
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  327  		FIELD_PREP(REG_CONFIG, config_type);
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  328  	tx->attributes = cpu_to_le32(attributes);
1d613cbfa881b8 Peng Fan          2023-08-24  329  	*/
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  330  
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  331  	ret = ph->xops->do_xfer(ph, t);
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  332  	if (!ret)
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  333  		*config_value = get_unaligned_le32(t->rx.buf);
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  334  
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  335  	ph->xops->xfer_put(ph, t);
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  336  	return ret;
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  337  }
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  338  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

