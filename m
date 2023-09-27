Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F941CA86
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 13:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695822121; x=1727358121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xgtW7/OthPuUgBSFUwuk8UjPiBQ9/pMKRQiqfOYJqU0=;
  b=Wqm5t6rm6VcEx7mVIjWpAk2H3mWeeANtcbDMuO2Z85Z7S4E87op7AvLW
   x/MrJzFsRR3lrjoPh5wBR5F1c+Jad7hyNNxChs+pV7UTqNszSXncsqEpr
   7AQu9CqesCiZS16xycvPCvinOQktLDtbVvxyjEgscp/LKYYi9HArui6u9
   H7leGloc6bcRtvpeWMDi1raBwElvP5AXk92QwfcUAzQcMgHxdVV48wj8H
   gKHjYjJN5ISrKnMQdqFOCDS+DINEvnRuPHADU17M3vUH8ps5FyZ9V65ma
   CHJi9McQhUn3REJ1H0irQGZzClQkHRiens6xGD6ePApfEOJkvHkUhFL3n
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="381728543"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="381728543"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 06:42:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="922781397"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="922781397"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Sep 2023 06:41:59 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 06:41:59 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 06:41:58 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 06:41:58 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 06:41:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kb93tY5HeYCGHJDhd+dCueX/F17mkB22RZ/kuyTL07jUqg2go93H+/1L9fU8QqdAUCdQRQ6hA4M5uz1xc846+cOjm8YpJcEOKAaZLw0wFs3FkcFAgV47WsAGGOrX3gMlqFUAg5r3m3EVgwcE1JevSrzR5i+2gHyOl1qTits+m2JyW9Qkvi/JxgGI10Pm5BM+CP7OGT+yZPfRbrZu3NGX5HTW9NN+N9A22P/TgGvG8GB2qfr0i519+QEV8TrFKTbpN8AKjLeNLDBqpa9JTVNzRaUkv8QQFZ2Dt9riO9Rcw+eb4ADaY5+ZHgUL6x+EU3YoE+pztQmB7v/gt16LLA7ECA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9c+HUvXPU9Y8MIqiYT8eaZC0HDeWt0YGlBozrgYD0Y=;
 b=NDc0+83wncnuTpPDb+1Pve18VojGY7ChxeLgBSix7zJ+hfYnVEirjvMF08veFq8YxCOClAB2pO2HjBSnWzpSMvHy5EdPmxqqMp3650dD2a/xKvSez+7idh75tg0w4unS/C494OqFGJRbPZpepn/Km9llzK9gl6Ze3IrBOOQqmsZnwL6t5df58dBqWbLjr15qTTZn3UB7HFtdOOFvcKVhutBk8pn9ZBAQ57flIiOrL0Eofquvy+pbTQgQ0ypPBKY2eNtCxMPyLMSeyIz6CAYHqSkTO3wgMdTXuMxPLK8gEaAuLs65z5yJg7j70tf8NqahKCB1rFEsFCegOSNrsAyw6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3006.namprd11.prod.outlook.com (2603:10b6:805:d1::24)
 by PH7PR11MB7988.namprd11.prod.outlook.com (2603:10b6:510:243::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 13:41:56 +0000
Received: from SN6PR11MB3006.namprd11.prod.outlook.com
 ([fe80::b2f6:ff19:be0b:362d]) by SN6PR11MB3006.namprd11.prod.outlook.com
 ([fe80::b2f6:ff19:be0b:362d%7]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 13:41:56 +0000
Date: Wed, 27 Sep 2023 21:41:44 +0800
From: kernel test robot <philip.li@intel.com>
To: Satya Priya <quic_c_skakit@quicinc.com>
CC: <oe-kbuild-all@lists.linux.dev>, Steev Klimaszewski <steev@kali.org>,
	Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh@kernel.org>, "Johan
 Hovold" <johan+linaro@kernel.org>, <linux-doc@vger.kernel.org>
Subject: [steev:lenovo-x13s-v6.6.0-rc2 27/71] dtbs_check:
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml:109:11: [error]
 string value is redundantly quoted with any quotes (quoted-strings)
Message-ID: <ZRQxGHUPL5nFwdpn@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0152.apcprd04.prod.outlook.com (2603:1096:4::14)
 To SN6PR11MB3006.namprd11.prod.outlook.com (2603:10b6:805:d1::24)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3006:EE_|PH7PR11MB7988:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c62d2c9-6a04-4a4b-9b58-08dbbf5f83c2
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uIOev8ronk2HFxXPbIHKy0tlSLpIC2D1bqusneQlnE1b9LvaSQLyhwems90D7ENf2p77H6U0f8pLFCMIJ9bSR2j1FviHPRo7+iRR0AljOgDjmtL6bfl5mKJ9MYQSjSgxBD0MfdZZWob5vxYcRIBMK7puLevV4TvQiLiP1YwlRdblq6hCn+4LHkARMLkMaSLpZAX5Nb74DrGn0Ckuk4OG9R1kOXI0e3neAXGjS0Er8mX4gQWdV/ca9S7tGYIEKcw27stOzZGNDE5SZxH/5inqBSpYZzWmvPmA88WSijncRzPtuYvmDWoRiH3QIWuPPDHYP8bPe3DGIlMGyUHfpjny9TMFFYuL3E6lEN2X4D4UXgTKbm8i+0XmFCl2oilnqJBKHux45LlFJ+8TvwEqO73Ecx+PX/CEm6yXCqDUtLBhX/4zORxTDOF7/BdDHSBc1fKpU1/7RYMTNWVub319ei6crWk7JYPmHsYUZnDJII9jl7L0On0r8oILmsKpyB4R4ysbpdUV7Hu1gW/41lIyA2LUxiLk8ID9yF/p1yvubsOeEKW9GHHXx2W/traVWfCdsCCHBrzXBZwpUAvDgQs06Ji0Lw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(366004)(346002)(376002)(39860400002)(136003)(230922051799003)(1800799009)(186009)(451199024)(2906002)(5660300002)(66946007)(66476007)(66556008)(54906003)(478600001)(966005)(6666004)(33716001)(6512007)(9686003)(26005)(6486002)(6506007)(316002)(6916009)(8676002)(8936002)(41300700001)(4326008)(83380400001)(82960400001)(86362001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wmRgiux1kuvjeyT7VPagG8xJ3RXZ0AsBnR7C4Ha6vr01OMdYmG0aABHzrEgV?=
 =?us-ascii?Q?elz+E/clHcv9Dr7Muwh263HODhevNTxjvOm4Ges/TZOsG4CMR0buJlZh3miV?=
 =?us-ascii?Q?mlNe2ntfeUgFu94WJJe15SMLRFQhKx60fYw2s0PFLHSCKZWJyDvlhv/zCfKy?=
 =?us-ascii?Q?zNTlSa4ggm/9qmmnIIS+egZQqQ/0KcFQBubBILCaM5bRWNBIKCIfFfLPeEzN?=
 =?us-ascii?Q?av2lfi5PPSPDQ5ywAZpzr8iH51vTlx+NH9UMJVLBEPADGLuKPxDAcVBo7qXg?=
 =?us-ascii?Q?U2378PXBMMJNaZoLlTU0cBvfaBClMTtNumFiugBEOihsK+d82YbF6Jq5ODXr?=
 =?us-ascii?Q?3eGVJT6jK7I3LvpinPThq04EORcL284lLa34b+oSWK5ZrmFEOQPoTw6SopOP?=
 =?us-ascii?Q?4yINvG/sh+ZTyEFmoTTCLO7+AJRSCK56opjZWNBz5jIPo8GeejTKYzSUUjVw?=
 =?us-ascii?Q?OFjAUtCCkkmIZoJ9gvfkrM8WZ4cZpQSahzRdPswwkFhNblGye7SDhtI+62XM?=
 =?us-ascii?Q?5IxJcymv3ZPvNnCSCv7hMfjzLCfxlAwy+8eTZlosl73iqAm5Li/C/R+c8g2m?=
 =?us-ascii?Q?vfoVyW6Jp8Kwhn8/xJ3r6nn1VxAnVHsBrdjQl2sdvox7/OFgj66DR3H0pqQ1?=
 =?us-ascii?Q?z5jR8e7LFQBXfx7WgrjVLTR0w/Jx3I78hioNeSFjSJI5Qi8t1K5q1cv8POUT?=
 =?us-ascii?Q?QEzUps63jDOZNu1iuFnMyL+MbU1rRXewJMghCmhc2q4UTNKGZdfa/6itJ5Bl?=
 =?us-ascii?Q?Llrk1zVUvx3cNDC2zRI4qLpJNdZ8R1spbCqzJTHodonUJWspblm1xC9zqmEq?=
 =?us-ascii?Q?bSh3b9UWdR2U99BwqYZsFrMNTc40PkQ8/bvfucYkK3+rujEuVoAkwma1LxGV?=
 =?us-ascii?Q?Irjb52RebkrYy3z6JjYqDJeNaFK7esRvzQs0NzvPL/HYkuJcTfyYPKX74Ilp?=
 =?us-ascii?Q?BNzJp2nG+09itdE8EZyTqopn91irOueYxsG2aeiamy4DWj2ILysovy5omqxG?=
 =?us-ascii?Q?qucpMAtzpAqpFoZahcBd2E7DZ+bd5wZJW7cPt/Im7zpmCsffckmgZ+lZ5DFB?=
 =?us-ascii?Q?1ebq7FBCXnEiZApfKAahfwT0lbzzL2JIIuYHbjmILNeK4L+NySnr2wdF2793?=
 =?us-ascii?Q?XLu6mejuwkX2+X3lb+y7+YPxcx3pm9lxP3+T8+Ame/AcbXPZoQJDTX0zD5Zo?=
 =?us-ascii?Q?azed1tyOrrAg6Lh7Ne1ycueMOIuLML3ryCzIfYaMuWtSufSymqbNWtxOps8a?=
 =?us-ascii?Q?OD6vLpR1gXJ1KpH7ExnXEZxFGXBTY/XuccOaJS4DMOAz0UI/oPSN9NgusQn9?=
 =?us-ascii?Q?+lED0Rw2+eaGIvswSQhMGWUQs6uRO+JFi6vPjM2uIz+Yu+Z3eveV3IdYKcA0?=
 =?us-ascii?Q?/xIFSWGiiP/0W2SgC43FsLBnfToGsVx7QtLYUAkO3leCbGfgyckUgkT4i8DK?=
 =?us-ascii?Q?UWkwDjoHeTQg15azv0qnaVmArh4z1vDRE8B2tHd2J8RhQ9/x6ktH6Y348yoe?=
 =?us-ascii?Q?p7DCmlOlUAR4NndlBMwpM1bcRtXlkGHyebIjjMTuirWE68aan2+1tMrWh5vK?=
 =?us-ascii?Q?zykZATYl/NpA/G4w5NIQW0wWuNDxw3+cxt12SqSu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c62d2c9-6a04-4a4b-9b58-08dbbf5f83c2
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 13:41:55.9555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XuPzDTHfwhPO/KyNMpm8a1axVTrdWeE5wrOdyF1sUffPngwfo0SdqfyQmymezJKngAEIYwa+UImulLeErSoaXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7988
X-OriginatorOrg: intel.com

tree:   https://github.com/steev/linux lenovo-x13s-v6.6.0-rc2
head:   b1d6c8559499dbb9228adf2f6d1f7bccdf3026f7
commit: 1bb5dd5c4b32c7e6c73c2c2e38b3471b372196a5 [27/71] dt-bindings: mfd: pm8008: Add regulators for pm8008
:::::: branch date: 8 days ago
:::::: commit date: 9 days ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230927/202309270116.WYXcCXZs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309270116.WYXcCXZs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml:109:11: [error] string value is redundantly quoted with any quotes (quoted-strings)

vim +109 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml

b0572a9b239711 Guru Das Srinagesh 2021-05-25    8  
b0572a9b239711 Guru Das Srinagesh 2021-05-25    9  maintainers:
3e82150697d90d Guru Das Srinagesh 2023-07-27   10    - Guru Das Srinagesh <quic_gurus@quicinc.com>
b0572a9b239711 Guru Das Srinagesh 2021-05-25   11  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   12  description: |
b0572a9b239711 Guru Das Srinagesh 2021-05-25   13    Qualcomm Technologies, Inc. PM8008 is a dedicated camera PMIC that integrates
b0572a9b239711 Guru Das Srinagesh 2021-05-25   14    all the necessary power management, housekeeping, and interface support
b0572a9b239711 Guru Das Srinagesh 2021-05-25   15    functions into a single IC.
b0572a9b239711 Guru Das Srinagesh 2021-05-25   16  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   17  properties:
b0572a9b239711 Guru Das Srinagesh 2021-05-25   18    compatible:
b0572a9b239711 Guru Das Srinagesh 2021-05-25   19      const: qcom,pm8008
b0572a9b239711 Guru Das Srinagesh 2021-05-25   20  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   21    reg:
b0572a9b239711 Guru Das Srinagesh 2021-05-25   22      description:
b0572a9b239711 Guru Das Srinagesh 2021-05-25   23        I2C slave address.
b0572a9b239711 Guru Das Srinagesh 2021-05-25   24  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   25      maxItems: 1
b0572a9b239711 Guru Das Srinagesh 2021-05-25   26  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   27    interrupts:
b0572a9b239711 Guru Das Srinagesh 2021-05-25   28      maxItems: 1
b0572a9b239711 Guru Das Srinagesh 2021-05-25   29  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   30      description: Parent interrupt.
b0572a9b239711 Guru Das Srinagesh 2021-05-25   31  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   32    "#interrupt-cells":
b0572a9b239711 Guru Das Srinagesh 2021-05-25   33      const: 2
b0572a9b239711 Guru Das Srinagesh 2021-05-25   34  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   35      description: |
b0572a9b239711 Guru Das Srinagesh 2021-05-25   36        The first cell is the IRQ number, the second cell is the IRQ trigger
b0572a9b239711 Guru Das Srinagesh 2021-05-25   37        flag. All interrupts are listed in include/dt-bindings/mfd/qcom-pm8008.h.
b0572a9b239711 Guru Das Srinagesh 2021-05-25   38  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   39    interrupt-controller: true
b0572a9b239711 Guru Das Srinagesh 2021-05-25   40  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   41    "#address-cells":
3ff858ea1a2525 Satya Priya        2022-06-14   42      const: 2
b0572a9b239711 Guru Das Srinagesh 2021-05-25   43  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   44    "#size-cells":
b0572a9b239711 Guru Das Srinagesh 2021-05-25   45      const: 0
b0572a9b239711 Guru Das Srinagesh 2021-05-25   46  
df67edddfe9a84 Satya Priya        2022-06-14   47    reset-gpios:
df67edddfe9a84 Satya Priya        2022-06-14   48      maxItems: 1
df67edddfe9a84 Satya Priya        2022-06-14   49  
1bb5dd5c4b32c7 Satya Priya        2022-06-14   50    vdd_l1_l2-supply:
1bb5dd5c4b32c7 Satya Priya        2022-06-14   51      description: Input supply phandle of ldo1 and ldo2 regulators.
1bb5dd5c4b32c7 Satya Priya        2022-06-14   52  
1bb5dd5c4b32c7 Satya Priya        2022-06-14   53    vdd_l3_l4-supply:
1bb5dd5c4b32c7 Satya Priya        2022-06-14   54      description: Input supply phandle of ldo3 and ldo4 regulators.
1bb5dd5c4b32c7 Satya Priya        2022-06-14   55  
1bb5dd5c4b32c7 Satya Priya        2022-06-14   56    vdd_l5-supply:
1bb5dd5c4b32c7 Satya Priya        2022-06-14   57      description: Input supply phandle of ldo5 regulator.
1bb5dd5c4b32c7 Satya Priya        2022-06-14   58  
1bb5dd5c4b32c7 Satya Priya        2022-06-14   59    vdd_l6-supply:
1bb5dd5c4b32c7 Satya Priya        2022-06-14   60      description: Input supply phandle of ldo6 regulator.
1bb5dd5c4b32c7 Satya Priya        2022-06-14   61  
1bb5dd5c4b32c7 Satya Priya        2022-06-14   62    vdd_l7-supply:
1bb5dd5c4b32c7 Satya Priya        2022-06-14   63      description: Input supply phandle of ldo7 regulator.
1bb5dd5c4b32c7 Satya Priya        2022-06-14   64  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   65  patternProperties:
3ff858ea1a2525 Satya Priya        2022-06-14   66    "^gpio@0,[0-9a-f]+$":
b0572a9b239711 Guru Das Srinagesh 2021-05-25   67      type: object
b0572a9b239711 Guru Das Srinagesh 2021-05-25   68  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   69      description: |
b0572a9b239711 Guru Das Srinagesh 2021-05-25   70        The GPIO peripheral. This node may be specified twice, one for each GPIO.
b0572a9b239711 Guru Das Srinagesh 2021-05-25   71  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   72      properties:
b0572a9b239711 Guru Das Srinagesh 2021-05-25   73        compatible:
ab09511fb69bdd Satya Priya        2021-07-23   74          items:
ab09511fb69bdd Satya Priya        2021-07-23   75            - const: qcom,pm8008-gpio
ab09511fb69bdd Satya Priya        2021-07-23   76            - const: qcom,spmi-gpio
b0572a9b239711 Guru Das Srinagesh 2021-05-25   77  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   78        reg:
3ff858ea1a2525 Satya Priya        2022-06-14   79          description: Peripheral offset and address of one of the two GPIO peripherals.
b0572a9b239711 Guru Das Srinagesh 2021-05-25   80          maxItems: 1
b0572a9b239711 Guru Das Srinagesh 2021-05-25   81  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   82        gpio-controller: true
b0572a9b239711 Guru Das Srinagesh 2021-05-25   83  
ab09511fb69bdd Satya Priya        2021-07-23   84        gpio-ranges:
ab09511fb69bdd Satya Priya        2021-07-23   85          maxItems: 1
ab09511fb69bdd Satya Priya        2021-07-23   86  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   87        interrupt-controller: true
b0572a9b239711 Guru Das Srinagesh 2021-05-25   88  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   89        "#interrupt-cells":
b0572a9b239711 Guru Das Srinagesh 2021-05-25   90          const: 2
b0572a9b239711 Guru Das Srinagesh 2021-05-25   91  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   92        "#gpio-cells":
b0572a9b239711 Guru Das Srinagesh 2021-05-25   93          const: 2
b0572a9b239711 Guru Das Srinagesh 2021-05-25   94  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   95      required:
b0572a9b239711 Guru Das Srinagesh 2021-05-25   96        - compatible
b0572a9b239711 Guru Das Srinagesh 2021-05-25   97        - reg
b0572a9b239711 Guru Das Srinagesh 2021-05-25   98        - gpio-controller
b0572a9b239711 Guru Das Srinagesh 2021-05-25   99        - interrupt-controller
b0572a9b239711 Guru Das Srinagesh 2021-05-25  100        - "#gpio-cells"
ab09511fb69bdd Satya Priya        2021-07-23  101        - gpio-ranges
b0572a9b239711 Guru Das Srinagesh 2021-05-25  102        - "#interrupt-cells"
b0572a9b239711 Guru Das Srinagesh 2021-05-25  103  
b0572a9b239711 Guru Das Srinagesh 2021-05-25  104      additionalProperties: false
b0572a9b239711 Guru Das Srinagesh 2021-05-25  105  
1bb5dd5c4b32c7 Satya Priya        2022-06-14  106    "^ldo[1-7]@[1],[0-9a-f]+$":
1bb5dd5c4b32c7 Satya Priya        2022-06-14  107      type: object
1bb5dd5c4b32c7 Satya Priya        2022-06-14  108  
1bb5dd5c4b32c7 Satya Priya        2022-06-14 @109      $ref: "/schemas/regulator/regulator.yaml#"
1bb5dd5c4b32c7 Satya Priya        2022-06-14  110  
1bb5dd5c4b32c7 Satya Priya        2022-06-14  111      description: PM8008 regulator peripherals of PM8008 regulator device.
1bb5dd5c4b32c7 Satya Priya        2022-06-14  112  
1bb5dd5c4b32c7 Satya Priya        2022-06-14  113      properties:
1bb5dd5c4b32c7 Satya Priya        2022-06-14  114        compatible:
1bb5dd5c4b32c7 Satya Priya        2022-06-14  115          const: qcom,pm8008-regulator
1bb5dd5c4b32c7 Satya Priya        2022-06-14  116  
1bb5dd5c4b32c7 Satya Priya        2022-06-14  117        reg:
1bb5dd5c4b32c7 Satya Priya        2022-06-14  118          description: Peripheral offset and address of the ldo regulator.
1bb5dd5c4b32c7 Satya Priya        2022-06-14  119          maxItems: 1
1bb5dd5c4b32c7 Satya Priya        2022-06-14  120  
1bb5dd5c4b32c7 Satya Priya        2022-06-14  121      required:
1bb5dd5c4b32c7 Satya Priya        2022-06-14  122        - compatible
1bb5dd5c4b32c7 Satya Priya        2022-06-14  123        - reg
1bb5dd5c4b32c7 Satya Priya        2022-06-14  124  
1bb5dd5c4b32c7 Satya Priya        2022-06-14  125      unevaluatedProperties: false
1bb5dd5c4b32c7 Satya Priya        2022-06-14  126  
b0572a9b239711 Guru Das Srinagesh 2021-05-25  127  required:
b0572a9b239711 Guru Das Srinagesh 2021-05-25  128    - compatible
b0572a9b239711 Guru Das Srinagesh 2021-05-25  129    - reg
b0572a9b239711 Guru Das Srinagesh 2021-05-25  130    - interrupts
b0572a9b239711 Guru Das Srinagesh 2021-05-25  131    - "#address-cells"
b0572a9b239711 Guru Das Srinagesh 2021-05-25  132    - "#size-cells"
b0572a9b239711 Guru Das Srinagesh 2021-05-25  133    - "#interrupt-cells"
df67edddfe9a84 Satya Priya        2022-06-14  134    - reset-gpios
b0572a9b239711 Guru Das Srinagesh 2021-05-25  135  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

