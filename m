Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2B6347AA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 13:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695822258; x=1727358258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t7hR9AP/GXqDh1H96UpgzK+ZZGrgb8ZiLwy9j8TgNE8=;
  b=QgLISUcyrGDlxHTArSzYSW3YmwgLENH9WdWRzq8LprNNyM6dblZj9pG/
   fkGHLN8YH3TIMSR3X98OovjKEWBM85HYZUcxJ4gJ7DA7/t5OSZUD8iohK
   AsxYOkK7Q7tmZpCytZoQeCv12VmWW5o2+7uiJsJyowuvJPNf2tud2mkPr
   XBLIdWcNKmURKzrzz7tAS6kX3zuunOBLneWKFQf/gNXgmd/C/Gs8e6ocI
   p8PCPR3jUHRZynTt8xnO97fZLAE5Hmzn0O7K+/VZTbA8/Is3hCSk5bZ/s
   vomAkbYZwmPlmkeDQpub75Sr0Pu4AyJHl5E/j/lKaq7KRB5Fd2qySqi5l
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="381729160"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="381729160"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 06:44:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="922783411"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="922783411"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Sep 2023 06:44:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 06:44:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 06:44:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 06:44:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 06:44:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IMgctU2TbBohbUNLIPGrLkKMqZEZJBjJyH9Q/MvOeYL7bRV1/hGGDtVTO6CNwQ/L57veRvzH+rC6MCtCn5omU0SaYvF+sNmZjabTnyROooM14uNivV30Xv9ZGM9PSz0+gzwP2P96RNYvZD2wxyrMNv4TnWihMsYDYRsJtX1cbTD1TvYutjyK4A+DV6o2hVDARfC21oxSQqULBhvLZtbmSIzybziPV4BaAVsIIENid6x2YFN4bvu6ETw7UGFeNpuqjj41u52K8pCaAkKVS4AjQ7x2hJXcERbamqHz1it8A90V9c8rv7Jwl1c/o+GN6juTl6x0SKGICNGTjQev6S0CdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/bWd/FIgUfN9dWsaUewRlV6SHlF6ZxK+1+0fkZ7JUA=;
 b=SvelTW4LCd0ucLvC2pg8z80cuvQ8UA6OrxISSkkV0MayrfkPT/MaF6HHQ6RmQQTw5MPEthV/hna6T/Y6e6QnD12LO/LdyaSeC4ZZzxRCR+rBVe3FvMqofgoecSxJm+5F3UbbwlEEofr6+kqdNJdWW9G8hi3uQt57BWGunjTLVe6qB+qflAMKVfyie0JvMW7aICg0fazDGfmR79xkmqSmwcESnvdVpoaj3KF8M9eLknbzUM9t08t7MdB0wfl6d28KZIwi9/n5PSRgByEi0PPnT/9e+BGIlInl1E1bm6n5PbrmYnCuh5j48ngtXLvfSkJmzVG5MO+m9XTssdsYdYtVZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3006.namprd11.prod.outlook.com (2603:10b6:805:d1::24)
 by CY5PR11MB6233.namprd11.prod.outlook.com (2603:10b6:930:26::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Wed, 27 Sep
 2023 13:44:09 +0000
Received: from SN6PR11MB3006.namprd11.prod.outlook.com
 ([fe80::b2f6:ff19:be0b:362d]) by SN6PR11MB3006.namprd11.prod.outlook.com
 ([fe80::b2f6:ff19:be0b:362d%7]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 13:44:09 +0000
Date: Wed, 27 Sep 2023 21:44:00 +0800
From: kernel test robot <philip.li@intel.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [omap-audio:peter/linux-next-wip 11/48] dtbs_check:
 Documentation/devicetree/bindings/sound/simple-card.yaml:61:5: [warning]
 wrong indentation: expected 2 but found 4 (indentation)
Message-ID: <ZRQxoL6bhBSgRs+a@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To SN6PR11MB3006.namprd11.prod.outlook.com (2603:10b6:805:d1::24)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3006:EE_|CY5PR11MB6233:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ecc4a17-6f26-4ee6-375f-08dbbf5fd35d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9zUYINknc5+04yxUvMpGxPdaf/rqVh/9JZDhx2gubxUGZ+r2p71ffThMw3Ocyz3meMcPZAM9ig/xkV7427SGbAKU84BwVdjeAAD4Bf+zXlQz3U23dzApPXA6/YnPUSPh/DJVDfA3YzTKP2N/c+PBKBXPwqSN77ytRszYO82m6FWd8/wefrQWfgW7vvHglXl936t9a0hSQeEBGdPghGErSGsEyPOC5825JXUDpM9vHIoXcp31mP6mIA4Mvj9U02SC/Hcb/oAwk1UAPrj/n/ByPE96rBtTFzLxDhhMaXszL+IGBaxnx9WFsbURVULVgfeWXTkmUeTT/fzGdy4mN4hB1mKnwbP4f+ipSiruzMNIU+I3aScDcnan4EFDJOT2V/FDWcSKRh2WyHTdahLPcXNHNWk2BhbUT0zdgwS9k8a26twWa23OjbJV498TD5RnSGkOwR4xI1HQeEgBejDgN1n/u45DmjHQfdV7omw6j60jxaHgVrl5FxjeqQM/UZ/HMLfSMC1MnXOiYBpFyp4LGYGeUMGmVlffS0OnpYbaMvhATJSW6qAhpkbGvEljRsvnNHBjbLPsrHRv1Ly1dh2q9H6V3eundNep7niwUVJe2AcY7O0Mu+LH5k+h/iw+nFbjgKi5Ka22ErCnsQU5d4mE5Gf16G4G0vBhE3KlsqZc0dIYpsE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(346002)(396003)(136003)(39860400002)(376002)(230922051799003)(1800799009)(186009)(451199024)(2013699003)(66946007)(4001150100001)(2906002)(30864003)(316002)(6916009)(41300700001)(8936002)(4326008)(8676002)(5660300002)(66476007)(66556008)(86362001)(6486002)(33716001)(9686003)(6506007)(6512007)(6666004)(38100700002)(82960400001)(26005)(83380400001)(966005)(478600001)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TQQuXWj40YwtsI081F7p9NN1okq7MypKG+ACEX9g/vqi4Y81r6uB/nTuxmIM?=
 =?us-ascii?Q?XiPZD8jfGOBFYkaDfCGQvlU0GmQOsbjO3KvT21hU4zdpeaq5a45bxY7S01vI?=
 =?us-ascii?Q?d7VyY4auIkIoX4QLDyodOkCAZEw9tKVl+a41nUXp+GSvS29icbkekHkHFV7V?=
 =?us-ascii?Q?jviFKddN3S1PFQDtn//acc3VmuZISSSEU8oQvOMC1/ZJmj59GlgKj/1jh0WR?=
 =?us-ascii?Q?7YOisTM5LdLS11rCsd+P8I5eMZzdtyLJZYpjqFpUjqsgzfG8M93dLXPn8Ik0?=
 =?us-ascii?Q?I9KR0xqA5kbo+keOQe40pGjla6r/8vevKftXXwozJZqlMEupoxhm1c9cPBSl?=
 =?us-ascii?Q?L1CoUbQVh5XYah1YmgBQGOGRcqlvFJu2NWdix69+8EL7jAVNGPQu3qWB98Z1?=
 =?us-ascii?Q?ugb1oxyvsqBUjoTns8duIciqsFqHTKm/BNUZFCECX8f8cb1jnmJX1zH9fFxD?=
 =?us-ascii?Q?QwUkEXYyQB1QKb+UO6szYqGHjkORwbRlWOAGac7G2g9wfnf1IkwSfs4QWbrQ?=
 =?us-ascii?Q?T0OnLjTrcjb4xH9tP/LXQyv3S8JJkuBIJL5QoKG7UYajz8UsxYY7HgzbhZyf?=
 =?us-ascii?Q?8mxc5wxQ4j0NjR8JA2+UlMtf4ig7PIKLtMqhyqJ2Pl/yaqLhR+qH9ps5fvAY?=
 =?us-ascii?Q?Hh7F8UkqcoBK7ln1x1arxiVod1ouUDuQLuFYoY5smCAGGnnydBnv1jwF6LFk?=
 =?us-ascii?Q?BZEkVigkYrTPtYEaPzSGs5flSobKol35rvNQ5zVLRwGr4Kq73YnSGWncGq1J?=
 =?us-ascii?Q?ZEkN5Ir837JvN3RAi7IDkgqiBECiXrDzXcuL3zIxghpbWALbNML7paFx04ZE?=
 =?us-ascii?Q?B+K9VGSjogLd7hwTz8HFYEKLOSNyEjr2ZO+SdTufjLGmAcKBvewXLJXWb+Ar?=
 =?us-ascii?Q?FBdqaVVBJgbDdhwr7prIxTSKn//KoqGnK4F9+C8y1o9nNx874tMeOH3vr18n?=
 =?us-ascii?Q?nQNIJ8M2YhWBZSDgEU48dtD8zc+FOCAn6cS211m165nQi4aPR7MyWesv7puN?=
 =?us-ascii?Q?H5ntNwdSvTNp6+Nl8JARHpegub/phJ7xTEsluY0SzwpzMl+hv8+O0yg07FyR?=
 =?us-ascii?Q?n2FpttWXiqaLWXudTexqmQMCRuoxYyo2G9zqkZ3KYfOmQ97p2pUaaeimug/e?=
 =?us-ascii?Q?fPxM53yua54qvxkKRidcE/tw53qks34fv/elQIRjvbbkSuqLoHXZHYLJ83i0?=
 =?us-ascii?Q?cRlXVVK+iMbQTRUSj63eqYLY1UlEv0pjWTdqfB74yuHv6waSytugDtcZFBqj?=
 =?us-ascii?Q?tKI1faDmlRY0s1CQhyQSiXEzDN5L0yU/zkL1XKUHNM8CZv28fNvny8AtfgHx?=
 =?us-ascii?Q?kbaaBfOX/1toVQJLsd646YBM4ePV+NAiUSwpoZC2VCokjorqAqv26pmni4L0?=
 =?us-ascii?Q?Ydb29Eghaf+ydiNY0YLN42/gX5nqtmU9jq85fPqNkAYElDtXVUnERWQo1bgE?=
 =?us-ascii?Q?69x520r4Y91FufT8nli/6HRbdf+Ew1sQjHBgqsqfH5RYIBUo+AVaOoQFtR3p?=
 =?us-ascii?Q?A0kCuOk5w6AIfRlHp7lJmh3uHXhVSgPhvw1jaQxi8qN7oJ+e6eQQdENZ6U8F?=
 =?us-ascii?Q?H7Ff8bZ6CDoSUH20ZLlkIGnyagOpS6qAfTqYN7/G?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ecc4a17-6f26-4ee6-375f-08dbbf5fd35d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 13:44:09.4811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QNQDR5Szcexz1n6iY+qx9A5eZoKguCDM/2qsputWl4UO+Fj4Dz+3AXb3rvrJXAQ3g4+nnSxclJfoxwY+VQ2l2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6233
X-OriginatorOrg: intel.com

tree:   https://github.com/omap-audio/linux-audio peter/linux-next-wip
head:   53915ce9abe60ba07d0e5456948553edefc6cbfb
commit: 8a7b40b7019c093728eb277a9c848369322c9413 [11/48] ASoC: simple-card: Support for selecting system clocks by ID
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230927/202309270144.c9b2pEPV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309270144.c9b2pEPV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/sound/simple-card.yaml:61:5: [warning] wrong indentation: expected 2 but found 4 (indentation)
>> Documentation/devicetree/bindings/sound/simple-card.yaml:65:3: [error] syntax error: expected <block end>, but found '<block mapping start>' (syntax)
--
>> Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml:
   while parsing a block mapping
     in "<unicode string>", line 4, column 1
   did not find expected key
     in "<unicode string>", line 65, column 3
>> Documentation/devicetree/bindings/sound/simple-card.yaml:65:3: did not find expected key
--
>> Documentation/devicetree/bindings/sound/simple-card.yaml: ignoring, error parsing file

vim +61 Documentation/devicetree/bindings/sound/simple-card.yaml

79149fb835d762 Kuninori Morimoto   2020-04-01    8  
79149fb835d762 Kuninori Morimoto   2020-04-01    9  maintainers:
79149fb835d762 Kuninori Morimoto   2020-04-01   10    - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
79149fb835d762 Kuninori Morimoto   2020-04-01   11  
79149fb835d762 Kuninori Morimoto   2020-04-01   12  definitions:
79149fb835d762 Kuninori Morimoto   2020-04-01   13  
79149fb835d762 Kuninori Morimoto   2020-04-01   14    frame-master:
79149fb835d762 Kuninori Morimoto   2020-04-01   15      description: Indicates dai-link frame master.
251bf658558f9f Rob Herring         2020-11-16   16      $ref: /schemas/types.yaml#/definitions/phandle
79149fb835d762 Kuninori Morimoto   2020-04-01   17  
79149fb835d762 Kuninori Morimoto   2020-04-01   18    bitclock-master:
79149fb835d762 Kuninori Morimoto   2020-04-01   19      description: Indicates dai-link bit clock master
251bf658558f9f Rob Herring         2020-11-16   20      $ref: /schemas/types.yaml#/definitions/phandle
79149fb835d762 Kuninori Morimoto   2020-04-01   21  
79149fb835d762 Kuninori Morimoto   2020-04-01   22    frame-inversion:
79149fb835d762 Kuninori Morimoto   2020-04-01   23      description: dai-link uses frame clock inversion
79149fb835d762 Kuninori Morimoto   2020-04-01   24      $ref: /schemas/types.yaml#/definitions/flag
79149fb835d762 Kuninori Morimoto   2020-04-01   25  
79149fb835d762 Kuninori Morimoto   2020-04-01   26    bitclock-inversion:
79149fb835d762 Kuninori Morimoto   2020-04-01   27      description: dai-link uses bit clock inversion
79149fb835d762 Kuninori Morimoto   2020-04-01   28      $ref: /schemas/types.yaml#/definitions/flag
79149fb835d762 Kuninori Morimoto   2020-04-01   29  
79149fb835d762 Kuninori Morimoto   2020-04-01   30    dai-tdm-slot-num:
79149fb835d762 Kuninori Morimoto   2020-04-01   31      description: see tdm-slot.txt.
79149fb835d762 Kuninori Morimoto   2020-04-01   32      $ref: /schemas/types.yaml#/definitions/uint32
79149fb835d762 Kuninori Morimoto   2020-04-01   33  
79149fb835d762 Kuninori Morimoto   2020-04-01   34    dai-tdm-slot-width:
79149fb835d762 Kuninori Morimoto   2020-04-01   35      description: see tdm-slot.txt.
79149fb835d762 Kuninori Morimoto   2020-04-01   36      $ref: /schemas/types.yaml#/definitions/uint32
79149fb835d762 Kuninori Morimoto   2020-04-01   37  
79149fb835d762 Kuninori Morimoto   2020-04-01   38    system-clock-frequency:
79149fb835d762 Kuninori Morimoto   2020-04-01   39      description: |
79149fb835d762 Kuninori Morimoto   2020-04-01   40        If a clock is specified and a multiplication factor is given with
79149fb835d762 Kuninori Morimoto   2020-04-01   41        mclk-fs, the clock will be set to the calculated mclk frequency
79149fb835d762 Kuninori Morimoto   2020-04-01   42        when the stream starts.
79149fb835d762 Kuninori Morimoto   2020-04-01   43      $ref: /schemas/types.yaml#/definitions/uint32
79149fb835d762 Kuninori Morimoto   2020-04-01   44  
79149fb835d762 Kuninori Morimoto   2020-04-01   45    system-clock-direction-out:
79149fb835d762 Kuninori Morimoto   2020-04-01   46      description: |
79149fb835d762 Kuninori Morimoto   2020-04-01   47        specifies clock direction as 'out' on initialization.
79149fb835d762 Kuninori Morimoto   2020-04-01   48        It is useful for some aCPUs with fixed clocks.
79149fb835d762 Kuninori Morimoto   2020-04-01   49      $ref: /schemas/types.yaml#/definitions/flag
79149fb835d762 Kuninori Morimoto   2020-04-01   50  
e9fed03aebacb8 Robert Hancock      2022-01-20   51    system-clock-fixed:
e9fed03aebacb8 Robert Hancock      2022-01-20   52      description: |
e9fed03aebacb8 Robert Hancock      2022-01-20   53        Specifies that the clock frequency should not be modified.
e9fed03aebacb8 Robert Hancock      2022-01-20   54        Implied when system-clock-frequency is specified, but can be used when
e9fed03aebacb8 Robert Hancock      2022-01-20   55        a clock is mapped to the device whose frequency cannot or should not be
e9fed03aebacb8 Robert Hancock      2022-01-20   56        changed. When mclk-fs is also specified, this restricts the device to a
e9fed03aebacb8 Robert Hancock      2022-01-20   57        single fixed sampling rate.
e9fed03aebacb8 Robert Hancock      2022-01-20   58      $ref: /schemas/types.yaml#/definitions/flag
e9fed03aebacb8 Robert Hancock      2022-01-20   59  
8a7b40b7019c09 Jyri Sarha          2016-01-18   60  system-clock-id:
8a7b40b7019c09 Jyri Sarha          2016-01-18  @61      description: |
8a7b40b7019c09 Jyri Sarha          2016-01-18   62        Numberic ID of the system clock to select within the dai, default is 0.
8a7b40b7019c09 Jyri Sarha          2016-01-18   63      $ref: /schemas/types.yaml#/definitions/uint32
8a7b40b7019c09 Jyri Sarha          2016-01-18   64  
79149fb835d762 Kuninori Morimoto   2020-04-01  @65    mclk-fs:
79149fb835d762 Kuninori Morimoto   2020-04-01   66      description: |
79149fb835d762 Kuninori Morimoto   2020-04-01   67        Multiplication factor between stream rate and codec mclk.
79149fb835d762 Kuninori Morimoto   2020-04-01   68        When defined, mclk-fs property defined in dai-link sub nodes are ignored.
79149fb835d762 Kuninori Morimoto   2020-04-01   69      $ref: /schemas/types.yaml#/definitions/uint32
79149fb835d762 Kuninori Morimoto   2020-04-01   70  
79149fb835d762 Kuninori Morimoto   2020-04-01   71    aux-devs:
79149fb835d762 Kuninori Morimoto   2020-04-01   72      description: |
79149fb835d762 Kuninori Morimoto   2020-04-01   73        List of phandles pointing to auxiliary devices, such
79149fb835d762 Kuninori Morimoto   2020-04-01   74        as amplifiers, to be added to the sound card.
79149fb835d762 Kuninori Morimoto   2020-04-01   75      $ref: /schemas/types.yaml#/definitions/phandle-array
79149fb835d762 Kuninori Morimoto   2020-04-01   76  
79149fb835d762 Kuninori Morimoto   2020-04-01   77    convert-rate:
79149fb835d762 Kuninori Morimoto   2020-04-01   78      description: CPU to Codec rate convert.
79149fb835d762 Kuninori Morimoto   2020-04-01   79      $ref: /schemas/types.yaml#/definitions/uint32
79149fb835d762 Kuninori Morimoto   2020-04-01   80  
79149fb835d762 Kuninori Morimoto   2020-04-01   81    convert-channels:
79149fb835d762 Kuninori Morimoto   2020-04-01   82      description: CPU to Codec rate channels.
79149fb835d762 Kuninori Morimoto   2020-04-01   83      $ref: /schemas/types.yaml#/definitions/uint32
79149fb835d762 Kuninori Morimoto   2020-04-01   84  
79149fb835d762 Kuninori Morimoto   2020-04-01   85    prefix:
d9e909e219a843 Rob Herring         2023-03-17   86      description: device name prefix
79149fb835d762 Kuninori Morimoto   2020-04-01   87      $ref: /schemas/types.yaml#/definitions/string
79149fb835d762 Kuninori Morimoto   2020-04-01   88  
79149fb835d762 Kuninori Morimoto   2020-04-01   89    label:
79149fb835d762 Kuninori Morimoto   2020-04-01   90      maxItems: 1
79149fb835d762 Kuninori Morimoto   2020-04-01   91  
79149fb835d762 Kuninori Morimoto   2020-04-01   92    routing:
79149fb835d762 Kuninori Morimoto   2020-04-01   93      description: |
79149fb835d762 Kuninori Morimoto   2020-04-01   94        A list of the connections between audio components.
79149fb835d762 Kuninori Morimoto   2020-04-01   95        Each entry is a pair of strings, the first being the
79149fb835d762 Kuninori Morimoto   2020-04-01   96        connection's sink, the second being the connection's source.
79149fb835d762 Kuninori Morimoto   2020-04-01   97      $ref: /schemas/types.yaml#/definitions/non-unique-string-array
79149fb835d762 Kuninori Morimoto   2020-04-01   98  
79149fb835d762 Kuninori Morimoto   2020-04-01   99    widgets:
79149fb835d762 Kuninori Morimoto   2020-04-01  100      description: User specified audio sound widgets.
79149fb835d762 Kuninori Morimoto   2020-04-01  101      $ref: /schemas/types.yaml#/definitions/non-unique-string-array
79149fb835d762 Kuninori Morimoto   2020-04-01  102  
79149fb835d762 Kuninori Morimoto   2020-04-01  103    pin-switches:
79149fb835d762 Kuninori Morimoto   2020-04-01  104      description: the widget names for which pin switches must be created.
79149fb835d762 Kuninori Morimoto   2020-04-01  105      $ref: /schemas/types.yaml#/definitions/string-array
79149fb835d762 Kuninori Morimoto   2020-04-01  106  
79149fb835d762 Kuninori Morimoto   2020-04-01  107    format:
79149fb835d762 Kuninori Morimoto   2020-04-01  108      description: audio format.
79149fb835d762 Kuninori Morimoto   2020-04-01  109      items:
79149fb835d762 Kuninori Morimoto   2020-04-01  110        enum:
79149fb835d762 Kuninori Morimoto   2020-04-01  111          - i2s
79149fb835d762 Kuninori Morimoto   2020-04-01  112          - right_j
79149fb835d762 Kuninori Morimoto   2020-04-01  113          - left_j
79149fb835d762 Kuninori Morimoto   2020-04-01  114          - dsp_a
79149fb835d762 Kuninori Morimoto   2020-04-01  115          - dsp_b
79149fb835d762 Kuninori Morimoto   2020-04-01  116          - ac97
79149fb835d762 Kuninori Morimoto   2020-04-01  117          - pdm
79149fb835d762 Kuninori Morimoto   2020-04-01  118          - msb
79149fb835d762 Kuninori Morimoto   2020-04-01  119          - lsb
79149fb835d762 Kuninori Morimoto   2020-04-01  120  
79149fb835d762 Kuninori Morimoto   2020-04-01  121    dai:
79149fb835d762 Kuninori Morimoto   2020-04-01  122      type: object
79149fb835d762 Kuninori Morimoto   2020-04-01  123      properties:
79149fb835d762 Kuninori Morimoto   2020-04-01  124        sound-dai:
79149fb835d762 Kuninori Morimoto   2020-04-01  125          maxItems: 1
79149fb835d762 Kuninori Morimoto   2020-04-01  126  
79149fb835d762 Kuninori Morimoto   2020-04-01  127        # common properties
79149fb835d762 Kuninori Morimoto   2020-04-01  128        mclk-fs:
79149fb835d762 Kuninori Morimoto   2020-04-01  129          $ref: "#/definitions/mclk-fs"
79149fb835d762 Kuninori Morimoto   2020-04-01  130        prefix:
79149fb835d762 Kuninori Morimoto   2020-04-01  131          $ref: "#/definitions/prefix"
79149fb835d762 Kuninori Morimoto   2020-04-01  132        frame-inversion:
79149fb835d762 Kuninori Morimoto   2020-04-01  133          $ref: "#/definitions/frame-inversion"
79149fb835d762 Kuninori Morimoto   2020-04-01  134        bitclock-inversion:
79149fb835d762 Kuninori Morimoto   2020-04-01  135          $ref: "#/definitions/bitclock-inversion"
79149fb835d762 Kuninori Morimoto   2020-04-01  136        frame-master:
79149fb835d762 Kuninori Morimoto   2020-04-01  137          $ref: /schemas/types.yaml#/definitions/flag
79149fb835d762 Kuninori Morimoto   2020-04-01  138        bitclock-master:
79149fb835d762 Kuninori Morimoto   2020-04-01  139          $ref: /schemas/types.yaml#/definitions/flag
79149fb835d762 Kuninori Morimoto   2020-04-01  140  
79149fb835d762 Kuninori Morimoto   2020-04-01  141        dai-tdm-slot-num:
79149fb835d762 Kuninori Morimoto   2020-04-01  142          $ref: "#/definitions/dai-tdm-slot-num"
79149fb835d762 Kuninori Morimoto   2020-04-01  143        dai-tdm-slot-width:
79149fb835d762 Kuninori Morimoto   2020-04-01  144          $ref: "#/definitions/dai-tdm-slot-width"
79149fb835d762 Kuninori Morimoto   2020-04-01  145        clocks:
79149fb835d762 Kuninori Morimoto   2020-04-01  146          maxItems: 1
79149fb835d762 Kuninori Morimoto   2020-04-01  147        system-clock-frequency:
79149fb835d762 Kuninori Morimoto   2020-04-01  148          $ref: "#/definitions/system-clock-frequency"
79149fb835d762 Kuninori Morimoto   2020-04-01  149        system-clock-direction-out:
79149fb835d762 Kuninori Morimoto   2020-04-01  150          $ref: "#/definitions/system-clock-direction-out"
e9fed03aebacb8 Robert Hancock      2022-01-20  151        system-clock-fixed:
e9fed03aebacb8 Robert Hancock      2022-01-20  152          $ref: "#/definitions/system-clock-fixed"
79149fb835d762 Kuninori Morimoto   2020-04-01  153      required:
79149fb835d762 Kuninori Morimoto   2020-04-01  154        - sound-dai
79149fb835d762 Kuninori Morimoto   2020-04-01  155  
b5f3484117b86c Herve Codina        2023-06-23  156    additional-devs:
b5f3484117b86c Herve Codina        2023-06-23  157      type: object
b5f3484117b86c Herve Codina        2023-06-23  158      description:
b5f3484117b86c Herve Codina        2023-06-23  159        Additional devices used by the simple audio card.
b5f3484117b86c Herve Codina        2023-06-23  160      patternProperties:
b5f3484117b86c Herve Codina        2023-06-23  161        '^iio-aux(-.+)?$':
b5f3484117b86c Herve Codina        2023-06-23  162          type: object
b5f3484117b86c Herve Codina        2023-06-23  163          $ref: audio-iio-aux.yaml#
b5f3484117b86c Herve Codina        2023-06-23  164  
79149fb835d762 Kuninori Morimoto   2020-04-01  165  properties:
79149fb835d762 Kuninori Morimoto   2020-04-01  166    compatible:
79149fb835d762 Kuninori Morimoto   2020-04-01  167      contains:
79149fb835d762 Kuninori Morimoto   2020-04-01  168        enum:
79149fb835d762 Kuninori Morimoto   2020-04-01  169          - simple-audio-card
79149fb835d762 Kuninori Morimoto   2020-04-01  170          - simple-scu-audio-card
79149fb835d762 Kuninori Morimoto   2020-04-01  171  
79149fb835d762 Kuninori Morimoto   2020-04-01  172    "#address-cells":
79149fb835d762 Kuninori Morimoto   2020-04-01  173      const: 1
79149fb835d762 Kuninori Morimoto   2020-04-01  174    "#size-cells":
79149fb835d762 Kuninori Morimoto   2020-04-01  175      const: 0
79149fb835d762 Kuninori Morimoto   2020-04-01  176  
79149fb835d762 Kuninori Morimoto   2020-04-01  177    label:
79149fb835d762 Kuninori Morimoto   2020-04-01  178      $ref: "#/definitions/label"
79149fb835d762 Kuninori Morimoto   2020-04-01  179  
79149fb835d762 Kuninori Morimoto   2020-04-01  180    simple-audio-card,name:
79149fb835d762 Kuninori Morimoto   2020-04-01  181      description: User specified audio sound card name.
79149fb835d762 Kuninori Morimoto   2020-04-01  182      $ref: /schemas/types.yaml#/definitions/string
79149fb835d762 Kuninori Morimoto   2020-04-01  183  
910f42bfe96783 Rob Herring         2022-03-11  184    simple-audio-card,widgets:
79149fb835d762 Kuninori Morimoto   2020-04-01  185      $ref: "#/definitions/widgets"
910f42bfe96783 Rob Herring         2022-03-11  186    simple-audio-card,routing:
79149fb835d762 Kuninori Morimoto   2020-04-01  187      $ref: "#/definitions/routing"
79149fb835d762 Kuninori Morimoto   2020-04-01  188  
79149fb835d762 Kuninori Morimoto   2020-04-01  189    # common properties
910f42bfe96783 Rob Herring         2022-03-11  190    simple-audio-card,frame-master:
79149fb835d762 Kuninori Morimoto   2020-04-01  191      $ref: "#/definitions/frame-master"
910f42bfe96783 Rob Herring         2022-03-11  192    simple-audio-card,bitclock-master:
79149fb835d762 Kuninori Morimoto   2020-04-01  193      $ref: "#/definitions/bitclock-master"
910f42bfe96783 Rob Herring         2022-03-11  194    simple-audio-card,frame-inversion:
79149fb835d762 Kuninori Morimoto   2020-04-01  195      $ref: "#/definitions/frame-inversion"
910f42bfe96783 Rob Herring         2022-03-11  196    simple-audio-card,bitclock-inversion:
79149fb835d762 Kuninori Morimoto   2020-04-01  197      $ref: "#/definitions/bitclock-inversion"
910f42bfe96783 Rob Herring         2022-03-11  198    simple-audio-card,format:
79149fb835d762 Kuninori Morimoto   2020-04-01  199      $ref: "#/definitions/format"
910f42bfe96783 Rob Herring         2022-03-11  200    simple-audio-card,mclk-fs:
79149fb835d762 Kuninori Morimoto   2020-04-01  201      $ref: "#/definitions/mclk-fs"
910f42bfe96783 Rob Herring         2022-03-11  202    simple-audio-card,aux-devs:
79149fb835d762 Kuninori Morimoto   2020-04-01  203      $ref: "#/definitions/aux-devs"
b5f3484117b86c Herve Codina        2023-06-23  204    simple-audio-card,additional-devs:
b5f3484117b86c Herve Codina        2023-06-23  205      $ref: "#/definitions/additional-devs"
910f42bfe96783 Rob Herring         2022-03-11  206    simple-audio-card,convert-rate:
79149fb835d762 Kuninori Morimoto   2020-04-01  207      $ref: "#/definitions/convert-rate"
910f42bfe96783 Rob Herring         2022-03-11  208    simple-audio-card,convert-channels:
79149fb835d762 Kuninori Morimoto   2020-04-01  209      $ref: "#/definitions/convert-channels"
910f42bfe96783 Rob Herring         2022-03-11  210    simple-audio-card,prefix:
79149fb835d762 Kuninori Morimoto   2020-04-01  211      $ref: "#/definitions/prefix"
910f42bfe96783 Rob Herring         2022-03-11  212    simple-audio-card,pin-switches:
79149fb835d762 Kuninori Morimoto   2020-04-01  213      $ref: "#/definitions/pin-switches"
910f42bfe96783 Rob Herring         2022-03-11  214    simple-audio-card,hp-det-gpio:
79149fb835d762 Kuninori Morimoto   2020-04-01  215      maxItems: 1
910f42bfe96783 Rob Herring         2022-03-11  216    simple-audio-card,mic-det-gpio:
79149fb835d762 Kuninori Morimoto   2020-04-01  217      maxItems: 1
79149fb835d762 Kuninori Morimoto   2020-04-01  218  
910f42bfe96783 Rob Herring         2022-03-11  219  patternProperties:
910f42bfe96783 Rob Herring         2022-03-11  220    "^simple-audio-card,cpu(@[0-9a-f]+)?$":
910f42bfe96783 Rob Herring         2022-03-11  221      $ref: "#/definitions/dai"
910f42bfe96783 Rob Herring         2022-03-11  222    "^simple-audio-card,codec(@[0-9a-f]+)?$":
910f42bfe96783 Rob Herring         2022-03-11  223      $ref: "#/definitions/dai"
e7e2b92e609f82 Faiz Abbas          2023-01-17  224    "^simple-audio-card,plat(@[0-9a-f]+)?$":
e7e2b92e609f82 Faiz Abbas          2023-01-17  225      $ref: "#/definitions/dai"
910f42bfe96783 Rob Herring         2022-03-11  226  
79149fb835d762 Kuninori Morimoto   2020-04-01  227    "^simple-audio-card,dai-link(@[0-9a-f]+)?$":
79149fb835d762 Kuninori Morimoto   2020-04-01  228      description: |
79149fb835d762 Kuninori Morimoto   2020-04-01  229        Container for dai-link level properties and the CPU and CODEC sub-nodes.
79149fb835d762 Kuninori Morimoto   2020-04-01  230        This container may be omitted when the card has only one DAI link.
79149fb835d762 Kuninori Morimoto   2020-04-01  231      type: object
79149fb835d762 Kuninori Morimoto   2020-04-01  232      properties:
79149fb835d762 Kuninori Morimoto   2020-04-01  233        reg:
79149fb835d762 Kuninori Morimoto   2020-04-01  234          maxItems: 1
79149fb835d762 Kuninori Morimoto   2020-04-01  235  
9e8593ec9ef74a Kuninori Morimoto   2023-01-23  236        "#address-cells":
9e8593ec9ef74a Kuninori Morimoto   2023-01-23  237          const: 1
9e8593ec9ef74a Kuninori Morimoto   2023-01-23  238        "#size-cells":
9e8593ec9ef74a Kuninori Morimoto   2023-01-23  239          const: 0
79149fb835d762 Kuninori Morimoto   2020-04-01  240        # common properties
79149fb835d762 Kuninori Morimoto   2020-04-01  241        frame-master:
79149fb835d762 Kuninori Morimoto   2020-04-01  242          $ref: "#/definitions/frame-master"
79149fb835d762 Kuninori Morimoto   2020-04-01  243        bitclock-master:
79149fb835d762 Kuninori Morimoto   2020-04-01  244          $ref: "#/definitions/bitclock-master"
79149fb835d762 Kuninori Morimoto   2020-04-01  245        frame-inversion:
79149fb835d762 Kuninori Morimoto   2020-04-01  246          $ref: "#/definitions/frame-inversion"
79149fb835d762 Kuninori Morimoto   2020-04-01  247        bitclock-inversion:
79149fb835d762 Kuninori Morimoto   2020-04-01  248          $ref: "#/definitions/bitclock-inversion"
79149fb835d762 Kuninori Morimoto   2020-04-01  249        format:
79149fb835d762 Kuninori Morimoto   2020-04-01  250          $ref: "#/definitions/format"
79149fb835d762 Kuninori Morimoto   2020-04-01  251        mclk-fs:
79149fb835d762 Kuninori Morimoto   2020-04-01  252          $ref: "#/definitions/mclk-fs"
79149fb835d762 Kuninori Morimoto   2020-04-01  253        aux-devs:
79149fb835d762 Kuninori Morimoto   2020-04-01  254          $ref: "#/definitions/aux-devs"
79149fb835d762 Kuninori Morimoto   2020-04-01  255        convert-rate:
79149fb835d762 Kuninori Morimoto   2020-04-01  256          $ref: "#/definitions/convert-rate"
79149fb835d762 Kuninori Morimoto   2020-04-01  257        convert-channels:
79149fb835d762 Kuninori Morimoto   2020-04-01  258          $ref: "#/definitions/convert-channels"
79149fb835d762 Kuninori Morimoto   2020-04-01  259        prefix:
79149fb835d762 Kuninori Morimoto   2020-04-01  260          $ref: "#/definitions/prefix"
79149fb835d762 Kuninori Morimoto   2020-04-01  261        pin-switches:
79149fb835d762 Kuninori Morimoto   2020-04-01  262          $ref: "#/definitions/pin-switches"
79149fb835d762 Kuninori Morimoto   2020-04-01  263        hp-det-gpio:
79149fb835d762 Kuninori Morimoto   2020-04-01  264          maxItems: 1
79149fb835d762 Kuninori Morimoto   2020-04-01  265        mic-det-gpio:
79149fb835d762 Kuninori Morimoto   2020-04-01  266          maxItems: 1
79149fb835d762 Kuninori Morimoto   2020-04-01  267  
79149fb835d762 Kuninori Morimoto   2020-04-01  268      patternProperties:
cbf74baf022199 Krzysztof Kozlowski 2023-01-09  269        "^cpu(-[0-9]+)?$":
79149fb835d762 Kuninori Morimoto   2020-04-01  270          $ref: "#/definitions/dai"
cbf74baf022199 Krzysztof Kozlowski 2023-01-09  271        "^codec(-[0-9]+)?$":
79149fb835d762 Kuninori Morimoto   2020-04-01  272          $ref: "#/definitions/dai"
79149fb835d762 Kuninori Morimoto   2020-04-01  273      additionalProperties: false
79149fb835d762 Kuninori Morimoto   2020-04-01  274  
79149fb835d762 Kuninori Morimoto   2020-04-01  275  required:
79149fb835d762 Kuninori Morimoto   2020-04-01  276    - compatible
79149fb835d762 Kuninori Morimoto   2020-04-01  277  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

