Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDDE2DE70D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 03:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791169222; cv=none; b=HKUskEtrHVEZoQdXeAQg9hfa35z+4EucjMXYMctP9Cy0DPxsutbMeLKLQYhlisuYrJ3F+CBBcKgS5laGAzF0+sPQGFNT4rjWcpKMWNTJUjZg0wJo+18T+jCttB1lL8v/j8LlquHMtJmt3ToYNz8ocSL0thxYBOj1GyKmNwt7BKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791169222; c=relaxed/simple;
	bh=bC9X6LnH8kxWvXsHIfkd8ZYJszZznM/tPJD9yaOxWs8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JBH3/iPp9IdyR768IZOoma40MivXU7BrkeBVmJWboo8JEbbLrKKLTLNqPwe8nb2KPFQIS5wKA9WiPa/OAzfGjsSlF7KciqeCG2L13UaqPbZgoTk7e/wnSR09wapkALg2Tard2HXbinHlibS92BQ+aA22NHY6Sc7p4oqNlvjTTmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cEciERoF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cEciERoF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791169217; x=1822705217;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bC9X6LnH8kxWvXsHIfkd8ZYJszZznM/tPJD9yaOxWs8=;
  b=cEciERoFtUbSxZtoEnfWPU5B5MF8uLO8elPbAugZvK+a/xvUfGwOPjjj
   GYQfcnLtSf5OwUAujE9NNVt0vMOX+wGTdRC6jULUkRbonf1VMkHEGJfay
   6KCxLCUytoX9qKv8H2nvu9K8srgEI/SUAQxX4f4I/EUl/jTLMIh7VjijT
   aBEjb/uCix2dd1OhPZR/EafE3GqdPosrGIK4y1SQG2Sk2Yl/RrUDcRQfF
   w0U2RohERelmdItFOizcx3Zd8rsDPCnmB1JF11P96Xw+6MOG1P+CK5OwS
   3KyFgF1yX8fssQBSox4hZjm7izi9dypLcUxhvtPYbaVFdxucmxkwhiF12
   w==;
X-CSE-ConnectionGUID: scC3u0rLSp6HwKrl/I0rhQ==
X-CSE-MsgGUID: 1QLPbaN3QTy5uhjA/hcOsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="117355939"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="117355939"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 20:00:16 -0700
X-CSE-ConnectionGUID: rBVf0aP6RlqvIPpcceZLmw==
X-CSE-MsgGUID: X/n5YoE6TJyuNp8UxwSNKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="275812374"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 04 Oct 2026 20:00:14 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDYw0-000000000XJ-1HXD;
	Mon, 05 Oct 2026 03:00:12 +0000
Date: Mon, 05 Oct 2026 04:59:32 +0200
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Iv=C3=A1n?= Ezequiel Rodriguez" <ivanrwcm25@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-doc@vger.kernel.org
Subject: [sre-power-supply:for-next 45/66] htmldocs:
 Documentation/power/power_supply_class.rst:211: WARNING: Inline emphasis
 start-string without end-string. [docutils]
Message-ID: <202610050416.L69x2Wpo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-sup=
ply.git for-next
head:   5c1c602463d597c5189ddc5a73dece588ba2c57a
commit: 420a1e2763b5df3ed90f92d97cf30fe43822bba8 [45/66] docs: power: suppl=
y: fix power_supply_class.rst status, health and time_to
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933=
e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20261005/202610050416.L=
69x2Wpo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610050416.L69x2Wpo-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   Implicit creation
   ----------------- [docutils]
   WARNING: ./include/net/page_pool/types.h:105 Excess struct member 'fast'=
 description in 'page_pool_params' (did you mean one of: 'flags', 'offset')
   WARNING: ./include/net/page_pool/types.h:105 Excess struct member 'slow'=
 description in 'page_pool_params'
>> Documentation/power/power_supply_class.rst:211: WARNING: Inline emphasis=
 start-string without end-string. [docutils]
>> Documentation/power/power_supply_class.rst:211: WARNING: Inline emphasis=
 start-string without end-string. [docutils]
   Documentation/trace/events-landlock:314: ./include/trace/events/landlock=
.h:155: ERROR: Unexpected section title.


vim +211 Documentation/power/power_supply_class.rst

151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13   73 =20
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13   74  Postfixes:
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13   75 =20
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13   76  _AVG
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13   77    *hardware* avera=
ged value, use it if your hardware is really able to
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13   78    report averaged =
values.
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13   79  _NOW
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13   80    momentary/instan=
taneous values.
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13   81 =20
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13   82  STATUS
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13   83    this attribute r=
epresents operating status (charging, full,
06b54f2d741b63e Randy Dunlap            2025-10-14   84    discharging (i.e=
., powering a load), etc.). This corresponds to
420a1e2763b5df3 Iv=C3=A1n Ezequiel Rodriguez 2026-08-31   85    `POWER_SUPP=
LY_STATUS_*` values, as defined in
420a1e2763b5df3 Iv=C3=A1n Ezequiel Rodriguez 2026-08-31   86    include/lin=
ux/power_supply.h.
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13   87 =20
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13   88  CHARGE_TYPE
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13   89    batteries can ty=
pically charge at different rates.
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13   90    This defines tri=
ckle and fast charges.  For batteries that
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13   91    are already char=
ged or discharging, 'n/a' can be displayed (or
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13   92    'unknown', if th=
e status is not known).
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13   93 =20
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13   94  AUTHENTIC
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13   95    indicates the po=
wer supply (battery or charger) connected
06b54f2d741b63e Randy Dunlap            2025-10-14   96    to the platform =
is authentic(1) or non-authentic(0).
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13   97 =20
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13   98  HEALTH
420a1e2763b5df3 Iv=C3=A1n Ezequiel Rodriguez 2026-08-31   99    represents =
health of the battery. Values correspond to
420a1e2763b5df3 Iv=C3=A1n Ezequiel Rodriguez 2026-08-31  100    POWER_SUPPL=
Y_HEALTH_*, defined in include/linux/power_supply.h.
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  101 =20
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  102  VOLTAGE_OCV
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  103    open circuit vol=
tage of the battery.
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  104 =20
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  105  VOLTAGE_MAX_DESIGN=
, VOLTAGE_MIN_DESIGN
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  106    design values fo=
r maximal and minimal power supply voltages.
06b54f2d741b63e Randy Dunlap            2025-10-14  107    Maximal/minimal =
means values of voltages when battery is considered
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  108    "full"/"empty" a=
t normal conditions. Yes, there is no direct relation
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  109    between voltage =
and battery capacity, but some dumb
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  110    batteries use vo=
ltage for very approximated calculation of capacity.
06b54f2d741b63e Randy Dunlap            2025-10-14  111    A battery driver=
 also can use this attribute just to inform userspace
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  112    about maximal an=
d minimal voltage thresholds of a given battery.
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  113 =20
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  114  VOLTAGE_MAX, VOLTA=
GE_MIN
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  115    same as _DESIGN =
voltage values except that these ones should be used
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  116    if hardware coul=
d only guess (measure and retain) the thresholds of a
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  117    given power supp=
ly.
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  118 =20
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  119  VOLTAGE_BOOT
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  120    Reports the volt=
age measured during boot
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  121 =20
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  122  CURRENT_BOOT
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  123    Reports the curr=
ent measured during boot
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  124 =20
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  125  CHARGE_FULL_DESIGN=
, CHARGE_EMPTY_DESIGN
06b54f2d741b63e Randy Dunlap            2025-10-14  126    design charge va=
lues, when battery is considered full/empty.
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  127 =20
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  128  ENERGY_FULL_DESIGN=
, ENERGY_EMPTY_DESIGN
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  129    same as above bu=
t for energy.
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  130 =20
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  131  CHARGE_FULL, CHARG=
E_EMPTY
06b54f2d741b63e Randy Dunlap            2025-10-14  132    These attributes=
 mean "last remembered value of charge when battery
06b54f2d741b63e Randy Dunlap            2025-10-14  133    became full/empt=
y". They also could mean "value of charge when battery is
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  134    considered full/=
empty at given conditions (temperature, age)".
06b54f2d741b63e Randy Dunlap            2025-10-14  135    I.e., these attr=
ibutes represents real thresholds, not design values.
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  136 =20
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  137  ENERGY_FULL, ENERG=
Y_EMPTY
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  138    same as above bu=
t for energy.
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  139 =20
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  140  CHARGE_COUNTER
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  141    the current char=
ge counter (in =C2=B5Ah).  This could easily
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  142    be negative; the=
re is no empty or full value.  It is only useful for
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  143    relative, time-b=
ased measurements.
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  144 =20
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  145  PRECHARGE_CURRENT
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  146    the maximum char=
ge current during precharge phase of charge cycle
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  147    (typically 20% o=
f battery capacity).
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  148 =20
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  149  CHARGE_TERM_CURRENT
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  150    Charge terminati=
on current. The charge cycle terminates when battery
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  151    voltage is above=
 recharge threshold, and charge current is below
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  152    this setting (ty=
pically 10% of battery capacity).
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  153 =20
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  154  CONSTANT_CHARGE_CU=
RRENT
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  155    constant charge =
current programmed by charger.
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  156 =20
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  157  CONSTANT_CHARGE_CU=
RRENT_MAX
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  158    maximum charge c=
urrent supported by the power supply object.
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  159 =20
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  160  CONSTANT_CHARGE_VO=
LTAGE
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  161    constant charge =
voltage programmed by charger.
06b54f2d741b63e Randy Dunlap            2025-10-14  162 =20
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  163  CONSTANT_CHARGE_VO=
LTAGE_MAX
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  164    maximum charge v=
oltage supported by the power supply object.
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  165 =20
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  166  INPUT_CURRENT_LIMIT
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  167    input current li=
mit programmed by charger. Indicates
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  168    the current draw=
n from a charging source.
5fe7b600a116187 Linus Torvalds          2019-07-15  169  INPUT_VOLTAGE_LIMIT
5fe7b600a116187 Linus Torvalds          2019-07-15  170    input voltage li=
mit programmed by charger. Indicates
5fe7b600a116187 Linus Torvalds          2019-07-15  171    the voltage limi=
t from a charging source.
5fe7b600a116187 Linus Torvalds          2019-07-15  172  INPUT_POWER_LIMIT
5fe7b600a116187 Linus Torvalds          2019-07-15  173    input power limi=
t programmed by charger. Indicates
5fe7b600a116187 Linus Torvalds          2019-07-15  174    the power limit =
from a charging source.
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  175 =20
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  176  CHARGE_CONTROL_LIM=
IT
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  177    current charge c=
ontrol limit setting
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  178  CHARGE_CONTROL_LIM=
IT_MAX
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  179    maximum charge c=
ontrol limit setting
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  180 =20
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  181  CALIBRATE
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  182    battery or coulo=
mb counter calibration status
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  183 =20
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  184  CAPACITY
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  185    capacity in perc=
ents.
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  186  CAPACITY_ALERT_MIN
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  187    minimum capacity=
 alert value in percents.
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  188  CAPACITY_ALERT_MAX
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  189    maximum capacity=
 alert value in percents.
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  190  CAPACITY_LEVEL
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  191    capacity level. =
This corresponds to POWER_SUPPLY_CAPACITY_LEVEL_*.
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  192 =20
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  193  TEMP
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  194    temperature of t=
he power supply.
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  195  TEMP_ALERT_MIN
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  196    minimum battery =
temperature alert.
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  197  TEMP_ALERT_MAX
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  198    maximum battery =
temperature alert.
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  199  TEMP_AMBIENT
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  200    ambient temperat=
ure.
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  201  TEMP_AMBIENT_ALERT=
_MIN
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  202    minimum ambient =
temperature alert.
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  203  TEMP_AMBIENT_ALERT=
_MAX
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  204    maximum ambient =
temperature alert.
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  205  TEMP_MIN
420a1e2763b5df3 Iv=C3=A1n Ezequiel Rodriguez 2026-08-31  206    minimum ope=
rable temperature
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  207  TEMP_MAX
420a1e2763b5df3 Iv=C3=A1n Ezequiel Rodriguez 2026-08-31  208    maximum ope=
rable temperature
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  209 =20
420a1e2763b5df3 Iv=C3=A1n Ezequiel Rodriguez 2026-08-31  210  TIME_TO_EMPTY=
_NOW, TIME_TO_EMPTY_AVG
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13 @211    seconds left for=
 battery to be considered empty
420a1e2763b5df3 Iv=C3=A1n Ezequiel Rodriguez 2026-08-31  212    (i.e., whil=
e battery powers a load). *_NOW is a
420a1e2763b5df3 Iv=C3=A1n Ezequiel Rodriguez 2026-08-31  213    momentary r=
eading; *_AVG is averaged over a fixed period.
420a1e2763b5df3 Iv=C3=A1n Ezequiel Rodriguez 2026-08-31  214  TIME_TO_FULL_=
NOW, TIME_TO_FULL_AVG
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  215    seconds left for=
 battery to be considered full
420a1e2763b5df3 Iv=C3=A1n Ezequiel Rodriguez 2026-08-31  216    (i.e., whil=
e battery is charging). Same now/avg distinction.
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  217 =20
151f4e2bdc7a040 Mauro Carvalho Chehab   2019-06-13  218 =20

:::::: The code at line 211 was first introduced by commit
:::::: 151f4e2bdc7a04020ae5c533896fb91a16e1f501 docs: power: convert docs t=
o ReST and rename to *.rst

:::::: TO: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
