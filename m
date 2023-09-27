Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224A11C681
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 13:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695823076; x=1727359076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FNt07jctW5tDcPIlfEvtKbpACd4SDdiQSaEzjkQjGOk=;
  b=LwcvUPMLaWXdxOBlKu6JEONcsZo8lHPiba01AFYmL+5yWuq+Uj9IGsDK
   t/ccsDlKkrlCS+OxcRv24fwN+DvOWm1NeDA25Rs/lZq/cktZxLmXHBwv+
   U16dC1yV89c8VIbBNtXRoDeEi+6wA9QLLXlVlTxFqpKgwHD7fz5KA7dKk
   Cf9hHA/7riXxOoxEkcyJM5pkj+UD7Cj0sM2l92MEyzSxy5QFkLPHDUezG
   PaEecxRPKmc67MgD0eNuCS97no/va9Q3XC2PeJXS4UkNh5B6OVPWMLyCG
   Tt2Tk4zw7eexr0+a9haF6q/F1MXjTo6mTqwlEtNGCZoDV8TbP1O+lqs7W
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="426121"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="426121"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 06:57:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="814871764"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="814871764"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Sep 2023 06:57:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 06:57:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 06:57:53 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 06:57:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esvciHYc0ss/imjxyvtinTk1zmBSdI80LMaHhKjGuPVj0JE43rD/pfECg4HLriY0VX5qhIu2GSfshWqVHCKJnebBnSW6E8+ZVw+rkDBPFzuruJ6cET9tWFAqFoc5zrVFsDFz2Z8ayVlPjfkFOkSD7oOD3Uma2xGv3kkB3gLFphQiD7rlLMEG+V/z5J0+CHXratscDVIkkgPrCMNtH6RY7Hx9d79kz9SpKZ/XEWfvFqNWaEtg3ks1aKWxvG4lC7kNwXksh7+9MRCgzKahXTfRqNolmQFjAvGQIgA7EY7UNj+CRhgblJguW2TmJqLglcj/K9Ttn+QJ9WBsdKiSsAnM7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxFNw3BUuz1Qnb0WLszO5Qjx9t9CV+QfoGvBSFD7xL8=;
 b=KdN+MQdIb512JLocGiM7HtEB4AIazV0P8ICehe007a7BN0BKGQI1gs1FbF+Z97DjQ0XrVzAyfcQlfIbWQUcY28jvEH44eePVoOrBQaNP6/OU6Z7QDPoi2gyrZFxTy944BLKRxFG/Hb+VJR+TeZ2U7s0MFZNGEl2p6OyBigL4JjjRtdNMws27MEq5SSxR5sq9TK1PyivJUhAyXgEdAyGTQBZv8RIKinw6a5YsO05eL+c+86LWL3TBAHaJeA8mwp7zavn3R/zotZfIiYIKJ9OkuM3CHphQWcs3HzlICeqt92idxySEAhns7mn1TJjW0v21p7GZnQ0Vj1eQWMwCKFXMiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3006.namprd11.prod.outlook.com (2603:10b6:805:d1::24)
 by DM4PR11MB6454.namprd11.prod.outlook.com (2603:10b6:8:b8::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.28; Wed, 27 Sep 2023 13:57:50 +0000
Received: from SN6PR11MB3006.namprd11.prod.outlook.com
 ([fe80::b2f6:ff19:be0b:362d]) by SN6PR11MB3006.namprd11.prod.outlook.com
 ([fe80::b2f6:ff19:be0b:362d%7]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 13:57:50 +0000
Date: Wed, 27 Sep 2023 21:57:41 +0800
From: kernel test robot <philip.li@intel.com>
To: Lukas Wunner <lukas@wunner.de>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [l1k:tpm 2/2] dtbs_check:
 Documentation/devicetree/bindings/reset/infineon,slb9670-reset.yaml:29:111:
 [warning] line too long (124 > 110 characters) (line-length)
Message-ID: <ZRQ01bFvbJ4p54fz@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0167.apcprd04.prod.outlook.com (2603:1096:4::29)
 To SN6PR11MB3006.namprd11.prod.outlook.com (2603:10b6:805:d1::24)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3006:EE_|DM4PR11MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d16f126-c33f-43ce-fb9a-08dbbf61bcd2
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PZy/SxmkW2eA6VPLKL65OhJg78QEUH1N8OHNQZ52p/NJwu9FKWe/kXcYoe0JdtPBeIoll3fZa25d2c1xRcZVERbUXWHCO+ZlKd1p38yIHO5Hewk58aTy+c8yYJVX9oeJzLM2+bY8z4uPDsYIPGCAC2d3PRHTSx64wjleae+MzvcJHtVq3QVYyfmk41NGJN5jSNmqlWaepiYJz6HCDB3fb6uEvciCXGMHbrRRbJZebHV2CPsJpp1kSdtzuFfxWpYwr2c4PRVgEkHxlBf6EXcorCO+ejf5anUyblC5J9ObyGLoaRx3J8Ro4Zs0jSDRs32jwi7FiYPJISg7bwwxWcEP0aNbyW74ctJ7t0c8auaKtP7uNk/qf92DIHMdbTyjTgPvN+Ww9TvjnVbbgX3GoiZ0kF87aVhrNGTKqwHu39w1KcZnp08wPK/4BZhrdjQcNvyytanzb6O+eI4RN59W8cR9P/4dWUttcATQVQT/CCSZ4nnYYkiVIwkjhUnkcefYPcd203UlPSKAjS9xMXMzyYRvL3DI3n/OFiV87X1g7I6wQ4a9TDcE1TTop5TkLPpjG6CejOUACBCbz7c53DyHEFHvVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(346002)(39860400002)(396003)(376002)(136003)(230922051799003)(451199024)(186009)(1800799009)(6486002)(6506007)(6512007)(9686003)(86362001)(82960400001)(38100700002)(5660300002)(2906002)(4326008)(966005)(6666004)(478600001)(66556008)(83380400001)(8676002)(66476007)(8936002)(26005)(41300700001)(66946007)(33716001)(6916009)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oiPSKGpVD1XsWPUqBEPk2JQMipNQ9pHbHTm628lFESKzMUugmW2UvYXTqQR3?=
 =?us-ascii?Q?7k4E8CicvIPGtLt796Atu+rCgg2yIpq0LNNvqEjMYW3ksDdNHSYx2+kPVI8N?=
 =?us-ascii?Q?fZ1O1YsZQiFVW93ZFKlUCp8Z609vS26TaSah2UP5vbBfZiOP+LTQ4udP7t58?=
 =?us-ascii?Q?O9QPKo38qs5lOwGNrQP4W1huW86/W0colQIXO5NGp3GNO94Zm8YV/rZG04v5?=
 =?us-ascii?Q?VUBzGs0qmiQ7d5IC31fCsXxqEc5+9xvQIwsbXsUYozepp7lHhJnYcR6ooBWI?=
 =?us-ascii?Q?o3N9dwCbh+1QMKVhClhIYvnIKHiQ2UpZBbS8bXB0v1+3nsRgsgBUT6sXFGRZ?=
 =?us-ascii?Q?rBSF+6InDzctBVYDows6Ea9xcnP1OdwCteKofh4VqpphB4tNfSeWk0iK2Rit?=
 =?us-ascii?Q?kR6S3VAKuutPs30Ji1+cZxyFHnAxGTQ1cGWPBrUYR09dgzZkC1gviGKuZMAX?=
 =?us-ascii?Q?XeP/w/bxUmvQ4+KxnTjYdTi0CZZYDPQz8IyDygM0gr+o+YsiPjNL6+N5Y/ZX?=
 =?us-ascii?Q?+mp4rDVWXRZqaKUzaHfpaUm7gRLg1IpiEDN+LHLutVNrTOhyqTzbToMosnq1?=
 =?us-ascii?Q?miv3wGY+8BXJLgqQ+gBCcWsDbRezwfYuNlGGVztQWE4NN8fPvrDJKFhNj6Fi?=
 =?us-ascii?Q?EDeqPTcyR9p2o1j+EgEKdDM1fjuTy0l27MFbox87Dajmtog+HyAm46+eucUl?=
 =?us-ascii?Q?ZtD7jbMipUSgCuW1yrKWx0p5HjG2/1jIuG3kICRhwcOjOOjoCZNG2+17oAI0?=
 =?us-ascii?Q?wPDgKfuo4nDXblwx8lNAYRo+rpzVqsVx9K7o1J6ZmKDdTykEV8d7YzBEZoze?=
 =?us-ascii?Q?H6k5FkJaHrMiGxjd/TLqiFLdl56+H67iWimK1MtkVipoLEtAWM63L1vwuc/U?=
 =?us-ascii?Q?oL8dBN1aYsTpSMNWw3NkqAIyxf36lECcOgXul2Bsu2rHRPQw7vVOgrYVgLsp?=
 =?us-ascii?Q?43k9NkYR9DG2Teq6NouxkhQV8Tj3Qfp0L67pIE9cybg8rpAP9bvmk1TU8+89?=
 =?us-ascii?Q?lrinQf+t9LhVPMdsNyyz1DLFlnbD8hb9tKXNR3JnlviDpfs7UkbaANgcB+cV?=
 =?us-ascii?Q?F1VhGbB7Pa2Stgni9vNRgBR2jHlEzTQIiELtYrVkUh/Ihk/bxl7ts64DYaeP?=
 =?us-ascii?Q?sms9nSIkXzrqvcLio5wpL6dbr8T2F1DtBujLHKA+0fZip8UFL+77psJ0rMTt?=
 =?us-ascii?Q?O0TR0dIivllJMC340MdejPYEYnjntckE3cOT1ElLvJQCzJEV2HiV5iRF1596?=
 =?us-ascii?Q?BCTr0/9iB/CiUXFWhIzX/K0Ya80XhZ9aH9hJiwYfSqPpQ4XIFw9tb4cbR3Rl?=
 =?us-ascii?Q?0RwHJ2b1ZBtbE1hAIYqcBoejyUrKJEbeIlQMNXanXWZkiXvru4yw7QUGKGeK?=
 =?us-ascii?Q?21/oICZroBJ5KjZe/WKMeTNmOdkyb95A+Y/VfWkQwwTJgEwCbDKHLajuOk3M?=
 =?us-ascii?Q?comqQxnKEMUgoPaUKjykPO8VHOcDYa1909C6A3xgByo4bPB8iQppPngTAnQ4?=
 =?us-ascii?Q?tU2e7lPDxAiBCJpV6+8p2OInUMByMf86AEk6eJcwkqIHB5MLL4gunDAc+Ku5?=
 =?us-ascii?Q?KZI1IqoBl9PmVHPg2FlIiCcDKSnqQJx7bOsjQ3m5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d16f126-c33f-43ce-fb9a-08dbbf61bcd2
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 13:57:50.6524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OoZfHn+HESbUs2d9fdHbVB4fVnREECjVctutuC6gPHMuvp58cEUEmoOCwNxb3MxP+NDc5AN/7Unq59s1grgTTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6454
X-OriginatorOrg: intel.com

tree:   https://github.com/l1k/linux tpm
head:   3872d25bd384f7ec706b0869844a12f21839c2af
commit: 3872d25bd384f7ec706b0869844a12f21839c2af [2/2] dt-bindings: reset: Add Infineon SLB9670 TPM reset driver
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230923/202309231433.VxXJTkng-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309231433.VxXJTkng-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/reset/infineon,slb9670-reset.yaml:29:111: [warning] line too long (124 > 110 characters) (line-length)

vim +29 Documentation/devicetree/bindings/reset/infineon,slb9670-reset.yaml

3872d25bd384f7e Lukas Wunner 2023-09-23   8  
3872d25bd384f7e Lukas Wunner 2023-09-23   9  maintainers:
3872d25bd384f7e Lukas Wunner 2023-09-23  10    - Lukas Wunner <lukas@wunner.de>
3872d25bd384f7e Lukas Wunner 2023-09-23  11  
3872d25bd384f7e Lukas Wunner 2023-09-23  12  description: |
3872d25bd384f7e Lukas Wunner 2023-09-23  13    The Infineon SLB9670 Trusted Platform Module requires a specific reset
3872d25bd384f7e Lukas Wunner 2023-09-23  14    sequence on its RST# pin which is documented in sections 5.4 and 5.5 of
3872d25bd384f7e Lukas Wunner 2023-09-23  15    the datasheet [1]. This driver performs the reset sequence using a GPIO.
3872d25bd384f7e Lukas Wunner 2023-09-23  16  
3872d25bd384f7e Lukas Wunner 2023-09-23  17    The sequence with minimum wait intervals is as follows:
3872d25bd384f7e Lukas Wunner 2023-09-23  18    deassert RST#
3872d25bd384f7e Lukas Wunner 2023-09-23  19    wait at least 60 ms
3872d25bd384f7e Lukas Wunner 2023-09-23  20    assert RST#
3872d25bd384f7e Lukas Wunner 2023-09-23  21    wait at least 2 usecs
3872d25bd384f7e Lukas Wunner 2023-09-23  22    deassert RST#
3872d25bd384f7e Lukas Wunner 2023-09-23  23    wait at least 60 ms
3872d25bd384f7e Lukas Wunner 2023-09-23  24    assert RST#
3872d25bd384f7e Lukas Wunner 2023-09-23  25    wait at least 2 usecs
3872d25bd384f7e Lukas Wunner 2023-09-23  26    deassert RST#
3872d25bd384f7e Lukas Wunner 2023-09-23  27    wait at least 60 ms before issuing the first TPM command
3872d25bd384f7e Lukas Wunner 2023-09-23  28  
3872d25bd384f7e Lukas Wunner 2023-09-23 @29    [1] https://www.infineon.com/dgdl/Infineon-SLB%209670VQ2.0-DataSheet-v01_04-EN.pdf?fileId=5546d4626fc1ce0b016fc78270350cd6
3872d25bd384f7e Lukas Wunner 2023-09-23  30  
3872d25bd384f7e Lukas Wunner 2023-09-23  31  properties:
3872d25bd384f7e Lukas Wunner 2023-09-23  32    compatible:
3872d25bd384f7e Lukas Wunner 2023-09-23  33      enum:
3872d25bd384f7e Lukas Wunner 2023-09-23  34        - infineon,slb9670-reset
3872d25bd384f7e Lukas Wunner 2023-09-23  35  
3872d25bd384f7e Lukas Wunner 2023-09-23  36    reset-gpios:
3872d25bd384f7e Lukas Wunner 2023-09-23  37      maxItems: 1
3872d25bd384f7e Lukas Wunner 2023-09-23  38      description: Reference to the GPIO connected to the RST# pin.
3872d25bd384f7e Lukas Wunner 2023-09-23  39  
3872d25bd384f7e Lukas Wunner 2023-09-23  40    "#reset-cells":
3872d25bd384f7e Lukas Wunner 2023-09-23  41      const: 0
3872d25bd384f7e Lukas Wunner 2023-09-23  42  
3872d25bd384f7e Lukas Wunner 2023-09-23  43  required:
3872d25bd384f7e Lukas Wunner 2023-09-23  44    - compatible
3872d25bd384f7e Lukas Wunner 2023-09-23  45    - reset-gpios
3872d25bd384f7e Lukas Wunner 2023-09-23  46    - "#reset-cells"
3872d25bd384f7e Lukas Wunner 2023-09-23  47  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

