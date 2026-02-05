Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D37632549A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Feb 2026 20:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770324401; cv=none; b=Bq4iLc/VbH8c2hKnU3sZfthLvWhRSOmxYmWa0B5xUWYKdm066vMhuZ+4PRttAVI6YfnfP0DbkOZ/WudWNA34apBl/HiAbs7CVAg9qVVYgMD3xplK6+W+noy26PJlwfMoZtxAlxC/pI3jcho6X4DeBSDIVdMUHCPk+oiJ6gGf7gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770324401; c=relaxed/simple;
	bh=klorBrFvX/F6S7WRhCI7HI1Opos7QzdX8qUicPgjCWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cu1plRVdTOV9LoU/0yGHFgsmLF8QPD1RQ1yzKsjPnJC9LeK2ysss3IKsFs2RKG4s+quPTRtrVGVbu+V4uZ1XhjkP/GQ+nRSWeZfXZH6ioHokFppqx8fqEejtR/a9GwOG0DmWpVa9YMs2J5oB1VrEin+vl2QVDndf5BE7HOe+mY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z0jVP3rD; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z0jVP3rD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770324400; x=1801860400;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=klorBrFvX/F6S7WRhCI7HI1Opos7QzdX8qUicPgjCWQ=;
  b=Z0jVP3rDAY6VNJFTKAIKCDWeGiwVQFbuSFniqOBPjKe9kmXWi44r7pzK
   9/N37pqe4eOMbrl8DU+W0jJLihcEp1M34zTXVagbwdM2QRrFpKa1sCuWn
   ozruhEsmo2JtXKaF1nhc+kCvsg8cCIZ4N7QIyb485PSzMUaWWWlfSUgkj
   zdRIFl0u+ZgHr8Bc6oJDyMPvbazuPSslngpPmTUhk5AQ9CjqdVfGCUG3y
   7ycZ1Qy1PyQAi6sY9eh968GHepnfJcBbQJJ+RvvKwQ5qDIeU2l/LHFkgF
   DtB/ZtYmrVIZhZi/pEWNG3dwSianAXDUfrufVDjRdbSRsPMkFFa550RKM
   Q==;
X-CSE-ConnectionGUID: aE3+CM4aTcWtRSUAA8mTlA==
X-CSE-MsgGUID: Sqp+5KTcSC6x+PQvZ7jrLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71632828"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="71632828"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 12:46:30 -0800
X-CSE-ConnectionGUID: AiyBeAi9QEejyAu6q4Th0A==
X-CSE-MsgGUID: zUFWNmbFS4iCf/Ro4E9BAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="210079287"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 05 Feb 2026 12:46:28 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vo6F8-000000004EL-1L1p;
	Thu, 05 Feb 2026 20:46:26 +0000
Date: Thu, 05 Feb 2026 21:45:44 +0100
From: kernel test robot <lkp@intel.com>
To: Colin Huang <u8813345@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/hwmon/index.rst:19: WARNING: toctree
 contains reference to nonexisting document 'hwmon/q54sn120a1'
 [toc.not_readable]
Message-ID: <202602052113.D7KUTIgM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/intel-lab-lkp/linux/commits/Colin-Huang/hwmon-pm=
bus-Add-Delta-Q54SN120A1-Q54SW120A7-driver/20260205-213938
head:   9d3145d417ed1f383cd0f2e5a74f1873520a6ba9
commit: 9d3145d417ed1f383cd0f2e5a74f1873520a6ba9 docs: hwmon: Add Q54SN120A=
1 and Q54SW120A7 to index
date:   7 hours ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260205/202602052113.D=
7KUTIgM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602052113.D7KUTIgM-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   WARNING: No kernel-doc for file ./include/linux/hid_bpf.h
   ERROR: Cannot find file ./include/linux/hid_bpf.h
   WARNING: No kernel-doc for file ./include/linux/hid_bpf.h
   ERROR: Cannot find file ./include/linux/hid.h
   WARNING: No kernel-doc for file ./include/linux/hid.h
>> Documentation/hwmon/index.rst:19: WARNING: toctree contains reference to=
 nonexisting document 'hwmon/q54sn120a1' [toc.not_readable]
>> Documentation/hwmon/index.rst:19: WARNING: toctree contains reference to=
 nonexisting document 'hwmon/q54sw120a7' [toc.not_readable]
   ERROR: Cannot find file ./include/linux/i2c-atr.h
   WARNING: No kernel-doc for file ./include/linux/i2c-atr.h
   ERROR: Cannot find file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/mutex.h
   WARNING: No kernel-doc for file ./include/linux/mutex.h


vim +19 Documentation/hwmon/index.rst

7ebd8b66dd9e5a Mauro Carvalho Chehab                      2019-04-17   18 =
=20
7ebd8b66dd9e5a Mauro Carvalho Chehab                      2019-04-17  @19  =
.. toctree::
7ebd8b66dd9e5a Mauro Carvalho Chehab                      2019-04-17   20  =
   :maxdepth: 1
7ebd8b66dd9e5a Mauro Carvalho Chehab                      2019-04-17   21 =
=20
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   22  =
   abituguru
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   23  =
   abituguru3
7a46c0cb473f05 Lakshmi Yadlapati                          2023-04-13   24  =
   acbel-fsg032
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   25  =
   acpi_power_meter
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   26  =
   ad7314
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   27  =
   adc128d818
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   28  =
   adm1025
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   29  =
   adm1026
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   30  =
   adm1031
09b08ac9e8d586 Beniamin Bia                               2020-01-14   31  =
   adm1177
9514a22866ba13 Alexandru Tachici                          2020-08-12   32  =
   adm1266
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   33  =
   adm1275
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   34  =
   adm9240
04f175954daee5 Radu Sabau                                 2024-03-21   35  =
   adp1050
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   36  =
   ads7828
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   37  =
   adt7410
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   38  =
   adt7411
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   39  =
   adt7462
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   40  =
   adt7470
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   41  =
   adt7475
8c78f0dee4371a Johannes Cornelis Draaijer (datdenkikniet  2021-01-07   42) =
   aht10
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   43  =
   amc6821
0e35f63f7f4eeb Aleksa Savic                               2021-08-28   44  =
   aquacomputer_d5next
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   45  =
   asb100
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   46  =
   asc7621
7e1449cd15d109 Billy Tsai                                 2024-02-21   47  =
   aspeed-g6-pwm-tach
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   48  =
   aspeed-pwm-tacho
0314c6ac9e98d7 Eugene Shalygin                            2022-01-24   49  =
   asus_ec_sensors
ed3e03790c5c9f Aleksa Savic                               2024-01-08   50  =
   asus_rog_ryujin
548820e21ce105 Denis Pauk                                 2021-11-16   51  =
   asus_wmi_sensors
4406d36dfdf1fb Michael Walle                              2020-04-20   52  =
   bcm54140
61412ef12a8450 Tao Ren                                    2019-10-29   53  =
   bel-pfe
15b2703e5e0230 Chris Packham                              2021-03-17   54  =
   bpa-rs600
87976ce2825d9f Serge Semin                                2020-05-28   55  =
   bt1-pvt
08ebc9def79fc0 Thomas Richard                             2025-02-03   56  =
   cgbc-hwmon
3af350929e752f Javier Carrasco                            2024-01-30   57  =
   chipcap2
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   58  =
   coretemp
40c3a445422579 Marius Zachmann                            2020-06-26   59  =
   corsair-cpro
d115b51e0e5671 Wilken Gottwalt                            2020-10-27   60  =
   corsair-psu
bc3e45258096f2 Thomas Wei=C3=9Fschuh                           2024-05-29  =
 61     cros_ec_hwmon
de076198d1e493 Ninad Palsule                              2024-12-17   62  =
   crps
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   63  =
   da9052
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   64  =
   da9055
4a1288f1c1cf58 Giovanni Mascellani                        2019-11-22   65  =
   dell-smm-hwmon
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   66  =
   dme1737
3efbcee8d40297 Robert Marko                               2021-06-07   67  =
   dps920ab
5b46903d8bf372 Guenter Roeck                              2019-11-28   68  =
   drivetemp
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   69  =
   ds1621
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   70  =
   ds620
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   71  =
   emc1403
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   72  =
   emc2103
005cc9b4f11183 Michael Shych                              2022-08-10   73  =
   emc2305
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   74  =
   emc6w201
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   75  =
   f71805f
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   76  =
   f71882fg
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   77  =
   fam15h_power
1734b4135a62fd V=C3=A1clav Kubern=C3=A1t                            2021-04=
-14   78     fsp-3y
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   79  =
   ftsteutates
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   80  =
   g760a
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   81  =
   g762
42ac68e3d4ba06 Aleksa Savic                               2023-12-07   82  =
   gigabyte_waterforce
3bce5377ef66a8 Tim Harvey                                 2020-05-15   83  =
   gsc-hwmon
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   84  =
   gl518sm
69001f21ded781 Cryolitia PukNgae                          2025-09-08   85  =
   gpd-fan
90905f7c40910a Nick Hawkins                               2023-01-03   86  =
   gxp-fan-ctrl
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   87  =
   hih6130
23902f98f8d481 James Seo                                  2023-05-22   88  =
   hp-wmi-sensors
43fbe66dc2164c Andre Werner                               2023-07-25   89  =
   hs3001
bf1bb26f23f10f Andrei Lalaev                              2025-02-17   90  =
   htu31
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   91  =
   ibmaem
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   92  =
   ibm-cffps
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   93  =
   ibmpowernv
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   94  =
   ina209
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   95  =
   ina2xx
b64b6cb163f164 Leo Yang                                   2025-01-16   96  =
   ina233
eacb52f010a807 Nathan Rossi                               2021-11-02   97  =
   ina238
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   98  =
   ina3221
6d3b8bc508784f James Seo                                  2023-05-04   99  =
   inspur-ipsps1
865e4fc013ba58 Xu Yilun                                   2020-09-21  100  =
   intel-m10-bmc-hwmon
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  101  =
   ir35221
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  102  =
   ir38064
e20a7198a20fcd Chris Packham                              2021-03-01  103  =
   ir36021
39671a14df4f26 Yikai Tsai                                 2024-10-02  104  =
   isl28022
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  105  =
   isl68137
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  106  =
   it87
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  107  =
   jc42
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  108  =
   k10temp
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  109  =
   k8temp
7e581c193bde7d Gerhard Engleder                           2025-04-09  110  =
   kbatt
9b96f82c782c9d Gerhard Engleder                           2025-04-25  111  =
   kfan
c8f55be4a1c7b4 Michael Walle                              2022-04-01  112  =
   lan966x
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  113  =
   lineage-pem
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  114  =
   lm25066
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  115  =
   lm63
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  116  =
   lm70
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  117  =
   lm73
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  118  =
   lm75
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  119  =
   lm77
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  120  =
   lm78
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  121  =
   lm80
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  122  =
   lm83
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  123  =
   lm85
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  124  =
   lm87
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  125  =
   lm90
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  126  =
   lm92
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  127  =
   lm93
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  128  =
   lm95234
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  129  =
   lm95245
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  130  =
   lochnagar
c66c5bda7f24a7 Cedric Encarnacion                         2025-04-21  131  =
   lt3074
e10d9e4ca1d9d7 Guenter Roeck                              2022-05-18  132  =
   lt7182s
b0bd407e94b036 Alexandru Tachici                          2020-12-03  133  =
   ltc2992
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  134  =
   ltc2945
9f90fd652bed0a Nuno S=C3=A1                                    2019-10-21  =
135     ltc2947
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  136  =
   ltc2978
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  137  =
   ltc2990
2b9ea4262ae911 Antoniu Miclaus                            2023-10-26  138  =
   ltc2991
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  139  =
   ltc3815
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  140  =
   ltc4151
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  141  =
   ltc4215
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  142  =
   ltc4245
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  143  =
   ltc4260
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  144  =
   ltc4261
cbc29538dbf7d7 Nuno Sa                                    2024-01-29  145  =
   ltc4282
0c459759ca971e Delphine CC Chiu                           2023-11-23  146  =
   ltc4286
785205fd81399b James Calligeros                           2025-11-12  147  =
   macsmc-hwmon
12d36c8362d090 Tao Ren                                    2020-11-23  148  =
   max127
1e4063329fe865 Erik Rosen                                 2021-04-19  149  =
   max15301
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  150  =
   max16064
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  151  =
   max16065
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  152  =
   max1619
2138f8853a00b2 Guenter Roeck                              2019-12-14  153  =
   max16601
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  154  =
   max1668
77ed12d163c7bf Kim Seer Paller                            2025-09-30  155  =
   max17616
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  156  =
   max197
cce209581a61d0 Guenter Roeck                              2019-12-05  157  =
   max20730
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  158  =
   max20751
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  159  =
   max31722
d21ed22ba7b110 Guenter Roeck                              2019-11-23  160  =
   max31730
8e27c2fd61bb99 Ibrahim Tilki                              2022-09-10  161  =
   max31760
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  162  =
   max31785
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  163  =
   max31790
16d60ba8fdc4c6 Daniel Matyas                              2023-05-24  164  =
   max31827
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  165  =
   max34440
e8ac01e5db329c Arun Saravanan Balachandran                2021-09-13  166  =
   max6620
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  167  =
   max6639
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  168  =
   max6650
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  169  =
   max6697
8debd8511dd937 Dzmitry Sankouski                          2025-04-23  170  =
   max77705
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  171  =
   max8688
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  172  =
   mc13783-adc
a02b105fe9f2b8 Dimitri Fedrau                             2025-07-23  173  =
   mc33xs2410_hwmon
a66c9147916fef Mario Kicherer                             2023-01-18  174  =
   mc34vr500
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  175  =
   mcp3021
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  176  =
   menf21bmc
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  177  =
   mlxreg-fan
f9e5f289b686bb Peter Yin                                  2023-12-12  178  =
   mp2856
a3a2923aaf7f2c Wensheng Wang                              2025-08-05  179  =
   mp2869
f20f7363e7e1d2 Fabio Estevam                              2021-05-21  180  =
   mp2888
38b2b022363d8c Noah Wang                                  2024-06-26  181  =
   mp2891
a79472e30be48e Wensheng Wang                              2025-09-28  182  =
   mp2925
90bad684e9ac5a Wensheng Wang                              2025-08-05  183  =
   mp29502
9d8c4f0c0170a8 Mauro Carvalho Chehab                      2020-10-27  184  =
   mp2975
fc37348c907ba2 Noah Wang                                  2024-06-11  185  =
   mp2993
e1c5cd7e8af0f5 Howard.Chiu@quantatw.com                   2021-12-09  186  =
   mp5023
cd228e7b65d43c Alex Vdovydchenko                          2024-07-02  187  =
   mp5920
ce0742404ad7b6 Peter Yin                                  2023-11-13  188  =
   mp5990
dc5abc2ff0ee42 Noah Wang                                  2024-06-11  189  =
   mp9941
6923e2827d58ff Cosmo Chou                                 2025-10-10  190  =
   mp9945
f20b4a931130cb Charles Hsu                                2024-01-31  191  =
   mpq8785
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  192  =
   nct6683
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  193  =
   nct6775
46b94c485ed197 Ban Feng                                   2024-10-22  194  =
   nct7363
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  195  =
   nct7802
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  196  =
   nct7904
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  197  =
   npcm750-pwm-fan
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  198  =
   nsa320
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  199  =
   ntc_thermistor
82e3430dfa8c32 Jonas Malaco                               2021-03-19  200  =
   nzxt-kraken2
f3b4b146eb107b Aleksa Savic                               2024-01-29  201  =
   nzxt-kraken3
53e68c20aeb1e2 Aleksandr Mezin                            2021-10-31  202  =
   nzxt-smart2
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  203  =
   occ
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  204  =
   pc87360
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  205  =
   pc87427
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  206  =
   pcf8591
bf8e0cd8d6b2c9 Erik Rosen                                 2021-06-09  207  =
   pim4328
d0cd978513f2e3 Marcello Sylvester Bauer                   2022-02-21  208  =
   pli1209bc
7537862a90b8b9 Charles                                    2020-12-02  209  =
   pm6764tr
bdcfb955acc94a Jae Hyun Yoo                               2022-02-08  210  =
   peci-cputemp
bdcfb955acc94a Jae Hyun Yoo                               2022-02-08  211  =
   peci-dimmtemp
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  212  =
   pmbus
4381a36abdf1c5 Thomas Wei=C3=9Fschuh                           2023-09-02  =
213     powerz
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  214  =
   powr1220
1b2ca93cd0592b Cosmo Chou                                 2024-02-06  215  =
   pt5161l
899df7b41cc4b6 Mauro Carvalho Chehab                      2019-07-22  216  =
   pxe1610
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  217  =
   pwm-fan
d014538aa38561 xiao.ma                                    2020-12-01  218  =
   q54sj108a2
9d3145d417ed1f Colin Huang                                2026-02-05  219  =
   q54sn120a1
9d3145d417ed1f Colin Huang                                2026-02-05  220  =
   q54sw120a7
9855caf5d4eb1d Heiko Stuebner                             2024-11-07  221  =
   qnap-mcu-hwmon
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  222  =
   raspberrypi-hwmon
443b39c82c322c Michael Walle                              2025-09-12  223  =
   sa67
04165fb73f9b8e Akshay Gupta                               2021-07-26  224  =
   sbrmi
6ec3fcf556fe44 Kun Yi                                     2020-12-11  225  =
   sbtsi_temp
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  226  =
   sch5627
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  227  =
   sch5636
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  228  =
   scpi-hwmon
7f2958e845d2c8 Emil Renner Berthing                       2023-03-21  229  =
   sfctemp
758b62e562f2fd Inochi Amaoto                              2024-08-17  230  =
   sg2042-mcu
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  231  =
   sht15
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  232  =
   sht21
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  233  =
   sht3x
505c2549373f3a Navin Sankar Velliangiri                   2021-05-24  234  =
   sht4x
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  235  =
   shtc1
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  236  =
   sis5595
3f697027bcb095 Michael Walle                              2020-09-14  237  =
   sl28cpld
694144b215fc07 Quan Nguyen                                2022-09-29  238  =
   smpro-hwmon
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  239  =
   smsc47b397
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  240  =
   smsc47m192
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  241  =
   smsc47m1
4d05e3a0f53ae6 Mauro Carvalho Chehab                      2020-09-09  242  =
   sparx5-temp
09262e9814ca08 Guenter Roeck                              2024-05-27  243  =
   spd5118
42bfe7dd0f9918 Erik Rosen                                 2021-02-18  244  =
   stpddc60
d612bf839f618b Ivor Wanders                               2024-01-30  245  =
   surface_fan
de34a405325078 Alistair Francis                           2022-01-24  246  =
   sy7636a-hwmon
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  247  =
   tc654
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  248  =
   tc74
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  249  =
   thmc50
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  250  =
   tmp102
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  251  =
   tmp103
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  252  =
   tmp108
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  253  =
   tmp401
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  254  =
   tmp421
007e433cf03733 Guenter Roeck                              2022-02-22  255  =
   tmp464
59dfa75e5d82a1 Eric Tremblay                              2019-11-12  256  =
   tmp513
fff7b8ab225547 Robert Marko                               2021-01-21  257  =
   tps23861
339bca4ffdaa72 Jerome Brunet                              2024-12-02  258  =
   tps25990
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  259  =
   tps40422
6f4a0daea43060 Guenter Roeck                              2020-02-01  260  =
   tps53679
cc842bd57e779e Duke Du                                    2022-09-12  261  =
   tps546d24
0c7d530a04b4ca Igor Reznichenko                           2025-11-05  262  =
   tsc1641
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  263  =
   twl4030-madc-hwmon
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  264  =
   ucd9000
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  265  =
   ucd9200
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  266  =
   vexpress
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  267  =
   via686a
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  268  =
   vt1211
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  269  =
   w83627ehf
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  270  =
   w83627hf
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  271  =
   w83773g
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  272  =
   w83781d
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  273  =
   w83791d
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  274  =
   w83792d
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  275  =
   w83793
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  276  =
   w83795
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  277  =
   w83l785ts
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  278  =
   w83l786ng
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  279  =
   wm831x
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  280  =
   wm8350
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  281  =
   xgene-hwmon
35fe06d94e3952 Peter Yin                                  2024-04-25  282  =
   xdp710
971dfd8cdcd60f Vadim Pasternak                            2020-01-13  283  =
   xdpe12284
9054416afcb443 Greg.Schwendimann@infineon.com             2022-04-27  284  =
   xdpe152c4
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  285  =
   zl6100
7ebd8b66dd9e5a Mauro Carvalho Chehab                      2019-04-17  286 =
=20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
