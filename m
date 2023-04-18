Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C8D15C7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 05:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681794504; x=1713330504;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=H4hgf8LU6/CPLSp5FudF7gD+4HUp3QE6KX9/Q5iLPkA=;
  b=gMU5ewbMvOHAJ6Xnxs8n9uQog4EqSoRItRCLx4b8txuyNxLLYS29nQkY
   OJiGkM1s7ylJKhx3AI9MM2l5I2MN/2M6b9ovvXjvTxihMYevMoPXSmz6K
   EzwY5QWnBYm8iFl6EfTpJHVKdTDSkK7tmEgalAPhyKAszRXbB4nWfT99M
   Soag/SI3Xw3Sk36S/DDsZ8AExOkgEmXxf8ymOeQfNgC0RSfbZSoGJ25JM
   mfKlKAoOjvYpHrh9v0sUxzrIrwTOcupCcM0wPKxsmG801rmxyO1uH5daJ
   pZtDJeGwmNVOK1WZq6Kij0sPWJFN9wCWdzWxzQbE6vm9Q8nSDyhhn961T
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="333876412"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="333876412"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 22:08:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="684433375"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="684433375"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 17 Apr 2023 22:08:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1podZl-000d0Z-0a;
	Tue, 18 Apr 2023 05:08:21 +0000
Date: Tue, 18 Apr 2023 13:08:06 +0800
From: kernel test robot <lkp@intel.com>
To: Dinh Nguyen <dinh.nguyen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-doc@vger.kernel.org
Subject: [dinguyen:for_next_hwmon_v2 7/7] htmldocs:
 Documentation/hwmon/index.rst:20: WARNING: toctree contains reference to
 nonexisting document 'hwmon/socfpga-hwmon'
Message-ID: <202304181343.qCPTq6Yz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git for_next_hwmon_v2
head:   06b5c9bde5bd2cc4c857e1a379043c23ec608072
commit: 06b5c9bde5bd2cc4c857e1a379043c23ec608072 [7/7] hwmon: (socfpga) Add hardware monitoring support on SoCFPGA platforms
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git/commit/?id=06b5c9bde5bd2cc4c857e1a379043c23ec608072
        git remote add dinguyen https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git
        git fetch --no-tags dinguyen for_next_hwmon_v2
        git checkout 06b5c9bde5bd2cc4c857e1a379043c23ec608072
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304181343.qCPTq6Yz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/hwmon/index.rst:20: WARNING: toctree contains reference to nonexisting document 'hwmon/socfpga-hwmon'

vim +20 Documentation/hwmon/index.rst

7ebd8b66dd9e5a Mauro Carvalho Chehab                      2019-04-17   19  
7ebd8b66dd9e5a Mauro Carvalho Chehab                      2019-04-17  @20  .. toctree::
7ebd8b66dd9e5a Mauro Carvalho Chehab                      2019-04-17   21     :maxdepth: 1
7ebd8b66dd9e5a Mauro Carvalho Chehab                      2019-04-17   22  
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   23     abituguru
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   24     abituguru3
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   25     acpi_power_meter
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   26     ad7314
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   27     adc128d818
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   28     adm1021
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   29     adm1025
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   30     adm1026
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   31     adm1031
09b08ac9e8d586 Beniamin Bia                               2020-01-14   32     adm1177
9514a22866ba13 Alexandru Tachici                          2020-08-12   33     adm1266
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   34     adm1275
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   35     adm9240
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   36     ads7828
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   37     adt7410
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   38     adt7411
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   39     adt7462
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   40     adt7470
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   41     adt7475
8c78f0dee4371a Johannes Cornelis Draaijer (datdenkikniet  2021-01-07   42)    aht10
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   43     amc6821
0e35f63f7f4eeb Aleksa Savic                               2021-08-28   44     aquacomputer_d5next
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   45     asb100
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   46     asc7621
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   47     aspeed-pwm-tacho
0314c6ac9e98d7 Eugene Shalygin                            2022-01-24   48     asus_ec_sensors
548820e21ce105 Denis Pauk                                 2021-11-16   49     asus_wmi_sensors
4406d36dfdf1fb Michael Walle                              2020-04-20   50     bcm54140
61412ef12a8450 Tao Ren                                    2019-10-29   51     bel-pfe
15b2703e5e0230 Chris Packham                              2021-03-17   52     bpa-rs600
87976ce2825d9f Serge Semin                                2020-05-28   53     bt1-pvt
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   54     coretemp
40c3a445422579 Marius Zachmann                            2020-06-26   55     corsair-cpro
d115b51e0e5671 Wilken Gottwalt                            2020-10-27   56     corsair-psu
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   57     da9052
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   58     da9055
4a1288f1c1cf58 Giovanni Mascellani                        2019-11-22   59     dell-smm-hwmon
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   60     dme1737
3efbcee8d40297 Robert Marko                               2021-06-07   61     dps920ab
5b46903d8bf372 Guenter Roeck                              2019-11-28   62     drivetemp
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   63     ds1621
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   64     ds620
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   65     emc1403
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   66     emc2103
005cc9b4f11183 Michael Shych                              2022-08-10   67     emc2305
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   68     emc6w201
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   69     f71805f
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   70     f71882fg
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   71     fam15h_power
1734b4135a62fd Václav Kubernát                            2021-04-14   72     fsp-3y
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   73     ftsteutates
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   74     g760a
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   75     g762
3bce5377ef66a8 Tim Harvey                                 2020-05-15   76     gsc-hwmon
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   77     gl518sm
90905f7c40910a Nick Hawkins                               2023-01-03   78     gxp-fan-ctrl
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   79     hih6130
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   80     ibmaem
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   81     ibm-cffps
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   82     ibmpowernv
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   83     ina209
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   84     ina2xx
eacb52f010a807 Nathan Rossi                               2021-11-02   85     ina238
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   86     ina3221
865e4fc013ba58 Xu Yilun                                   2020-09-21   87     intel-m10-bmc-hwmon
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   88     ir35221
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   89     ir38064
e20a7198a20fcd Chris Packham                              2021-03-01   90     ir36021
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   91     isl68137
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   92     it87
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   93     jc42
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   94     k10temp
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   95     k8temp
c8f55be4a1c7b4 Michael Walle                              2022-04-01   96     lan966x
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   97     lineage-pem
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   98     lm25066
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22   99     lm63
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  100     lm70
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  101     lm73
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  102     lm75
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  103     lm77
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  104     lm78
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  105     lm80
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  106     lm83
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  107     lm85
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  108     lm87
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  109     lm90
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  110     lm92
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  111     lm93
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  112     lm95234
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  113     lm95245
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  114     lochnagar
e10d9e4ca1d9d7 Guenter Roeck                              2022-05-18  115     lt7182s
b0bd407e94b036 Alexandru Tachici                          2020-12-03  116     ltc2992
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  117     ltc2945
9f90fd652bed0a Nuno Sá                                    2019-10-21  118     ltc2947
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  119     ltc2978
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  120     ltc2990
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  121     ltc3815
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  122     ltc4151
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  123     ltc4215
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  124     ltc4245
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  125     ltc4260
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  126     ltc4261
12d36c8362d090 Tao Ren                                    2020-11-23  127     max127
1e4063329fe865 Erik Rosen                                 2021-04-19  128     max15301
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  129     max16064
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  130     max16065
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  131     max1619
2138f8853a00b2 Guenter Roeck                              2019-12-14  132     max16601
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  133     max1668
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  134     max197
cce209581a61d0 Guenter Roeck                              2019-12-05  135     max20730
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  136     max20751
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  137     max31722
d21ed22ba7b110 Guenter Roeck                              2019-11-23  138     max31730
8e27c2fd61bb99 Ibrahim Tilki                              2022-09-10  139     max31760
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  140     max31785
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  141     max31790
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  142     max34440
e8ac01e5db329c Arun Saravanan Balachandran                2021-09-13  143     max6620
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  144     max6639
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  145     max6642
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  146     max6650
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  147     max6697
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  148     max8688
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  149     mc13783-adc
a66c9147916fef Mario Kicherer                             2023-01-18  150     mc34vr500
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  151     mcp3021
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  152     menf21bmc
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  153     mlxreg-fan
f20f7363e7e1d2 Fabio Estevam                              2021-05-21  154     mp2888
9d8c4f0c0170a8 Mauro Carvalho Chehab                      2020-10-27  155     mp2975
e1c5cd7e8af0f5 Howard.Chiu@quantatw.com                   2021-12-09  156     mp5023
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  157     nct6683
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  158     nct6775
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  159     nct7802
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  160     nct7904
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  161     npcm750-pwm-fan
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  162     nsa320
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  163     ntc_thermistor
82e3430dfa8c32 Jonas Malaco                               2021-03-19  164     nzxt-kraken2
53e68c20aeb1e2 Aleksandr Mezin                            2021-10-31  165     nzxt-smart2
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  166     occ
ed264e8a7d18c5 Joaquín Ignacio Aramendía                  2022-11-04  167     oxp-sensors
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  168     pc87360
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  169     pc87427
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  170     pcf8591
bf8e0cd8d6b2c9 Erik Rosen                                 2021-06-09  171     pim4328
d0cd978513f2e3 Marcello Sylvester Bauer                   2022-02-21  172     pli1209bc
7537862a90b8b9 Charles                                    2020-12-02  173     pm6764tr
bdcfb955acc94a Jae Hyun Yoo                               2022-02-08  174     peci-cputemp
bdcfb955acc94a Jae Hyun Yoo                               2022-02-08  175     peci-dimmtemp
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  176     pmbus
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  177     powr1220
899df7b41cc4b6 Mauro Carvalho Chehab                      2019-07-22  178     pxe1610
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  179     pwm-fan
d014538aa38561 xiao.ma                                    2020-12-01  180     q54sj108a2
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  181     raspberrypi-hwmon
04165fb73f9b8e Akshay Gupta                               2021-07-26  182     sbrmi
6ec3fcf556fe44 Kun Yi                                     2020-12-11  183     sbtsi_temp
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  184     sch5627
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  185     sch5636
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  186     scpi-hwmon
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  187     sht15
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  188     sht21
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  189     sht3x
505c2549373f3a Navin Sankar Velliangiri                   2021-05-24  190     sht4x
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  191     shtc1
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  192     sis5595
3f697027bcb095 Michael Walle                              2020-09-14  193     sl28cpld
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  194     smm665
694144b215fc07 Quan Nguyen                                2022-09-29  195     smpro-hwmon
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  196     smsc47b397
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  197     smsc47m192
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  198     smsc47m1
06b5c9bde5bd2c Dinh Nguyen                                2023-04-13  199     socfpga-hwmon
4d05e3a0f53ae6 Mauro Carvalho Chehab                      2020-09-09  200     sparx5-temp
42bfe7dd0f9918 Erik Rosen                                 2021-02-18  201     stpddc60
de34a405325078 Alistair Francis                           2022-01-24  202     sy7636a-hwmon
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  203     tc654
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  204     tc74
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  205     thmc50
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  206     tmp102
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  207     tmp103
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  208     tmp108
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  209     tmp401
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  210     tmp421
007e433cf03733 Guenter Roeck                              2022-02-22  211     tmp464
59dfa75e5d82a1 Eric Tremblay                              2019-11-12  212     tmp513
fff7b8ab225547 Robert Marko                               2021-01-21  213     tps23861
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  214     tps40422
6f4a0daea43060 Guenter Roeck                              2020-02-01  215     tps53679
cc842bd57e779e Duke Du                                    2022-09-12  216     tps546d24
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  217     twl4030-madc-hwmon
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  218     ucd9000
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  219     ucd9200
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  220     vexpress
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  221     via686a
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  222     vt1211
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  223     w83627ehf
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  224     w83627hf
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  225     w83773g
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  226     w83781d
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  227     w83791d
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  228     w83792d
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  229     w83793
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  230     w83795
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  231     w83l785ts
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  232     w83l786ng
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  233     wm831x
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  234     wm8350
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  235     xgene-hwmon
971dfd8cdcd60f Vadim Pasternak                            2020-01-13  236     xdpe12284
9054416afcb443 Greg.Schwendimann@infineon.com             2022-04-27  237     xdpe152c4
f786dbbe6f2683 Mauro Carvalho Chehab                      2019-04-22  238     zl6100
7ebd8b66dd9e5a Mauro Carvalho Chehab                      2019-04-17  239  

:::::: The code at line 20 was first introduced by commit
:::::: 7ebd8b66dd9e5a0b65e5ee5e2b8e7ca382ec97b7 docs: hwmon: Add an index file and rename docs to *.rst

:::::: TO: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
:::::: CC: Guenter Roeck <linux@roeck-us.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
