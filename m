Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB43156C8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jun 2023 10:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685959686; x=1717495686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ndavsAXPW+Fwj7Drx5xBzM6JTBWUJ0shaJBUFsR27Kk=;
  b=C0YOy/qQm1l9ZA4iSDyzJoxljglyTe9CvVbuiLdYN7pMA2R1Lvi+Ge0L
   EbxKUHcn0SV5yHUjhxcldqAdSDZhxILekgiRE1gVyQG8MtwyeUssFesfO
   JVRTNBPXdDZn7CBi8huOeD7hKP+dIfPWQoDEn9Tkvh7wYOZv/bRcXs+oR
   eq9WSfy8Kez4t5K60T5zcfxaLAoHvxOmDyCQ4v7xs14kM63Tq5YN4kg6G
   1QOt8yIdFl/n5Zcp/YgUPwU2kEL+bqNJ/p78TrvyK4ogbnkZN4kEkMY18
   gjKGGSOWP6MXYEhsOu8rgFgNDt+L3VIGuacro9Nwj4TXLenoJRjX3zvv6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="335948346"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="335948346"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 03:08:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="832751257"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="832751257"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 Jun 2023 03:07:58 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6782-00045Z-02;
	Mon, 05 Jun 2023 10:07:58 +0000
Date: Mon, 5 Jun 2023 18:07:34 +0800
From: kernel test robot <lkp@intel.com>
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: [linux-next:master 6053/6966]
 drivers/cpufreq/cpufreq-dt-platdev.c:104:34: warning: 'blocklist' defined
 but not used
Message-ID: <202306051812.1YdWyZca-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9ca10bfb8aa8fbf19ee22e702c8cf9b66ea73a54
commit: 2cb3ddc87094854f6aef49690ba2c25565208fe6 [6053/6966] cpufreq: dt-platdev: Support building as module
config: i386-randconfig-s042-20230605 (https://download.01.org/0day-ci/archive/20230605/202306051812.1YdWyZca-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2cb3ddc87094854f6aef49690ba2c25565208fe6
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 2cb3ddc87094854f6aef49690ba2c25565208fe6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/cpufreq/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306051812.1YdWyZca-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpufreq/cpufreq-dt-platdev.c:104:34: warning: 'blocklist' defined but not used [-Wunused-const-variable=]
     104 | static const struct of_device_id blocklist[] __initconst = {
         |                                  ^~~~~~~~~
>> drivers/cpufreq/cpufreq-dt-platdev.c:17:34: warning: 'allowlist' defined but not used [-Wunused-const-variable=]
      17 | static const struct of_device_id allowlist[] __initconst = {
         |                                  ^~~~~~~~~


vim +/blocklist +104 drivers/cpufreq/cpufreq-dt-platdev.c

297a66221d2bed Viresh Kumar               2016-09-09   12  
edeec420de2407 Viresh Kumar               2017-08-16   13  /*
edeec420de2407 Viresh Kumar               2017-08-16   14   * Machines for which the cpufreq device is *always* created, mostly used for
edeec420de2407 Viresh Kumar               2017-08-16   15   * platforms using "operating-points" (V1) property.
edeec420de2407 Viresh Kumar               2017-08-16   16   */
4814d9c5d3b956 Viresh Kumar               2021-05-20  @17  static const struct of_device_id allowlist[] __initconst = {
117d4f59affa86 Viresh Kumar               2016-04-22   18  	{ .compatible = "allwinner,sun4i-a10", },
117d4f59affa86 Viresh Kumar               2016-04-22   19  	{ .compatible = "allwinner,sun5i-a10s", },
117d4f59affa86 Viresh Kumar               2016-04-22   20  	{ .compatible = "allwinner,sun5i-a13", },
117d4f59affa86 Viresh Kumar               2016-04-22   21  	{ .compatible = "allwinner,sun5i-r8", },
117d4f59affa86 Viresh Kumar               2016-04-22   22  	{ .compatible = "allwinner,sun6i-a31", },
117d4f59affa86 Viresh Kumar               2016-04-22   23  	{ .compatible = "allwinner,sun6i-a31s", },
117d4f59affa86 Viresh Kumar               2016-04-22   24  	{ .compatible = "allwinner,sun7i-a20", },
117d4f59affa86 Viresh Kumar               2016-04-22   25  	{ .compatible = "allwinner,sun8i-a23", },
117d4f59affa86 Viresh Kumar               2016-04-22   26  	{ .compatible = "allwinner,sun8i-a83t", },
117d4f59affa86 Viresh Kumar               2016-04-22   27  	{ .compatible = "allwinner,sun8i-h3", },
117d4f59affa86 Viresh Kumar               2016-04-22   28  
e11b6293a8fcd3 Hoan Tran                  2016-12-15   29  	{ .compatible = "apm,xgene-shadowcat", },
e11b6293a8fcd3 Hoan Tran                  2016-12-15   30  
650ec6cfe32331 Linus Walleij              2016-10-25   31  	{ .compatible = "arm,integrator-ap", },
650ec6cfe32331 Linus Walleij              2016-10-25   32  	{ .compatible = "arm,integrator-cp", },
650ec6cfe32331 Linus Walleij              2016-10-25   33  
a0df77348ab376 Tao Wang                   2017-05-23   34  	{ .compatible = "hisilicon,hi3660", },
3920be471ce7f6 Viresh Kumar               2016-04-22   35  
7ead83f6df2b10 Viresh Kumar               2016-04-22   36  	{ .compatible = "fsl,imx27", },
7ead83f6df2b10 Viresh Kumar               2016-04-22   37  	{ .compatible = "fsl,imx51", },
7ead83f6df2b10 Viresh Kumar               2016-04-22   38  	{ .compatible = "fsl,imx53", },
7ead83f6df2b10 Viresh Kumar               2016-04-22   39  
a59511d1daa640 Viresh Kumar               2016-04-22   40  	{ .compatible = "marvell,berlin", },
dcd2ea410d8780 Robert Jarzmik             2016-10-31   41  	{ .compatible = "marvell,pxa250", },
dcd2ea410d8780 Robert Jarzmik             2016-10-31   42  	{ .compatible = "marvell,pxa270", },
a59511d1daa640 Viresh Kumar               2016-04-22   43  
2249c00a0bf854 Viresh Kumar               2016-03-30   44  	{ .compatible = "samsung,exynos3250", },
2249c00a0bf854 Viresh Kumar               2016-03-30   45  	{ .compatible = "samsung,exynos4210", },
2249c00a0bf854 Viresh Kumar               2016-03-30   46  	{ .compatible = "samsung,exynos5250", },
2249c00a0bf854 Viresh Kumar               2016-03-30   47  #ifndef CONFIG_BL_SWITCHER
2249c00a0bf854 Viresh Kumar               2016-03-30   48  	{ .compatible = "samsung,exynos5800", },
2249c00a0bf854 Viresh Kumar               2016-03-30   49  #endif
7694ca6e1d6f01 Viresh Kumar               2016-04-22   50  
a399dc9fc50053 Viresh Kumar               2016-04-22   51  	{ .compatible = "renesas,emev2", },
a399dc9fc50053 Viresh Kumar               2016-04-22   52  	{ .compatible = "renesas,r7s72100", },
a399dc9fc50053 Viresh Kumar               2016-04-22   53  	{ .compatible = "renesas,r8a73a4", },
a399dc9fc50053 Viresh Kumar               2016-04-22   54  	{ .compatible = "renesas,r8a7740", },
a6d1bfa05545b0 Lad Prabhakar              2020-04-27   55  	{ .compatible = "renesas,r8a7742", },
f0da898b464953 Geert Uytterhoeven         2016-11-16   56  	{ .compatible = "renesas,r8a7743", },
d1e1303173d7fe Biju Das                   2018-09-11   57  	{ .compatible = "renesas,r8a7744", },
f0da898b464953 Geert Uytterhoeven         2016-11-16   58  	{ .compatible = "renesas,r8a7745", },
a399dc9fc50053 Viresh Kumar               2016-04-22   59  	{ .compatible = "renesas,r8a7778", },
a399dc9fc50053 Viresh Kumar               2016-04-22   60  	{ .compatible = "renesas,r8a7779", },
a399dc9fc50053 Viresh Kumar               2016-04-22   61  	{ .compatible = "renesas,r8a7790", },
a399dc9fc50053 Viresh Kumar               2016-04-22   62  	{ .compatible = "renesas,r8a7791", },
ffdf8b867b922d Geert Uytterhoeven         2016-09-06   63  	{ .compatible = "renesas,r8a7792", },
a399dc9fc50053 Viresh Kumar               2016-04-22   64  	{ .compatible = "renesas,r8a7793", },
a399dc9fc50053 Viresh Kumar               2016-04-22   65  	{ .compatible = "renesas,r8a7794", },
a399dc9fc50053 Viresh Kumar               2016-04-22   66  	{ .compatible = "renesas,sh73a0", },
a399dc9fc50053 Viresh Kumar               2016-04-22   67  
014400c127be35 Finley Xiao                2016-04-22   68  	{ .compatible = "rockchip,rk2928", },
014400c127be35 Finley Xiao                2016-04-22   69  	{ .compatible = "rockchip,rk3036", },
014400c127be35 Finley Xiao                2016-04-22   70  	{ .compatible = "rockchip,rk3066a", },
014400c127be35 Finley Xiao                2016-04-22   71  	{ .compatible = "rockchip,rk3066b", },
014400c127be35 Finley Xiao                2016-04-22   72  	{ .compatible = "rockchip,rk3188", },
014400c127be35 Finley Xiao                2016-04-22   73  	{ .compatible = "rockchip,rk3228", },
014400c127be35 Finley Xiao                2016-04-22   74  	{ .compatible = "rockchip,rk3288", },
319af40a0053fe Finley Xiao                2017-08-04   75  	{ .compatible = "rockchip,rk3328", },
014400c127be35 Finley Xiao                2016-04-22   76  	{ .compatible = "rockchip,rk3366", },
014400c127be35 Finley Xiao                2016-04-22   77  	{ .compatible = "rockchip,rk3368", },
9d21d33cab2dd5 Dmitry Torokhov            2018-10-05   78  	{ .compatible = "rockchip,rk3399",
9d21d33cab2dd5 Dmitry Torokhov            2018-10-05   79  	  .data = &(struct cpufreq_dt_platform_data)
9d21d33cab2dd5 Dmitry Torokhov            2018-10-05   80  		{ .have_governor_per_policy = true, },
9d21d33cab2dd5 Dmitry Torokhov            2018-10-05   81  	},
014400c127be35 Finley Xiao                2016-04-22   82  
ff6c349f74218e Linus Walleij              2017-08-16   83  	{ .compatible = "st-ericsson,u8500", },
ff6c349f74218e Linus Walleij              2017-08-16   84  	{ .compatible = "st-ericsson,u8540", },
ff6c349f74218e Linus Walleij              2017-08-16   85  	{ .compatible = "st-ericsson,u9500", },
ff6c349f74218e Linus Walleij              2017-08-16   86  	{ .compatible = "st-ericsson,u9540", },
ff6c349f74218e Linus Walleij              2017-08-16   87  
4b4c0d37164c29 Mason Huo                  2023-04-21   88  	{ .compatible = "starfive,jh7110", },
4b4c0d37164c29 Mason Huo                  2023-04-21   89  
7694ca6e1d6f01 Viresh Kumar               2016-04-22   90  	{ .compatible = "ti,omap2", },
7694ca6e1d6f01 Viresh Kumar               2016-04-22   91  	{ .compatible = "ti,omap4", },
7694ca6e1d6f01 Viresh Kumar               2016-04-22   92  	{ .compatible = "ti,omap5", },
5e4249c6d9e596 Viresh Kumar               2016-04-22   93  
5e4249c6d9e596 Viresh Kumar               2016-04-22   94  	{ .compatible = "xlnx,zynq-7000", },
a5685781dfe9e7 Shubhrajyoti Datta         2017-07-13   95  	{ .compatible = "xlnx,zynqmp", },
bd37e022e33475 Wei Yongjun                2016-08-21   96  
bd37e022e33475 Wei Yongjun                2016-08-21   97  	{ }
f56aad1d98f1c0 Viresh Kumar               2016-03-30   98  };
f56aad1d98f1c0 Viresh Kumar               2016-03-30   99  
edeec420de2407 Viresh Kumar               2017-08-16  100  /*
edeec420de2407 Viresh Kumar               2017-08-16  101   * Machines for which the cpufreq device is *not* created, mostly used for
edeec420de2407 Viresh Kumar               2017-08-16  102   * platforms using "operating-points-v2" property.
edeec420de2407 Viresh Kumar               2017-08-16  103   */
4814d9c5d3b956 Viresh Kumar               2021-05-20 @104  static const struct of_device_id blocklist[] __initconst = {
f328584f7bff86 Yangtao Li                 2019-06-12  105  	{ .compatible = "allwinner,sun50i-h6", },
f328584f7bff86 Yangtao Li                 2019-06-12  106  
6286bbb40576ff Hector Martin              2022-11-28  107  	{ .compatible = "apple,arm-platform", },
6286bbb40576ff Hector Martin              2022-11-28  108  
fbb31cb805fd35 Sudeep Holla               2021-02-18  109  	{ .compatible = "arm,vexpress", },
fbb31cb805fd35 Sudeep Holla               2021-02-18  110  
ff76898c0a14a4 Viresh Kumar               2017-09-19  111  	{ .compatible = "calxeda,highbank", },
ff76898c0a14a4 Viresh Kumar               2017-09-19  112  	{ .compatible = "calxeda,ecx-2000", },
ff76898c0a14a4 Viresh Kumar               2017-09-19  113  
a08e1b6c2d0b9a Peng Fan                   2020-04-20  114  	{ .compatible = "fsl,imx7ulp", },
e6abacabb5acb6 Leonard Crestez            2019-06-05  115  	{ .compatible = "fsl,imx7d", },
bc8b0c271bbf1e Stefan Agner               2022-01-24  116  	{ .compatible = "fsl,imx7s", },
4d28ba1d62c48d Leonard Crestez            2019-05-13  117  	{ .compatible = "fsl,imx8mq", },
4d28ba1d62c48d Leonard Crestez            2019-05-13  118  	{ .compatible = "fsl,imx8mm", },
8ec5035039c743 Anson Huang                2019-08-18  119  	{ .compatible = "fsl,imx8mn", },
24f371f77e101c Anson Huang                2019-12-26  120  	{ .compatible = "fsl,imx8mp", },
4d28ba1d62c48d Leonard Crestez            2019-05-13  121  
ff76898c0a14a4 Viresh Kumar               2017-09-19  122  	{ .compatible = "marvell,armadaxp", },
ff76898c0a14a4 Viresh Kumar               2017-09-19  123  
6066998cbd2b10 Andrew-sh Cheng            2017-12-08  124  	{ .compatible = "mediatek,mt2701", },
6066998cbd2b10 Andrew-sh Cheng            2017-12-08  125  	{ .compatible = "mediatek,mt2712", },
6066998cbd2b10 Andrew-sh Cheng            2017-12-08  126  	{ .compatible = "mediatek,mt7622", },
6066998cbd2b10 Andrew-sh Cheng            2017-12-08  127  	{ .compatible = "mediatek,mt7623", },
de4ca30958676f Fabien Parent              2020-10-13  128  	{ .compatible = "mediatek,mt8167", },
6066998cbd2b10 Andrew-sh Cheng            2017-12-08  129  	{ .compatible = "mediatek,mt817x", },
6066998cbd2b10 Andrew-sh Cheng            2017-12-08  130  	{ .compatible = "mediatek,mt8173", },
6066998cbd2b10 Andrew-sh Cheng            2017-12-08  131  	{ .compatible = "mediatek,mt8176", },
9176b425bf8ff9 Andrew-sh.Cheng            2019-08-13  132  	{ .compatible = "mediatek,mt8183", },
be4b61ec45b3ef AngeloGioacchino Del Regno 2022-06-17  133  	{ .compatible = "mediatek,mt8186", },
70d99a8f0442bb Fabien Parent              2021-05-19  134  	{ .compatible = "mediatek,mt8365", },
75118c8ef9d16e Fabien Parent              2020-10-13  135  	{ .compatible = "mediatek,mt8516", },
6066998cbd2b10 Andrew-sh Cheng            2017-12-08  136  
26a7a47510ed12 Dmitry Osipenko            2019-11-18  137  	{ .compatible = "nvidia,tegra20", },
26a7a47510ed12 Dmitry Osipenko            2019-11-18  138  	{ .compatible = "nvidia,tegra30", },
ff76898c0a14a4 Viresh Kumar               2017-09-19  139  	{ .compatible = "nvidia,tegra124", },
43c36002b86d60 Joseph Lo                  2019-01-04  140  	{ .compatible = "nvidia,tegra210", },
01c5bb0cc2a39f Sumit Gupta                2022-12-20  141  	{ .compatible = "nvidia,tegra234", },
ff76898c0a14a4 Viresh Kumar               2017-09-19  142  
46e2856b8e1889 Ilia Lin                   2018-05-30  143  	{ .compatible = "qcom,apq8096", },
46e2856b8e1889 Ilia Lin                   2018-05-30  144  	{ .compatible = "qcom,msm8996", },
248b5f297cf809 Jorge Ramirez-Ortiz        2019-07-25  145  	{ .compatible = "qcom,qcs404", },
5e79d6d9ea00c2 Bjorn Andersson            2021-08-20  146  	{ .compatible = "qcom,sa8155p" },
72951a77c00fb2 Bjorn Andersson            2022-02-24  147  	{ .compatible = "qcom,sa8540p" },
fb091802d793e8 Sibi Sankar                2020-06-22  148  	{ .compatible = "qcom,sc7180", },
17a8b0b6dde67f Sibi Sankar                2021-05-12  149  	{ .compatible = "qcom,sc7280", },
d66cd5dea551e9 Bjorn Andersson            2021-07-24  150  	{ .compatible = "qcom,sc8180x", },
72951a77c00fb2 Bjorn Andersson            2022-02-24  151  	{ .compatible = "qcom,sc8280xp", },
49ef12215f112d Sibi Sankar                2020-06-22  152  	{ .compatible = "qcom,sdm845", },
0612d928b7ff8c Adam Skladowski            2022-08-15  153  	{ .compatible = "qcom,sm6115", },
5e79d6d9ea00c2 Bjorn Andersson            2021-08-20  154  	{ .compatible = "qcom,sm6350", },
faf28e240dd118 Konrad Dybcio              2023-01-03  155  	{ .compatible = "qcom,sm6375", },
417598f998520b Luca Weiss                 2023-03-24  156  	{ .compatible = "qcom,sm7225", },
5d79e5ce5489b4 Thara Gopinath             2021-08-04  157  	{ .compatible = "qcom,sm8150", },
5e79d6d9ea00c2 Bjorn Andersson            2021-08-20  158  	{ .compatible = "qcom,sm8250", },
5e79d6d9ea00c2 Bjorn Andersson            2021-08-20  159  	{ .compatible = "qcom,sm8350", },
46e2856b8e1889 Ilia Lin                   2018-05-30  160  
ff76898c0a14a4 Viresh Kumar               2017-09-19  161  	{ .compatible = "st,stih407", },
ff76898c0a14a4 Viresh Kumar               2017-09-19  162  	{ .compatible = "st,stih410", },
305accf3b53ae6 Alain Volmat               2020-08-31  163  	{ .compatible = "st,stih418", },
ff76898c0a14a4 Viresh Kumar               2017-09-19  164  
d477bf3af1e88f Suniel Mahesh              2017-09-21  165  	{ .compatible = "ti,am33xx", },
d477bf3af1e88f Suniel Mahesh              2017-09-21  166  	{ .compatible = "ti,am43", },
d477bf3af1e88f Suniel Mahesh              2017-09-21  167  	{ .compatible = "ti,dra7", },
b7dbe349e1eb5a H. Nikolaus Schaller       2019-09-11  168  	{ .compatible = "ti,omap3", },
e66e20d71d79e6 Dave Gerlach               2022-11-01  169  	{ .compatible = "ti,am625", },
b2b2029eb17888 Vibhore Vardhan            2023-05-26  170  	{ .compatible = "ti,am62a7", },
d477bf3af1e88f Suniel Mahesh              2017-09-21  171  
a8811ec764f95a Christian Marangi          2020-03-13  172  	{ .compatible = "qcom,ipq8064", },
a8811ec764f95a Christian Marangi          2020-03-13  173  	{ .compatible = "qcom,apq8064", },
a8811ec764f95a Christian Marangi          2020-03-13  174  	{ .compatible = "qcom,msm8974", },
a8811ec764f95a Christian Marangi          2020-03-13  175  	{ .compatible = "qcom,msm8960", },
a8811ec764f95a Christian Marangi          2020-03-13  176  
edeec420de2407 Viresh Kumar               2017-08-16  177  	{ }
edeec420de2407 Viresh Kumar               2017-08-16  178  };
edeec420de2407 Viresh Kumar               2017-08-16  179  

:::::: The code at line 104 was first introduced by commit
:::::: 4814d9c5d3b956c5a8f47acbb6b98fdd4dfe334f cpufreq: dt: Rename black/white-lists

:::::: TO: Viresh Kumar <viresh.kumar@linaro.org>
:::::: CC: Viresh Kumar <viresh.kumar@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
