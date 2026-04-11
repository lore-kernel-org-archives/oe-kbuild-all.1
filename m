Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1434020E334
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 00:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775867700; cv=fail; b=rLzi39vj4jCQvjm4rgxC50TN4MbF1SV/k/gJZx/cg4V5jks6f43pn0xYxsRab4fVpIF38BYAJ7a82D1kQK9ZzydJYEh5+tkFUogzEBtN5bFAfNm8ZISsbDRdbCfWsvweKuTj568Fxwxd0BGcSxCv5x4weqJ7zb4ns0fsB/QssN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775867700; c=relaxed/simple;
	bh=xUbn9J1jiCMoTIlspS61o14t37YA4bgnKY1L9r3bots=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=j5gzSGdgw2j3Xf1cjhNM2UhguSK7HZdokqakB+nPDf/0WeGoVeX+f/XRkFy8Bq7QQ0GQIU/SAwCQybpWuWmHkuaSTcI16B3WK/QET9Adsu7fpCh72aSJOVVogmBIBld/lyDFVTr56F02F/IhcWs9l+FyxIHhoh7d4UdsIG/OhZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d4ijjdxJ; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4ijjdxJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775867696; x=1807403696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xUbn9J1jiCMoTIlspS61o14t37YA4bgnKY1L9r3bots=;
  b=d4ijjdxJnXyUpdRxvnKJrVy27ARnJZ3c+/McE8JUIJmhY2dUqfLJVs4Y
   9E8cZI5xYfQRGY7K/SAYfvdKxTfIWQgLzdVu79lDyOnBrnTqNMSuhkhOM
   pzlljPT3OrRXb4xmQiD1bVyg10Gw/I1jHvqw2f2HZsMpuy2wDcxvcPcsZ
   md238BQPXq60z3J1C12fh6ZkDfixMDTGnSPkNDL3+y6C9Iqm2cytIxwvn
   iYD1C1mAdTV6snYbWVZ37gHH2aOd6tqxsQy2wuMFGAk9mnzlg4tRWguXt
   X3YVBb7HGy2j47Tv4uS/iQueQ6vGl9YbXETE4IrMHtzsYGkEa79u259Wz
   g==;
X-CSE-ConnectionGUID: NjsPheRLQhm/LtRDnoW9Ag==
X-CSE-MsgGUID: a+DydWx8RsSmd+9jRZKA9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76964025"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="76964025"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 17:34:55 -0700
X-CSE-ConnectionGUID: S2IYT78bS36kSTEmJ/lCcw==
X-CSE-MsgGUID: peWGGVBURo2bWNcRtH553Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="259711026"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 17:34:55 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 17:34:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 10 Apr 2026 17:34:54 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.20) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 17:34:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kjRvikgct2xdy3XUrw9kggp58uELz2c6/IcCHPRAF4YHu7kwzBbTkXkiHy4hDDRbpEfEHF1wgHEEtQ5wTy13DhZ7qRXJjCZvFHa+ltPkrBbjxZrwpS5Ub11CC5mt+TexBNmT7rAUIP3na9Z38/K8jpfJpRwJaalx3fPr/UOn+TJuPfbyO+qQce0hwaFoLMMgqKiFDhbkHSgsQhsz4Ypb8m6wiulsrecivENn+BIZ+TU/EzumlWS/q44aMw0u5t7AyUGntWWHiU69KF+Wi0J52yEagX1L9QKtr4Qps/0o9BzwqdPEgUvd+y5lEF/ac2zI8vNqFWKJL0qhp22vDyQKbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJFJBayVWB06luThmSHKcxMp4CB+5oTBIF9P6Peznuo=;
 b=AwFKNGDRIII9yCWbS6unSKFzts3LDZF9OFUgsLvKwmHHzD9a5V2uxtAaij111yxLqIiVfp2ClEAVHUbHsyqb+MphFRezUlE66wFZkFOZBHVPrfT/A5PWK3pTesi9zNNbYyHnSSKnUFWENSEQjbOJUwGPT4SiSKdR3/fNkBh/1CZD7+ta/aXt3feR0yjlbwsbkU5Z7nqcqgeabuQDqeCEWk7Rum8wHkHj9S8V0GxYB7Uczl75P2+37RwiqESzal2fngA2M/XsOe0hBRDZRrWZP01WOQgqR43e/VJX5IPSAZcjmMTR7f0JfAZKRFuKqb6Pf6Xj4vNY4pmFRvcZ7XoYfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by DM3PR11MB8760.namprd11.prod.outlook.com (2603:10b6:0:4b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Sat, 11 Apr
 2026 00:34:44 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 00:34:44 +0000
Date: Sat, 11 Apr 2026 08:34:36 +0800
From: kernel test robot <lkp@intel.com>
To: Drew Fustini <fustini@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, Adrien Ricciardi
	<aricciardi@baylibre.com>
Subject: [fustini:b4/ssqosid-cbqri-rqsc 15/19] include/linux/bits.h:48:20:
 warning: left shift count >= width of type
Message-ID: <admXHGhkwOMFV28A@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0165.apcprd04.prod.outlook.com (2603:1096:4::27)
 To BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|DM3PR11MB8760:EE_
X-MS-Office365-Filtering-Correlation-Id: 9135539e-1a3e-4684-a072-08de9762204e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: Z3RsWcogMS9a8b6ZYPbxhCViixac3kXix4oZSHpx6JWNQsR+hNNeQQn6c5cV96ed2tKFXUxk1yhutHNN13e5QEt0IvXosnoXcWkcgSDYfAZ3EWDiLnF/RSoFgyeOhuEUm00b/jf56q9FEK+nWrkMgw03pvZ7nowbwfE/45/lhAp5It9Ka2FOeLzedqWqsTSV00bLBXGu5yVe/5S6aEaQoDDrRnu2MqJCykWlgwQ+C1VEjrHOi+rSl5cryzKU+l89H9NlDehgYUkgAwQAybGLZtJEQQr04IKyGB8vrUSxW2bYSZ1bE81qJdxSjLC0EVaDGI77UAcHkyZYI496iZFfXInk7OqT4MES0AM4BCEq6hoWQVYm7SFcdpCxQiYpb6NuQhvtFDpSKOlIYG6Fv7ZOp5CTWj0s5TyjdLPkDPS91ScEypP7XmfA8X1dReyDBlyFH79WQtfqDLUAE5ch5hC1BlWKxn0D5ODWwO1JhXMYlqji7fYJz8LnRV+YGJaCPzSRY+wDoPwlvYlzbtMpcp/0AopArL5kYSR/vK7JbGA5N0Zo64BJmsJDEBP4WlwEc9Aos3p43NyFYxHtSkvx0gfJ0Rsu3NF4DsAqm2ibjifgclvTgmndqXGmL142Np/fHqE0e1Ztsi4/3vk853jFKraY0QCrJk+j13DPORBtI8yFYSnj9TuVySb0XdDKKGj9SmH1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cuche+PKXDvB4Z+yrag9shnS6ggQJljUqakeQk0B92rNp4A1bhr+WxXG6x7F?=
 =?us-ascii?Q?jA1NMKeWiS/NGiTU1BgTFflZgqqEsJzAoMs/jdCOWGKWE7TI43mdR4Dxd07q?=
 =?us-ascii?Q?95jxxQzeENcJ6IULXu0VH+icfZY34bFxaUGL0PDHadKQ6sZm3R7nMNo4wUSS?=
 =?us-ascii?Q?0MT1BzcQmuTN71whGMf4aixNBcequz3hu535Wu5oDE9NEncjjWlUXEdNSibT?=
 =?us-ascii?Q?74BIl5KiKsvSzkQnoJ8+kEPyLweOH/WX+GtgKndU5Rg0abI6ZR7+dYy4DJ9A?=
 =?us-ascii?Q?v/rAOFZasoPfZDDQYalZ/y028G8HBxXxNDLRiZOjGPS8koneE3ssp3r51mTq?=
 =?us-ascii?Q?sISB/fx2EmIVLayY4hgAl7rP7as6Q4huWfcqdmJQ5stc0H+ljzgmfSPUtzCd?=
 =?us-ascii?Q?z5JjdeY/ciZ1elSkwdp2uOemq4r0fgU2/aS5SrJAWGmYIOTnVc5MwFHDlfOY?=
 =?us-ascii?Q?kHBBQkAXhBm1UWkQeIwKYc4fAUAwScnBxzJAPu4twUSOwHvvjUzuHScX9frR?=
 =?us-ascii?Q?A/8km+xMjTcNZ81hi/HUNheT1r1iFKPDDOWXPs/SDNCGzuDjP26x2k/Rsop/?=
 =?us-ascii?Q?zD6Eei2+ad130IoSJw5Yr89w9ECf/woKYCjDxbOvEjyhK8S98BcWFH4qtWVt?=
 =?us-ascii?Q?WQOB44DMFd8NBko8SS/KN0wL2s49mk9M5lM/RZfUG4mOb2KBs/MG0OMifTNj?=
 =?us-ascii?Q?vrTlsxWqbm8coArC2z9aE3ykz1Ij92w6IaK+gJQ1I84f2hc6ibIupqYFeupP?=
 =?us-ascii?Q?AynIwqEdzBQ52w40jJR5Xli9LSMX45Mw1DzcQF3SQZyQQa40oaktHaTUPKp1?=
 =?us-ascii?Q?s8/qABCFfqqmXnlpbDUXnozBb5nxyGrbREuABI/W/6rpDVHlw6hEiOg3BEfo?=
 =?us-ascii?Q?bHf7fvhSOMcLsaqw07bAv3ntlewuuT3IXII9jn1aUkF32NCKqAvgVIIwJi5p?=
 =?us-ascii?Q?S9diEEUZii3vpE7X8UGE6HX0/o9MXji4YAowDOIXpZL2vfRRsQyMKrMnQhtg?=
 =?us-ascii?Q?gdcp2lPaEAnc8HTl6T24QiDiyee6hxkJfhevM9X1E8r2LdNnTXQwNgvFOfzc?=
 =?us-ascii?Q?N5mMXR2CcUa809YHkNBUuBvSwWv04aIFd9OngzcB/kg03tH+tzfSUTTq9EPw?=
 =?us-ascii?Q?iXGn99SUfJ5pug26Hlgaz41ewuIv4u4a+O1GGvMqDsScHvpEhX2m+tlgiKXj?=
 =?us-ascii?Q?3WqBkG3FL+YZ4eXgpORmQ/PmJFQysnd35ti6DCt8L7mjgBEsHN+4U6kM9kZ3?=
 =?us-ascii?Q?czx4q2dc9YSWTO5x6GLQcxgPS4n4RZ2Va9M8aUCfpN7PA8xLVJv4eD4ovDXj?=
 =?us-ascii?Q?9mCXxq6KB3Q+xVs0fPVgeJy4QnJ13/SX5u/rUI748JyF4pw4ki2nNlgcxb71?=
 =?us-ascii?Q?0mSRi3LMFp0G/OV40z3zGwreepkVw7ts143jF7MOVstltC9ppZ4PwRGNDXam?=
 =?us-ascii?Q?Elt2zK147tzQpgs0sdDl5XES9MljHU56fxJkCWq/OxigEc6xp6I28vfHIDCL?=
 =?us-ascii?Q?6Xc6PAkS0GwK/9JT97D+CiAKqD+XsmahcrZwGMswXk3ovpfTxCB57kfIwfkI?=
 =?us-ascii?Q?vzZVefC90aTrK4kdxPhFtosSuAipTe3dIeH4f08sjMwwcs2gAKTumNVpkGK4?=
 =?us-ascii?Q?a+Abol4UJoyQgTemP4YMEmp3tte6o5aRzkDllv4uaSWsfoSuXFpzpmW4HFLx?=
 =?us-ascii?Q?FjGzaDyVy0FI06I75FvrO56w1OyI5EamBNtfZDm3soGzQr5HmVSG0ooxCMqk?=
 =?us-ascii?Q?e8vazA4WOQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: MjClobHnLdA2hracnainz1J7KKgCHxjVc0oYJ2BJKCyVbum3k6WjuWMdRvdw97WSUgqpEfB287Pu3xplRg3ZEKYrDry5HUSMMzHb0OHSN1ROwgdNVITmRek15zVtHYwSJwNTb1AKpoz4LC31JoKjQTFQdzaS18WGZBPUl9M0nfiCpGbGlsGJnSVzL+rX0SElHgQKu4xX50OsbHBOZjGbPKtrQmzsZ7rf/UdG/rpNVfVbBiCJ2N4h3p0/9iCEWXVmxocPAgXLBUs+TxV0UpdBMgpN2i7dGtVq7WzURlrUQsTuxfdvHYpOhP/3hZUgQuCQB0YmHVua4D3wF1arxGWIjA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9135539e-1a3e-4684-a072-08de9762204e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 00:34:44.3448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iRAKsg2/KJW2BqThKrWtJPaXVky77uLPbBfJoei3EZtry4SGxZ+mdcR4quETuzESnvtMSj1VQsXsWLQlZwbZfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8760
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git b4/ssqosid-cbqri-rqsc
head:   11e30be7cbd915592685a3e18bcf53f4ff0c94f7
commit: bfd6a2f1cb6b4fd665530e33c5452f95040e86e6 [15/19] RISC-V: QoS: add to build when CONFIG_RISCV_ISA_SSQOSID set
config: riscv-randconfig-001-20260410 (https://download.01.org/0day-ci/archive/20260410/202604102136.uRJQobPn-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604102136.uRJQobPn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604102136.uRJQobPn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/kernel/qos/qos_resctrl.c: In function 'cbqri_set_cbm':
   arch/riscv/kernel/qos/qos_resctrl.c:40:2: error: implicit declaration of function 'iowrite64'; did you mean 'iowrite32'? [-Werror=implicit-function-declaration]
     iowrite64(cbm, ctrl->base + reg_offset);
     ^~~~~~~~~
     iowrite32
   arch/riscv/kernel/qos/qos_resctrl.c: In function 'cbqri_set_rbwb':
   arch/riscv/kernel/qos/qos_resctrl.c:50:8: error: implicit declaration of function 'ioread64'; did you mean 'ioread32'? [-Werror=implicit-function-declaration]
     reg = ioread64(ctrl->base + reg_offset);
           ^~~~~~~~
           ioread32
   In file included from <command-line>:
   arch/riscv/kernel/qos/qos_resctrl.c: In function 'cbqri_wait_busy_flag':
>> include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >  \
     ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:19: note: in expansion of macro '__bf_cast_unsigned'
     BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >  \
                      ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:177:3: note: in expansion of macro '__BF_FIELD_CHECK_REG'
      __BF_FIELD_CHECK_REG(_mask, _reg, "FIELD_GET: "); \
      ^~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >  \
     ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:19: note: in expansion of macro '__bf_cast_unsigned'
     BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >  \
                      ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:177:3: note: in expansion of macro '__BF_FIELD_CHECK_REG'
      __BF_FIELD_CHECK_REG(_mask, _reg, "FIELD_GET: "); \
      ^~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:69:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero"); \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:69:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero"); \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:71:19: note: in expansion of macro '__bf_shf'
         ~((_mask) >> __bf_shf(_mask)) & \
                      ^~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:71:19: note: in expansion of macro '__bf_shf'
         ~((_mask) >> __bf_shf(_mask)) & \
                      ^~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bitfield.h:71:16: warning: right shift count is negative [-Wshift-count-negative]
         ~((_mask) >> __bf_shf(_mask)) & \
                   ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
>> include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
     ^~~~~~~~~~~~
   include/linux/bitfield.h:74:3: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +   \
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
     ^~~~~~~~~~~~
   include/linux/bitfield.h:74:3: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +   \
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
     ^~~~~~~~~~~~
   include/linux/bitfield.h:74:3: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +   \
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:75:21: note: in expansion of macro '__bf_shf'
               (1ULL << __bf_shf(_mask))); \
                        ^~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
     ^~~~~~~~~~~~
   include/linux/bitfield.h:74:3: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +   \
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:75:21: note: in expansion of macro '__bf_shf'
               (1ULL << __bf_shf(_mask))); \
                        ^~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bitfield.h:75:18: warning: left shift count is negative [-Wshift-count-negative]
               (1ULL << __bf_shf(_mask))); \
                     ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
     ^~~~~~~~~~~~
   include/linux/bitfield.h:74:3: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +   \
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
>> include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
     ^~~~~~~~~~~~
   include/linux/bitfield.h:74:3: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +   \
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
     ^~~~~~~~~~~~
   include/linux/bitfield.h:74:3: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +   \
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
     ^~~~~~~~~~~~
   include/linux/bitfield.h:74:3: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +   \
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:75:21: note: in expansion of macro '__bf_shf'
               (1ULL << __bf_shf(_mask))); \
                        ^~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
     ^~~~~~~~~~~~
   include/linux/bitfield.h:74:3: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +   \
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:75:21: note: in expansion of macro '__bf_shf'
               (1ULL << __bf_shf(_mask))); \
                        ^~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bitfield.h:75:18: warning: left shift count is negative [-Wshift-count-negative]
               (1ULL << __bf_shf(_mask))); \
                     ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
     ^~~~~~~~~~~~
   include/linux/bitfield.h:74:3: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +   \
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   In file included from arch/riscv/kernel/qos/internal.h:5,
                    from arch/riscv/kernel/qos/qos_resctrl.c:15:
>> include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/bitfield.h:98:28: note: in definition of macro '__FIELD_GET'
      (typeof(mask))(((reg) & (mask)) >> __bf_shf(mask)); \
                               ^~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/bitfield.h:98:28: note: in definition of macro '__FIELD_GET'
      (typeof(mask))(((reg) & (mask)) >> __bf_shf(mask)); \
                               ^~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/bitfield.h:47:38: note: in definition of macro '__bf_shf'
    #define __bf_shf(x) (__builtin_ffsll(x) - 1)
                                         ^
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/bitfield.h:47:38: note: in definition of macro '__bf_shf'
    #define __bf_shf(x) (__builtin_ffsll(x) - 1)
                                         ^
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:98:35: warning: right shift count is negative [-Wshift-count-negative]
      (typeof(mask))(((reg) & (mask)) >> __bf_shf(mask)); \
                                      ^~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   In file included from <command-line>:
   arch/riscv/kernel/qos/qos_resctrl.c: In function 'cbqri_cc_alloc_op':
>> include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >  \
     ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:19: note: in expansion of macro '__bf_cast_unsigned'
     BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >  \
                      ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:177:3: note: in expansion of macro '__BF_FIELD_CHECK_REG'
      __BF_FIELD_CHECK_REG(_mask, _reg, "FIELD_GET: "); \
      ^~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:11: note: in expansion of macro 'FIELD_GET'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
              ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:40:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_STATUS_MASK  GENMASK(38, 32)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:21: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_STATUS_MASK'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >  \
     ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:19: note: in expansion of macro '__bf_cast_unsigned'
     BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >  \
                      ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:177:3: note: in expansion of macro '__BF_FIELD_CHECK_REG'
      __BF_FIELD_CHECK_REG(_mask, _reg, "FIELD_GET: "); \
      ^~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:11: note: in expansion of macro 'FIELD_GET'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
              ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:40:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_STATUS_MASK  GENMASK(38, 32)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:21: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_STATUS_MASK'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:11: note: in expansion of macro 'FIELD_GET'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
              ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:40:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_STATUS_MASK  GENMASK(38, 32)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:21: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_STATUS_MASK'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:11: note: in expansion of macro 'FIELD_GET'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
              ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:40:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_STATUS_MASK  GENMASK(38, 32)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:21: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_STATUS_MASK'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:69:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero"); \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:11: note: in expansion of macro 'FIELD_GET'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
              ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:40:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_STATUS_MASK  GENMASK(38, 32)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:21: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_STATUS_MASK'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:69:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero"); \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:11: note: in expansion of macro 'FIELD_GET'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
              ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:40:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_STATUS_MASK  GENMASK(38, 32)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:21: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_STATUS_MASK'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:11: note: in expansion of macro 'FIELD_GET'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
              ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:40:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_STATUS_MASK  GENMASK(38, 32)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:21: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_STATUS_MASK'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:11: note: in expansion of macro 'FIELD_GET'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
              ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:40:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_STATUS_MASK  GENMASK(38, 32)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:21: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_STATUS_MASK'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:71:19: note: in expansion of macro '__bf_shf'
         ~((_mask) >> __bf_shf(_mask)) & \
                      ^~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:11: note: in expansion of macro 'FIELD_GET'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
              ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:40:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_STATUS_MASK  GENMASK(38, 32)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:21: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_STATUS_MASK'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:71:19: note: in expansion of macro '__bf_shf'
         ~((_mask) >> __bf_shf(_mask)) & \
                      ^~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:11: note: in expansion of macro 'FIELD_GET'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
              ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:40:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_STATUS_MASK  GENMASK(38, 32)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:21: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_STATUS_MASK'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bitfield.h:71:16: warning: right shift count is negative [-Wshift-count-negative]
         ~((_mask) >> __bf_shf(_mask)) & \
                   ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:11: note: in expansion of macro 'FIELD_GET'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
              ^~~~~~~~~
   include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
     ^~~~~~~~~~~~
   include/linux/bitfield.h:74:3: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +   \
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:11: note: in expansion of macro 'FIELD_GET'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
              ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:40:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_STATUS_MASK  GENMASK(38, 32)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:21: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_STATUS_MASK'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
     ^~~~~~~~~~~~
   include/linux/bitfield.h:74:3: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +   \
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:11: note: in expansion of macro 'FIELD_GET'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
              ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:40:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_STATUS_MASK  GENMASK(38, 32)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:21: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_STATUS_MASK'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);


vim +48 include/linux/bits.h

31299a5e0211241 Vincent Mailhol 2025-03-26  35  
19408200c094858 Vincent Mailhol 2025-03-26  36  /*
19408200c094858 Vincent Mailhol 2025-03-26  37   * Generate a mask for the specified type @t. Additional checks are made to
19408200c094858 Vincent Mailhol 2025-03-26  38   * guarantee the value returned fits in that type, relying on
19408200c094858 Vincent Mailhol 2025-03-26  39   * -Wshift-count-overflow compiler check to detect incompatible arguments.
19408200c094858 Vincent Mailhol 2025-03-26  40   * For example, all these create build errors or warnings:
19408200c094858 Vincent Mailhol 2025-03-26  41   *
19408200c094858 Vincent Mailhol 2025-03-26  42   * - GENMASK(15, 20): wrong argument order
19408200c094858 Vincent Mailhol 2025-03-26  43   * - GENMASK(72, 15): doesn't fit unsigned long
19408200c094858 Vincent Mailhol 2025-03-26  44   * - GENMASK_U32(33, 15): doesn't fit in a u32
19408200c094858 Vincent Mailhol 2025-03-26  45   */
19408200c094858 Vincent Mailhol 2025-03-26  46  #define GENMASK_TYPE(t, h, l)					\
19408200c094858 Vincent Mailhol 2025-03-26  47  	((t)(GENMASK_INPUT_CHECK(h, l) +			\
19408200c094858 Vincent Mailhol 2025-03-26 @48  	     (type_max(t) << (l) &				\
19408200c094858 Vincent Mailhol 2025-03-26  49  	      type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
19408200c094858 Vincent Mailhol 2025-03-26  50  

:::::: The code at line 48 was first introduced by commit
:::::: 19408200c094858d952a90bf4977733dc89a4df5 bits: introduce fixed-type GENMASK_U*()

:::::: TO: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
:::::: CC: Yury Norov <yury.norov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

