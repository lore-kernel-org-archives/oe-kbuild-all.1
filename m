Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76ADA1B5EB5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Sep 2025 09:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757755298; cv=none; b=G0omfhl1YmN58h0g+tB/Uy747lIydvESUyusz1cQF6ZBN7T23QvvldS/Vrvc4JIVQANPX5FmtTeLQZ9a8uCfUFVJGODif5ImVOvch2sy1pFPm4SmBpHQrlBQfIzMPsbMdAa/TfqCmZIkvKVq/2YlGP1oRmi7iDQQeFUFIB5sTnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757755298; c=relaxed/simple;
	bh=G+iJ5qUo7JyJYVQ4JzenUzUCweLiaQqtgVluGqiurPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GmLV0G0iBPFX31LZKsuU68H1+eloaofjS2nicDK2sud3Rf70Jg2PHcZVZnoQZivffVz8xs2x+xeQkv3BIbqti6OKeK+Xkgl2nWwA872HvluEXuN4VVCaHfo3RknTcy2jpchxHoQsCamrZuHC/3iZUTzBPgG+RMDuX0K0iQDT7/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JmCzpsHN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JmCzpsHN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757755294; x=1789291294;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=G+iJ5qUo7JyJYVQ4JzenUzUCweLiaQqtgVluGqiurPo=;
  b=JmCzpsHNKyXKKORP3LkfbT4D6NeIeE8Aoo0Hu6yWKMZzPyqadPje823f
   5JrMAiSWJqo889Hc/8T9tnMRWngsSsvSoG8UtZvTpRlebQrc7Vm7QVXkS
   RWZMj74QzX+4iVZF8/Hf8d3Qa9VbJOrBBBdcXbu3p2oB0ugHvZ4WpE8Yl
   b3lt0H/gBiSfyqafJOz0SfAEUtCY17VipIfl+MieeLN3CZps4FWQuY62+
   5QZpHfPSanHJtp9aIZ/JjIl9ZqgjcL4YfUCICq3eG6iHARODACKqZQNnZ
   nYcP9QDyTlE4LThvhkzhX53Zch7UzmagLQf8+g8ZkltH5lY+wEcnM65Zt
   w==;
X-CSE-ConnectionGUID: 2EVCckwyRmerIlOe+BCufA==
X-CSE-MsgGUID: 5Y02GC4STEKrKnGAq/Agkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="62717868"
X-IronPort-AV: E=Sophos;i="6.18,261,1751266800"; 
   d="scan'208";a="62717868"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 02:21:33 -0700
X-CSE-ConnectionGUID: cTMutCEJQxCHD4gq0v0Gjg==
X-CSE-MsgGUID: CiHLSycwSvSIBEvupWvo1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,261,1751266800"; 
   d="scan'208";a="174248364"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa008.jf.intel.com with ESMTP; 13 Sep 2025 02:21:31 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1uxMRk-000000001aJ-0JrE;
	Sat, 13 Sep 2025 09:21:28 +0000
Date: Sat, 13 Sep 2025 11:20:31 +0200
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [linux-next:master 5585/6355]
 arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: display@1e6e6000
 (aspeed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202509131100.IDD6HDC8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   3e8e5822146bc396d2a7e5fbb7be13271665522a
commit: 9756ff114601f426521528469cb29dfc3837c466 [5585/6355] dt-bindings: g=
pu: Convert aspeed,ast2400-gfx to DT schema
config: arm-randconfig-2054-20250904 (https://download.01.org/0day-ci/archi=
ve/20250913/202509131100.IDD6HDC8-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250913/202509131100.IDD6HDC8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509131100.IDD6HDC8-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: /ahb/apb/memory-control=
ler@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-=
sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: /ahb/apb/syscon@1e6e200=
0/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2=
500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: display@1e6e6000 (aspee=
d,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the regexes: '=
^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: /ahb/apb/timer@1e782000=
: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: /ahb/apb/pwm-tacho-cont=
roller@1e786000: failed to match any schema with compatible: ['aspeed,ast25=
00-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: lpc@1e789000 (aspeed,as=
t2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: lpc@1e789000 (aspeed,as=
t2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of the regexes: '^=
pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: kcs@24 (aspeed,ast2500-=
kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-=
bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: kcs@28 (aspeed,ast2500-=
kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: /ahb/apb/memory-co=
ntroller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast=
2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: /ahb/apb/syscon@1e=
6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed=
,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: display@1e6e6000 (=
aspeed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the regex=
es: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: /ahb/apb/timer@1e7=
82000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: /ahb/apb/pwm-tacho=
-controller@1e786000: failed to match any schema with compatible: ['aspeed,=
ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: fan@1: aspeed,fan-=
tach-ch: b'\x01' is not of type 'object', 'integer', 'array', 'boolean', 'n=
ull'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: fan@2: aspeed,fan-=
tach-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'n=
ull'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: fan@3: aspeed,fan-=
tach-ch: b'\x03' is not of type 'object', 'integer', 'array', 'boolean', 'n=
ull'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: fan@4: aspeed,fan-=
tach-ch: b'\x04' is not of type 'object', 'integer', 'array', 'boolean', 'n=
ull'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-ethanolx.dtb: /ahb/apb/memory-co=
ntroller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast=
2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-ethanolx.dtb: /ahb/apb/syscon@1e=
6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed=
,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-amd-ethanolx.dtb: display@1e6e6000 (=
aspeed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the regex=
es: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-ethanolx.dtb: /ahb/apb/timer@1e7=
82000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-ethanolx.dtb: /ahb/apb/pwm-tacho=
-controller@1e786000: failed to match any schema with compatible: ['aspeed,=
ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-ethanolx.dtb: fan@1: aspeed,fan-=
tach-ch: b'\x01' is not of type 'object', 'integer', 'array', 'boolean', 'n=
ull'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-ethanolx.dtb: fan@2: aspeed,fan-=
tach-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'n=
ull'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-ethanolx.dtb: fan@3: aspeed,fan-=
tach-ch: b'\x03' is not of type 'object', 'integer', 'array', 'boolean', 'n=
ull'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-ethanolx.dtb: fan@4: aspeed,fan-=
tach-ch: b'\x04' is not of type 'object', 'integer', 'array', 'boolean', 'n=
ull'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/apb/memory-c=
ontroller@1e6e0000: failed to match any schema with compatible: ['aspeed,as=
t2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/apb/syscon@1=
e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspee=
d,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: display@1e6e6000 =
(aspeed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the rege=
xes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/apb/timer@1e=
782000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/apb/pwm-tach=
o-controller@1e786000: failed to match any schema with compatible: ['aspeed=
,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: fan@0: aspeed,fan=
-tach-ch: b'\x04' is not of type 'object', 'integer', 'array', 'boolean', '=
null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: fan@1: aspeed,fan=
-tach-ch: b'\x05' is not of type 'object', 'integer', 'array', 'boolean', '=
null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: fan@2: aspeed,fan=
-tach-ch: b'\x06' is not of type 'object', 'integer', 'array', 'boolean', '=
null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: fan@3: aspeed,fan=
-tach-ch: b'\x07' is not of type 'object', 'integer', 'array', 'boolean', '=
null'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/ap=
b/memory-controller@1e6e0000: failed to match any schema with compatible: [=
'aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/ap=
b/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatibl=
e: ['aspeed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: display=
@1e6e6000 (aspeed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any o=
f the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: display=
@1e6e6000 (aspeed,ast2500-gfx): 'memory-region' is a required property
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/ap=
b/timer@1e782000: failed to match any schema with compatible: ['aspeed,ast2=
400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/ap=
b/pwm-tacho-controller@1e786000: failed to match any schema with compatible=
: ['aspeed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: lpc@1e7=
89000 (aspeed,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: lpc@1e7=
89000 (aspeed,ast2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of=
 the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: kcs@24 =
(aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^=
pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-=
bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: kcs@28 =
(aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^=
pinctrl-[0-9]+$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/apb/memor=
y-controller@1e6e0000: failed to match any schema with compatible: ['aspeed=
,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/apb/sysco=
n@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['as=
peed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: display@1e6e60=
00 (aspeed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/apb/timer=
@1e782000: failed to match any schema with compatible: ['aspeed,ast2400-tim=
er']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/apb/pwm-t=
acho-controller@1e786000: failed to match any schema with compatible: ['asp=
eed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: lpc@1e789000 (=
aspeed,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: lpc@1e789000 (=
aspeed,ast2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: kcs@24 (aspeed=
,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl=
-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-=
bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: kcs@28 (aspeed=
,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl=
-[0-9]+$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dtb: /ahb/apb/memor=
y-controller@1e6e0000: failed to match any schema with compatible: ['aspeed=
,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dtb: /ahb/apb/sysco=
n@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['as=
peed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dtb: display@1e6e60=
00 (aspeed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dtb: /ahb/apb/timer=
@1e782000: failed to match any schema with compatible: ['aspeed,ast2400-tim=
er']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dtb: /ahb/apb/pwm-t=
acho-controller@1e786000: failed to match any schema with compatible: ['asp=
eed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dtb: fan@2: aspeed,=
fan-tach-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolean'=
, 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dtb: fan@4: aspeed,=
fan-tach-ch: b'\x04' is not of type 'object', 'integer', 'array', 'boolean'=
, 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dtb: lpc@1e789000 (=
aspeed,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dtb: lpc@1e789000 (=
aspeed,ast2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dtb: /ahb/apb/memor=
y-controller@1e6e0000: failed to match any schema with compatible: ['aspeed=
,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dtb: /ahb/apb/sysco=
n@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['as=
peed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dtb: display@1e6e60=
00 (aspeed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dtb: /ahb/apb/timer=
@1e782000: failed to match any schema with compatible: ['aspeed,ast2400-tim=
er']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dtb: /ahb/apb/pwm-t=
acho-controller@1e786000: failed to match any schema with compatible: ['asp=
eed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dtb: fan@3: aspeed,=
fan-tach-ch: b'\x03\x0b' is not of type 'object', 'integer', 'array', 'bool=
ean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dtb: fan@4: aspeed,=
fan-tach-ch: b'\x04\x0c' is not of type 'object', 'integer', 'array', 'bool=
ean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dtb: fan@5: aspeed,=
fan-tach-ch: b'\x05\r' is not of type 'object', 'integer', 'array', 'boolea=
n', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dtb: fan@6: aspeed,=
fan-tach-ch: b'\x06\x0e' is not of type 'object', 'integer', 'array', 'bool=
ean', 'null'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: /ahb/apb/mem=
ory-controller@1e6e0000: failed to match any schema with compatible: ['aspe=
ed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: /ahb/apb/sys=
con@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['=
aspeed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: display@1e6e=
6000 (aspeed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: /ahb/apb/tim=
er@1e782000: failed to match any schema with compatible: ['aspeed,ast2400-t=
imer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: /ahb/apb/pwm=
-tacho-controller@1e786000: failed to match any schema with compatible: ['a=
speed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: fan@2: aspee=
d,fan-tach-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolea=
n', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: fan@3: aspee=
d,fan-tach-ch: b'\x03' is not of type 'object', 'integer', 'array', 'boolea=
n', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: fan@4: aspee=
d,fan-tach-ch: b'\x04' is not of type 'object', 'integer', 'array', 'boolea=
n', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: lpc@1e789000=
 (aspeed,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: /ahb/apb/memory-=
controller@1e6e0000: failed to match any schema with compatible: ['aspeed,a=
st2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: /ahb/apb/syscon@=
1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspe=
ed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: display@1e6e6000=
 (aspeed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: display@1e6e6000=
 (aspeed,ast2500-gfx): 'memory-region' is a required property
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: /ahb/apb/timer@1=
e782000: failed to match any schema with compatible: ['aspeed,ast2400-timer=
']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: /ahb/apb/pwm-tac=
ho-controller@1e786000: failed to match any schema with compatible: ['aspee=
d,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: fan@1: aspeed,fa=
n-tach-ch: b'\x01' is not of type 'object', 'integer', 'array', 'boolean', =
'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: fan@2: aspeed,fa=
n-tach-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', =
'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: fan@3: aspeed,fa=
n-tach-ch: b'\x04\x0b' is not of type 'object', 'integer', 'array', 'boolea=
n', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: fan@4: aspeed,fa=
n-tach-ch: b'\x06\r' is not of type 'object', 'integer', 'array', 'boolean'=
, 'null'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/apb/memory=
-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,=
ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/apb/syscon=
@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['asp=
eed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: display@1e6e600=
0 (aspeed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/apb/timer@=
1e782000: failed to match any schema with compatible: ['aspeed,ast2400-time=
r']
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/apb/pwm-ta=
cho-controller@1e786000: failed to match any schema with compatible: ['aspe=
ed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: fan@0: aspeed,f=
an-tach-ch: b'\x00\x01' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: fan@1: aspeed,f=
an-tach-ch: b'\x02\x03' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: fan@2: aspeed,f=
an-tach-ch: b'\x04\x05' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: fan@3: aspeed,f=
an-tach-ch: b'\x06\x07' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
--
   arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout.dtsi:9.11-12.4: Warni=
ng (unique_unit_address_if_enabled): /ahb/spi@1e620000/flash@0/partitions/u=
-boot@0: duplicate unit-address (also used in node /ahb/spi@1e620000/flash@=
0/partitions/flash0@0)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dtb: /ahb/apb/memory-co=
ntroller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast=
2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dtb: /ahb/apb/syscon@1e=
6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed=
,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dtb: display@1e6e6000 (=
aspeed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the regex=
es: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dtb: /ahb/apb/timer@1e7=
82000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dtb: /ahb/apb/pwm-tacho=
-controller@1e786000: failed to match any schema with compatible: ['aspeed,=
ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dtb: lpc@1e789000 (aspe=
ed,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dtb: lpc@1e789000 (aspe=
ed,ast2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of the regexe=
s: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dtb: kcs@24 (aspeed,ast=
2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-=
9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-=
bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dtb: kcs@28 (aspeed,ast=
2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-=
9]+$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dts:254.12-257.5: =
Warning (unique_unit_address_if_enabled): /ahb/spi@1e620000/flash@0/partiti=
ons/u-boot@0: duplicate unit-address (also used in node /ahb/spi@1e620000/f=
lash@0/partitions/flash0@0)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dtb: /ahb/apb/memo=
ry-controller@1e6e0000: failed to match any schema with compatible: ['aspee=
d,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dtb: /ahb/apb/sysc=
on@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['a=
speed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dtb: display@1e6e6=
000 (aspeed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the =
regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dtb: /ahb/apb/time=
r@1e782000: failed to match any schema with compatible: ['aspeed,ast2400-ti=
mer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dtb: /ahb/apb/pwm-=
tacho-controller@1e786000: failed to match any schema with compatible: ['as=
peed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dtb: lpc@1e789000 =
(aspeed,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dtb: lpc@1e789000 =
(aspeed,ast2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dtb: kcs@24 (aspee=
d,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctr=
l-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-=
bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dtb: kcs@28 (aspee=
d,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctr=
l-[0-9]+$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dtb: /ahb/apb/mem=
ory-controller@1e6e0000: failed to match any schema with compatible: ['aspe=
ed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dtb: /ahb/apb/sys=
con@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['=
aspeed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dtb: display@1e6e=
6000 (aspeed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dtb: /ahb/apb/tim=
er@1e782000: failed to match any schema with compatible: ['aspeed,ast2400-t=
imer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dtb: /ahb/apb/pwm=
-tacho-controller@1e786000: failed to match any schema with compatible: ['a=
speed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dtb: fan@1: aspee=
d,fan-tach-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolea=
n', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dtb: lpc@1e789000=
 (aspeed,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dtb: lpc@1e789000=
 (aspeed,ast2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of the =
regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dtb: kcs@24 (aspe=
ed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinct=
rl-[0-9]+$'
--
   arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi:12.11-15.4: =
Warning (unique_unit_address_if_enabled): /ahb/spi@1e620000/flash@0/partiti=
ons/u-boot@0: duplicate unit-address (also used in node /ahb/spi@1e620000/f=
lash@0/partitions/flash0@0)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: /ahb/apb/memo=
ry-controller@1e6e0000: failed to match any schema with compatible: ['aspee=
d,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: /ahb/apb/sysc=
on@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['a=
speed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: display@1e6e6=
000 (aspeed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the =
regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: sd-controller=
@1e740000 (aspeed,ast2500-sd-controller): sdhci@200: Unevaluated properties=
 are not allowed ('sdhci-caps-mask' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: /ahb/apb/time=
r@1e782000: failed to match any schema with compatible: ['aspeed,ast2400-ti=
mer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: /ahb/apb/pwm-=
tacho-controller@1e786000: failed to match any schema with compatible: ['as=
peed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: lpc@1e789000 =
(aspeed,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: lpc@1e789000 =
(aspeed,ast2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: kcs@24 (aspee=
d,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctr=
l-[0-9]+$'
--
   arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout.dtsi:9.11-12.4: Warni=
ng (unique_unit_address_if_enabled): /ahb/spi@1e620000/flash@0/partitions/u=
-boot@0: duplicate unit-address (also used in node /ahb/spi@1e620000/flash@=
0/partitions/flash0@0)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dtb: /ahb/apb/memory-c=
ontroller@1e6e0000: failed to match any schema with compatible: ['aspeed,as=
t2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dtb: /ahb/apb/syscon@1=
e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspee=
d,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dtb: display@1e6e6000 =
(aspeed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the rege=
xes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dtb: /ahb/apb/timer@1e=
782000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dtb: /ahb/apb/pwm-tach=
o-controller@1e786000: failed to match any schema with compatible: ['aspeed=
,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dtb: lpc@1e789000 (asp=
eed,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dtb: lpc@1e789000 (asp=
eed,ast2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of the regex=
es: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dtb: kcs@24 (aspeed,as=
t2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0=
-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-=
bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dtb: kcs@28 (aspeed,as=
t2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0=
-9]+$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: ethernet@1e=
660000 (aspeed,ast2500-mac): Unevaluated properties are not allowed ('mella=
nox,multi-host' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.ya=
ml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: /ahb/apb/me=
mory-controller@1e6e0000: failed to match any schema with compatible: ['asp=
eed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: /ahb/apb/sy=
scon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: [=
'aspeed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: display@1e6=
e6000 (aspeed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of th=
e regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: /ahb/apb/ti=
mer@1e782000: failed to match any schema with compatible: ['aspeed,ast2400-=
timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: /ahb/apb/pw=
m-tacho-controller@1e786000: failed to match any schema with compatible: ['=
aspeed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: fan@1: aspe=
ed,fan-tach-ch: b'\x01' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: lpc@1e78900=
0 (aspeed,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: lpc@1e78900=
0 (aspeed,ast2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: kcs@24 (asp=
eed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinc=
trl-[0-9]+$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dtb: /ahb/apb/memory-c=
ontroller@1e6e0000: failed to match any schema with compatible: ['aspeed,as=
t2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dtb: /ahb/apb/syscon@1=
e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspee=
d,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dtb: display@1e6e6000 =
(aspeed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the rege=
xes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dtb: display@1e6e6000 =
(aspeed,ast2500-gfx): 'memory-region' is a required property
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dtb: /ahb/apb/timer@1e=
782000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dtb: /ahb/apb/pwm-tach=
o-controller@1e786000: failed to match any schema with compatible: ['aspeed=
,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dtb: lpc@1e789000 (asp=
eed,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dtb: lpc@1e789000 (asp=
eed,ast2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of the regex=
es: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dtb: kcs@24 (aspeed,as=
t2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0=
-9]+$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: /ahb/apb/memory=
-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,=
ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: /ahb/apb/syscon=
@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['asp=
eed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: display@1e6e600=
0 (aspeed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: /ahb/apb/timer@=
1e782000: failed to match any schema with compatible: ['aspeed,ast2400-time=
r']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: /ahb/apb/pwm-ta=
cho-controller@1e786000: failed to match any schema with compatible: ['aspe=
ed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: fan@0: aspeed,f=
an-tach-ch: b'\x00\x01' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: fan@1: aspeed,f=
an-tach-ch: b'\x02\x03' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: fan@2: aspeed,f=
an-tach-ch: b'\x04\x05' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: fan@3: aspeed,f=
an-tach-ch: b'\x06\x07' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: /ahb/apb/memory=
-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,=
ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: /ahb/apb/syscon=
@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['asp=
eed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: display@1e6e600=
0 (aspeed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: /ahb/apb/timer@=
1e782000: failed to match any schema with compatible: ['aspeed,ast2400-time=
r']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: /ahb/apb/pwm-ta=
cho-controller@1e786000: failed to match any schema with compatible: ['aspe=
ed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: fan@0: aspeed,f=
an-tach-ch: b'\x00\x01' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: fan@1: aspeed,f=
an-tach-ch: b'\x02\x03' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: fan@2: aspeed,f=
an-tach-ch: b'\x04\x05' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: fan@3: aspeed,f=
an-tach-ch: b'\x06\x07' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dts:17.9-19.4: Warni=
ng (unit_address_vs_reg): /memory: node has a reg or ranges property, but n=
o unit name
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: / (inspur,on526=
3m5-bmc): memory: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: / (inspur,on526=
3m5-bmc): memory: False schema does not allow {'reg': [[2147483648, 5368709=
12]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: /ahb/apb/memory=
-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,=
ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: /ahb/apb/syscon=
@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['asp=
eed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: display@1e6e600=
0 (aspeed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: display@1e6e600=
0 (aspeed,ast2500-gfx): 'memory-region' is a required property
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: /ahb/apb/timer@=
1e782000: failed to match any schema with compatible: ['aspeed,ast2400-time=
r']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: /ahb/apb/pwm-ta=
cho-controller@1e786000: failed to match any schema with compatible: ['aspe=
ed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: fan@0: aspeed,f=
an-tach-ch: b'\x00\x01' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: fan@1: aspeed,f=
an-tach-ch: b'\x02\x03' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: lpc@1e789000 (a=
speed,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: lpc@1e789000 (a=
speed,ast2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of the reg=
exes: '^pinctrl-[0-9]+$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: /ahb/apb/memory-co=
ntroller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast=
2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: /ahb/apb/syscon@1e=
6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed=
,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: display@1e6e6000 (=
aspeed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the regex=
es: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: pin-gpio-s4-hog: '=
output' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: pin-gpio-s4-hog: '=
oneOf' conditional failed, one must be fixed:
   	'input' is a required property
   	'output-high' is a required property
   	'output-low' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: /ahb/apb/timer@1e7=
82000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: /ahb/apb/pwm-tacho=
-controller@1e786000: failed to match any schema with compatible: ['aspeed,=
ast2500-pwm-tacho']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: /ahb/apb/memory=
-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,=
ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: /ahb/apb/syscon=
@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['asp=
eed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: display@1e6e600=
0 (aspeed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: /ahb/apb/timer@=
1e782000: failed to match any schema with compatible: ['aspeed,ast2400-time=
r']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: /ahb/apb/pwm-ta=
cho-controller@1e786000: failed to match any schema with compatible: ['aspe=
ed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: fan@1: aspeed,f=
an-tach-ch: b'\x01' is not of type 'object', 'integer', 'array', 'boolean',=
 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: fan@2: aspeed,f=
an-tach-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolean',=
 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: fan@3: aspeed,f=
an-tach-ch: b'\x03' is not of type 'object', 'integer', 'array', 'boolean',=
 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: fan@4: aspeed,f=
an-tach-ch: b'\x04' is not of type 'object', 'integer', 'array', 'boolean',=
 'null'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/apb/memory-con=
troller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2=
500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/apb/syscon@1e6=
e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,=
ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: display@1e6e6000 (a=
speed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the regexe=
s: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: display@1e6e6000 (a=
speed,ast2500-gfx): 'memory-region' is a required property
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/apb/timer@1e78=
2000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/apb/pwm-tacho-=
controller@1e786000: failed to match any schema with compatible: ['aspeed,a=
st2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: fan@1: aspeed,fan-t=
ach-ch: b'\x01' is not of type 'object', 'integer', 'array', 'boolean', 'nu=
ll'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: fan@2: aspeed,fan-t=
ach-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'nu=
ll'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: fan@3: aspeed,fan-t=
ach-ch: b'\x03' is not of type 'object', 'integer', 'array', 'boolean', 'nu=
ll'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: lpc@1e789000 (aspee=
d,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/apb/memory-cont=
roller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast25=
00-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/apb/syscon@1e6e=
2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,a=
st2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: display@1e6e6000 (as=
peed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the regexes=
: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/apb/timer@1e782=
000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/apb/pwm-tacho-c=
ontroller@1e786000: failed to match any schema with compatible: ['aspeed,as=
t2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: fan@1: aspeed,fan-ta=
ch-ch: b'\x01' is not of type 'object', 'integer', 'array', 'boolean', 'nul=
l'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: fan@2: aspeed,fan-ta=
ch-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'nul=
l'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: fan@3: aspeed,fan-ta=
ch-ch: b'\x03' is not of type 'object', 'integer', 'array', 'boolean', 'nul=
l'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: fan@4: aspeed,fan-ta=
ch-ch: b'\x04' is not of type 'object', 'integer', 'array', 'boolean', 'nul=
l'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/apb/memory-cont=
roller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast25=
00-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/apb/syscon@1e6e=
2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,a=
st2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: display@1e6e6000 (as=
peed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the regexes=
: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/apb/timer@1e782=
000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/apb/pwm-tacho-c=
ontroller@1e786000: failed to match any schema with compatible: ['aspeed,as=
t2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: lpc@1e789000 (aspeed=
,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: lpc@1e789000 (aspeed=
,ast2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of the regexes:=
 '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: kcs@24 (aspeed,ast25=
00-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]=
+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-=
bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: kcs@28 (aspeed,ast25=
00-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]=
+$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/apb/memory-con=
troller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2=
500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/apb/syscon@1e6=
e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,=
ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: display@1e6e6000 (a=
speed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the regexe=
s: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/apb/timer@1e78=
2000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/apb/pwm-tacho-=
controller@1e786000: failed to match any schema with compatible: ['aspeed,a=
st2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: fan@0: aspeed,fan-t=
ach-ch: b'\x08' is not of type 'object', 'integer', 'array', 'boolean', 'nu=
ll'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: fan@1: aspeed,fan-t=
ach-ch: b'\t' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: fan@2: aspeed,fan-t=
ach-ch: b'\n' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: fan@3: aspeed,fan-t=
ach-ch: b'\x0b' is not of type 'object', 'integer', 'array', 'boolean', 'nu=
ll'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/apb/memory=
-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,=
ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/apb/syscon=
@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['asp=
eed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: display@1e6e600=
0 (aspeed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/apb/timer@=
1e782000: failed to match any schema with compatible: ['aspeed,ast2400-time=
r']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/apb/pwm-ta=
cho-controller@1e786000: failed to match any schema with compatible: ['aspe=
ed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: lpc@1e789000 (a=
speed,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: lpc@1e789000 (a=
speed,ast2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: kcs@24 (aspeed,=
ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-=
[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-=
bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: kcs@28 (aspeed,=
ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-=
[0-9]+$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/apb/memory-contr=
oller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast250=
0-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/apb/syscon@1e6e2=
000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,as=
t2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: display@1e6e6000 (asp=
eed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the regexes:=
 '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: display@1e6e6000 (asp=
eed,ast2500-gfx): 'memory-region' is a required property
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/apb/timer@1e7820=
00: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/apb/pwm-tacho-co=
ntroller@1e786000: failed to match any schema with compatible: ['aspeed,ast=
2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: fan@1: aspeed,fan-tac=
h-ch: b'\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: fan@2: aspeed,fan-tac=
h-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: fan@3: aspeed,fan-tac=
h-ch: b'\x03' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: lpc@1e789000 (aspeed,=
ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: /ahb/apb/memor=
y-controller@1e6e0000: failed to match any schema with compatible: ['aspeed=
,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: /ahb/apb/sysco=
n@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['as=
peed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: display@1e6e60=
00 (aspeed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: /ahb/apb/timer=
@1e782000: failed to match any schema with compatible: ['aspeed,ast2400-tim=
er']
   arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: /ahb/apb/pwm-t=
acho-controller@1e786000: failed to match any schema with compatible: ['asp=
eed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: fan@1: aspeed,=
fan-tach-ch: b'\x01' is not of type 'object', 'integer', 'array', 'boolean'=
, 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: lpc@1e789000 (=
aspeed,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: lpc@1e789000 (=
aspeed,ast2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: kcs@24 (aspeed=
,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl=
-[0-9]+$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb: /ahb/apb/memo=
ry-controller@1e6e0000: failed to match any schema with compatible: ['aspee=
d,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb: /ahb/apb/sysc=
on@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['a=
speed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb: display@1e6e6=
000 (aspeed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the =
regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb: display@1e6e6=
000 (aspeed,ast2500-gfx): 'memory-region' is a required property
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb: /ahb/apb/time=
r@1e782000: failed to match any schema with compatible: ['aspeed,ast2400-ti=
mer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb: /ahb/apb/pwm-=
tacho-controller@1e786000: failed to match any schema with compatible: ['as=
peed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb: lpc@1e789000 =
(aspeed,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb: lpc@1e789000 =
(aspeed,ast2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb: kcs@24 (aspee=
d,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctr=
l-[0-9]+$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: /ahb/apb/memory-cont=
roller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast25=
00-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: /ahb/apb/syscon@1e6e=
2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,a=
st2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: display@1e6e6000 (as=
peed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the regexes=
: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: gpio@1e780000 (aspee=
d,ast2500-gpio): gpio-line-names: ['', '', 'led-identify', '', '', '', '', =
'', '', '', '', '', '', '', '', '', '', '', '', '', 'id-button', 'post-comp=
lete', '', '', '', '', 'power-chassis-good', 'platform-reset', '', '', '', =
'', 'power-button', 'power-chassis-control', 'reset-button', 'reset-control=
', 'nmi-button', 'nmi-control', '', 'led-heartbeat', '', 'clear-cmos-contro=
l', '', '', 'led-fault', '', '', '', 'BMC_PE_SMB_EN_1_N', 'BMC_PE_SMB_EN_2_=
N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', =
'', '', '', '', '', '', '', '', 'BMC_PE_SMB_SW_BIT0', 'BMC_PE_SMB_SW_BIT1',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', =
'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', '', 'BMC_SMB3_PCH_IE_SML3_EN', '', '', '', '', '', '', '', '', '', '',=
 '', ''] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: /ahb/apb/timer@1e782=
000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: /ahb/apb/pwm-tacho-c=
ontroller@1e786000: failed to match any schema with compatible: ['aspeed,as=
t2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: fan@1: aspeed,fan-ta=
ch-ch: b'\x01' is not of type 'object', 'integer', 'array', 'boolean', 'nul=
l'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: fan@2: aspeed,fan-ta=
ch-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'nul=
l'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: fan@3: aspeed,fan-ta=
ch-ch: b'\x03' is not of type 'object', 'integer', 'array', 'boolean', 'nul=
l'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: /ahb/apb/memory-cont=
roller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast25=
00-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: /ahb/apb/syscon@1e6e=
2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,a=
st2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: display@1e6e6000 (as=
peed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the regexes=
: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: gpio@1e780000 (aspee=
d,ast2500-gpio): gpio-line-names: ['', '', 'led-identify', '', '', '', '', =
'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 'power-chassis-good', 'platform-reset', '', '', '', '', 'power-button', 'p=
ower-chassis-control', 'reset-button', 'reset-control', 'nmi-button', 'nmi-=
control', 'TSI_RESERT', 'led-heartbeat', '', 'clear-cmos-control', '', '', =
'led-fault', 'BMC_SYS_FAULT_LED_L', 'BMC_ASSERT_BIOS_WP_L', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', =
'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', 'id-button', '', '', '', '', '', '', '', '=
', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', =
'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', 'post-complete', '', '', '', '', '', '', '', '', '', '', =
'', 'BMC_ASSERT_BMC_READY', 'BMC_SPD_SEL', '', '', '', '', '', '', ''] is t=
oo short
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: /ahb/apb/timer@1e782=
000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: /ahb/apb/pwm-tacho-c=
ontroller@1e786000: failed to match any schema with compatible: ['aspeed,as=
t2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: fan@2: aspeed,fan-ta=
ch-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'nul=
l'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: fan@3: aspeed,fan-ta=
ch-ch: b'\x03' is not of type 'object', 'integer', 'array', 'boolean', 'nul=
l'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: fan@4: aspeed,fan-ta=
ch-ch: b'\x04' is not of type 'object', 'integer', 'array', 'boolean', 'nul=
l'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: /ahb/apb/memory-con=
troller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2=
500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: /ahb/apb/syscon@1e6=
e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,=
ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: display@1e6e6000 (a=
speed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the regexe=
s: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: /ahb/apb/timer@1e78=
2000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: timer@1e782000 (asp=
eed,ast2400-timer): 'fttmr010,pwm-outputs' does not match any of the regexe=
s: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gp=
io|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*=
', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mm=
c|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plg=
pio|st-spics|ts),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*',=
 '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}=
$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abilis,.*', '^abraco=
n,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*', '^acme,.*', '^act=
ions,.*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^ad=
aptrum,.*', '^adh,.*', '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,=
=2E*', '^aeroflexgaisler,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcate=
l,.*', '^aldec,.*', '^alfa-network,.*', '^allegro,.*', '^allegromicro,.*', =
'^alliedtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alp=
hascale,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*'=
, '^amcc,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^a=
mphenol,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbe=
rnic,.*', '^andestech,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*',=
 '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^=
arctic,.*', '^arcx,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,=
=2E*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-ka=
sei,.*', '^asc,.*', '^asix,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*=
', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvide=
a,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^ax=
entia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*',=
 '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bhf,.*', '^bi=
gtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '=
^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.=
*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*'=
, '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*'=
, '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*'=
, '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva=
,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^=
chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', =
'^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.=
*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*'=
, '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,=
=2E*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic=
,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.=
*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.=
*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^datai=
mage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^de=
nsitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*=
', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*',=
 '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^dom=
intech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '=
^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', =
'^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*',=
 '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips=
,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^=
elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^em=
lid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*',=
 '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*'=
, '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^es=
p,.*', '^est,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*',=
 '^evervision,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^=
facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek,=
=2E*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^=
firefly,.*', '^focaltech,.*', '^forlinx,.*', '^foxlink,.*', '^freebox,.*', =
'^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^=
fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gateway,.*',=
 '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,=
=2E*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^geniatech=
,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*', '^gl=
obaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,.*', '^=
google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.=
*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,=
=2E*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*', '^hima=
x,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*=
', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*',=
 '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^=
hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*=
', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icp=
lus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^imagis,.*', '^img=
,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*', '^indied=
roid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic,.*', '^i=
ngrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^inside-secure=
,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*', '^inve=
nsense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^irondevice,.*',=
 '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itian,.*', '=
^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^jedec,.*',=
 '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,.*', '^jo=
z,.*', '^jty,.*', '^kam,.*', '^karo,.*', '^keithkoep,.*', '^keymile,.*', '^=
khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^kingdisplay,.*', '^kingnov=
el,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^koe,.*', '^kontron,.*', '^=
kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^laird,.*', '^lamobo,.*', '=
^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,.*', '^leadtek,.*', '^lee=
z,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg,.*', '^lgphilips,.*', =
'^libretech,.*', '^licheepi,.*', '^linaro,.*', '^lincolntech,.*', '^lineart=
echnology,.*', '^linksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.=
*', '^linx,.*', '^liontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^lo=
gicpd,.*', '^logictechno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses=
,.*', '^loongson,.*', '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '=
^lwn,.*', '^lxa,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboa=
rd,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxli=
near,.*', '^maxtor,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '=
^mediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^=
mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^=
meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^m=
icrocrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips=
,.*', '^mikroe,.*', '^mikrotik,.*', '^milkv,.*', '^miniand,.*', '^minix,.*'=
, '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*',=
 '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', =
'^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '=
^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^=
mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^m=
xicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '^neofidelit=
y,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netro=
n-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^n=
ewvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nint=
endo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.=
*', '^novatek,.*', '^novtech,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton=
,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.=
*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onie=
,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*=
', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^o=
penwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '=
^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxse=
mi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^pd=
a,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^pho=
ntech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', =
'^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*',=
 '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyh=
ex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^powerti=
p,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,=
=2E*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*=
', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*'=
, '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*'=
, '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.*', '^raydium=
,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.=
*', '^rervision,.*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.=
*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', =
'^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^ro=
seapplepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samt=
ec,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,=
=2E*', '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', =
'^seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*=
', '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '=
^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shine=
world,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^s=
iemens,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*'=
, '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.=
*', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^s=
inlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^s=
is,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^sma=
rtlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*',=
 '^socionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '=
^sophgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,=
=2E*', '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^s=
star,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^star=
tek,.*', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^s=
torm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^s=
unplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synology,.*', '^syn=
opsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*=
', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion=
,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^te=
ltonika,.*', '^tempo,.*', '^tenda,.*', '^terasic,.*', '^tesla,.*', '^test,.=
*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thundercomm,.*',=
 '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,.*', '^=
topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '^toradex,.*', '^to=
shiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq,.*', '^tr=
anspeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*', '^truly,.*', '^=
tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', =
'^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ul=
tratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,=
=2E*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs=
,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*',=
 '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*',=
 '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '=
^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.=
*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^=
welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widor=
a,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^win=
link,.*', '^winsen,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf=
,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^=
xes,.*', '^xiaomi,.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xin=
peng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*=
', '^yadro,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yimin=
g,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^=
yuridenki,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^=
zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: /ahb/apb/pwm-tacho-=
controller@1e786000: failed to match any schema with compatible: ['aspeed,a=
st2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: fan@0: aspeed,fan-t=
ach-ch: b'\x00\x06' is not of type 'object', 'integer', 'array', 'boolean',=
 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: fan@1: aspeed,fan-t=
ach-ch: b'\x01\x08' is not of type 'object', 'integer', 'array', 'boolean',=
 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: fan@2: aspeed,fan-t=
ach-ch: b'\x02\t' is not of type 'object', 'integer', 'array', 'boolean', '=
null'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: /ahb/apb/memory-con=
troller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2=
500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: /ahb/apb/syscon@1e6=
e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,=
ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: display@1e6e6000 (a=
speed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the regexe=
s: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: /ahb/apb/timer@1e78=
2000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: timer@1e782000 (asp=
eed,ast2400-timer): 'fttmr010,pwm-outputs' does not match any of the regexe=
s: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gp=
io|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*=
', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mm=
c|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plg=
pio|st-spics|ts),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*',=
 '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}=
$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abilis,.*', '^abraco=
n,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*', '^acme,.*', '^act=
ions,.*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^ad=
aptrum,.*', '^adh,.*', '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,=
=2E*', '^aeroflexgaisler,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcate=
l,.*', '^aldec,.*', '^alfa-network,.*', '^allegro,.*', '^allegromicro,.*', =
'^alliedtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alp=
hascale,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*'=
, '^amcc,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^a=
mphenol,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbe=
rnic,.*', '^andestech,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*',=
 '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^=
arctic,.*', '^arcx,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,=
=2E*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-ka=
sei,.*', '^asc,.*', '^asix,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*=
', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvide=
a,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^ax=
entia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*',=
 '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bhf,.*', '^bi=
gtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '=
^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.=
*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*'=
, '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*'=
, '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*'=
, '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva=
,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^=
chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', =
'^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.=
*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*'=
, '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,=
=2E*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic=
,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.=
*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.=
*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^datai=
mage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^de=
nsitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*=
', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*',=
 '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^dom=
intech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '=
^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', =
'^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*',=
 '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips=
,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^=
elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^em=
lid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*',=
 '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*'=
, '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^es=
p,.*', '^est,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*',=
 '^evervision,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^=
facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek,=
=2E*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^=
firefly,.*', '^focaltech,.*', '^forlinx,.*', '^foxlink,.*', '^freebox,.*', =
'^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^=
fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gateway,.*',=
 '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,=
=2E*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^geniatech=
,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*', '^gl=
obaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,.*', '^=
google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.=
*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,=
=2E*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*', '^hima=
x,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*=
', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*',=
 '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^=
hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*=
', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icp=
lus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^imagis,.*', '^img=
,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*', '^indied=
roid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic,.*', '^i=
ngrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^inside-secure=
,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*', '^inve=
nsense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^irondevice,.*',=
 '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itian,.*', '=
^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^jedec,.*',=
 '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,.*', '^jo=
z,.*', '^jty,.*', '^kam,.*', '^karo,.*', '^keithkoep,.*', '^keymile,.*', '^=
khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^kingdisplay,.*', '^kingnov=
el,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^koe,.*', '^kontron,.*', '^=
kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^laird,.*', '^lamobo,.*', '=
^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,.*', '^leadtek,.*', '^lee=
z,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg,.*', '^lgphilips,.*', =
'^libretech,.*', '^licheepi,.*', '^linaro,.*', '^lincolntech,.*', '^lineart=
echnology,.*', '^linksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.=
*', '^linx,.*', '^liontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^lo=
gicpd,.*', '^logictechno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses=
,.*', '^loongson,.*', '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '=
^lwn,.*', '^lxa,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboa=
rd,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxli=
near,.*', '^maxtor,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '=
^mediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^=
mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^=
meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^m=
icrocrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips=
,.*', '^mikroe,.*', '^mikrotik,.*', '^milkv,.*', '^miniand,.*', '^minix,.*'=
, '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*',=
 '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', =
'^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '=
^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^=
mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^m=
xicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '^neofidelit=
y,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netro=
n-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^n=
ewvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nint=
endo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.=
*', '^novatek,.*', '^novtech,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton=
,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.=
*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onie=
,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*=
', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^o=
penwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '=
^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxse=
mi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^pd=
a,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^pho=
ntech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', =
'^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*',=
 '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyh=
ex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^powerti=
p,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,=
=2E*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*=
', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*'=
, '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*'=
, '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.*', '^raydium=
,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.=
*', '^rervision,.*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.=
*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', =
'^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^ro=
seapplepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samt=
ec,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,=
=2E*', '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', =
'^seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*=
', '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '=
^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shine=
world,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^s=
iemens,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*'=
, '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.=
*', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^s=
inlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^s=
is,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^sma=
rtlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*',=
 '^socionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '=
^sophgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,=
=2E*', '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^s=
star,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^star=
tek,.*', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^s=
torm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^s=
unplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synology,.*', '^syn=
opsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*=
', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion=
,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^te=
ltonika,.*', '^tempo,.*', '^tenda,.*', '^terasic,.*', '^tesla,.*', '^test,.=
*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thundercomm,.*',=
 '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,.*', '^=
topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '^toradex,.*', '^to=
shiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq,.*', '^tr=
anspeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*', '^truly,.*', '^=
tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', =
'^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ul=
tratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,=
=2E*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs=
,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*',=
 '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*',=
 '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '=
^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.=
*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^=
welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widor=
a,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^win=
link,.*', '^winsen,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf=
,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^=
xes,.*', '^xiaomi,.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xin=
peng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*=
', '^yadro,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yimin=
g,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^=
yuridenki,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^=
zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: /ahb/apb/pwm-tacho-=
controller@1e786000: failed to match any schema with compatible: ['aspeed,a=
st2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: fan@0: aspeed,fan-t=
ach-ch: b'\x00\x07' is not of type 'object', 'integer', 'array', 'boolean',=
 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: fan@1: aspeed,fan-t=
ach-ch: b'\x01\x08' is not of type 'object', 'integer', 'array', 'boolean',=
 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: fan@2: aspeed,fan-t=
ach-ch: b'\x02\t' is not of type 'object', 'integer', 'array', 'boolean', '=
null'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: /ahb/apb/memory-con=
troller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2=
500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: /ahb/apb/syscon@1e6=
e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,=
ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: display@1e6e6000 (a=
speed,ast2500-gfx): 'reg-io-width', 'syscon' do not match any of the regexe=
s: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: /ahb/apb/timer@1e78=
2000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: timer@1e782000 (asp=
eed,ast2400-timer): 'fttmr010,pwm-outputs' does not match any of the regexe=
s: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gp=
io|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*=
', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mm=
c|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plg=
pio|st-spics|ts),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*',=
 '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}=
$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abilis,.*', '^abraco=
n,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*', '^acme,.*', '^act=
ions,.*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^ad=
aptrum,.*', '^adh,.*', '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,=
=2E*', '^aeroflexgaisler,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcate=
l,.*', '^aldec,.*', '^alfa-network,.*', '^allegro,.*', '^allegromicro,.*', =
'^alliedtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alp=
hascale,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*'=
, '^amcc,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^a=
mphenol,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbe=
rnic,.*', '^andestech,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*',=
 '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^=
arctic,.*', '^arcx,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,=
=2E*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-ka=
sei,.*', '^asc,.*', '^asix,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*=
', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvide=
a,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^ax=
entia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*',=
 '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bhf,.*', '^bi=
gtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '=
^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.=
*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*'=
, '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*'=
, '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*'=
, '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva=
,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^=
chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', =
'^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.=
*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*'=
, '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,=
=2E*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic=
,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.=
*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.=
*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^datai=
mage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^de=
nsitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*=
', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*',=
 '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^dom=
intech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '=
^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', =
'^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*',=
 '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips=
,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^=
elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^em=
lid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*',=
 '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*'=
, '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^es=
p,.*', '^est,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*',=
 '^evervision,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^=
facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek,=
=2E*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^=
firefly,.*', '^focaltech,.*', '^forlinx,.*', '^foxlink,.*', '^freebox,.*', =
'^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^=
fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gateway,.*',=
 '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,=
=2E*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^geniatech=
,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*', '^gl=
obaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,.*', '^=
google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.=
*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,=
=2E*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*', '^hima=
x,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*=
', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*',=
 '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^=
hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*=
', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icp=
lus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^imagis,.*', '^img=
,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*', '^indied=
roid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic,.*', '^i=
ngrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^inside-secure=
,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*', '^inve=
nsense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^irondevice,.*',=
 '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itian,.*', '=
^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^jedec,.*',=
 '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,.*', '^jo=
z,.*', '^jty,.*', '^kam,.*', '^karo,.*', '^keithkoep,.*', '^keymile,.*', '^=
khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^kingdisplay,.*', '^kingnov=
el,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^koe,.*', '^kontron,.*', '^=
kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^laird,.*', '^lamobo,.*', '=
^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,.*', '^leadtek,.*', '^lee=
z,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg,.*', '^lgphilips,.*', =
'^libretech,.*', '^licheepi,.*', '^linaro,.*', '^lincolntech,.*', '^lineart=
echnology,.*', '^linksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.=
*', '^linx,.*', '^liontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^lo=
gicpd,.*', '^logictechno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses=
,.*', '^loongson,.*', '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '=
^lwn,.*', '^lxa,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboa=
rd,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxli=
near,.*', '^maxtor,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '=
^mediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^=
mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^=
meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^m=
icrocrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips=
,.*', '^mikroe,.*', '^mikrotik,.*', '^milkv,.*', '^miniand,.*', '^minix,.*'=
, '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*',=
 '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', =
'^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '=
^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^=
mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^m=
xicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '^neofidelit=
y,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netro=
n-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^n=
ewvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nint=
endo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.=
*', '^novatek,.*', '^novtech,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton=
,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.=
*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onie=
,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*=
', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^o=
penwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '=
^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxse=
mi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^pd=
a,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^pho=
ntech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', =
'^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*',=
 '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyh=
ex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^powerti=
p,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,=
=2E*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*=
', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*'=
, '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*'=
, '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.*', '^raydium=
,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.=
*', '^rervision,.*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.=
*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', =
'^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^ro=
seapplepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samt=
ec,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,=
=2E*', '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', =
'^seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*=
', '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '=
^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shine=
world,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^s=
iemens,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*'=
, '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.=
*', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^s=
inlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^s=
is,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^sma=
rtlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*',=
 '^socionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '=
^sophgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,=
=2E*', '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^s=
star,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^star=
tek,.*', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^s=
torm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^s=
unplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synology,.*', '^syn=
opsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*=
', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion=
,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^te=
ltonika,.*', '^tempo,.*', '^tenda,.*', '^terasic,.*', '^tesla,.*', '^test,.=
*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thundercomm,.*',=
 '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,.*', '^=
topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '^toradex,.*', '^to=
shiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq,.*', '^tr=
anspeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*', '^truly,.*', '^=
tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', =
'^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ul=
tratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,=
=2E*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs=
,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*',=
 '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*',=
 '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '=
^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.=
*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^=
welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widor=
a,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^win=
link,.*', '^winsen,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf=
,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^=
xes,.*', '^xiaomi,.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xin=
peng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*=
', '^yadro,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yimin=
g,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^=
yuridenki,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^=
zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: /ahb/apb/pwm-tacho-=
controller@1e786000: failed to match any schema with compatible: ['aspeed,a=
st2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: fan@1: aspeed,fan-t=
ach-ch: b'\x01' is not of type 'object', 'integer', 'array', 'boolean', 'nu=
ll'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: fan@2: aspeed,fan-t=
ach-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'nu=
ll'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: fan@3: aspeed,fan-t=
ach-ch: b'\x03' is not of type 'object', 'integer', 'array', 'boolean', 'nu=
ll'

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
