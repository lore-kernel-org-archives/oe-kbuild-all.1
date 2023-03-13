Received: from mx0b-00190b01.pphosted.com (mx0b-00190b01.pphosted.com [67.231.157.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BCB15CA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Mar 2023 04:21:18 +0000 (UTC)
Received: from pps.filterd (m0050096.ppops.net [127.0.0.1])
	by m0050096.ppops.net-00190b01. (8.17.1.19/8.17.1.19) with ESMTP id 32CMAHrW000482;
	Mon, 13 Mar 2023 04:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=jan2016.eng;
 bh=TzJVh+dxMT6mR15lG3sKLDEd6Y26nG7ZzyEy72FTopo=;
 b=OV9k2OEQuGGy0p7/sREm9aCbSX7QARZgh7Bdy3KNNeuBBA63fz8o45Tk+DZfel2byTyc
 Vt61OEkje+0NIhp3/WhekUJui6Qhuk6mKgHW5Ka4fmawpixwRYhUHYOTRx2aNd0VuF5V
 XyixErX1XU8iWGsMYMehtL46ijmmz5BwUEMQxWm/jWhVwd8McVHeLhLhKX1+T5nTOS2e
 o6yrlpCG+cYO1Z6Es62hUYGS6eQtHKXHSwB/8xHHkkrqXnEnAEqudHNWd4hcZB89ijus
 Azr9MrygJCsdPZwlLuDfbRdHDFYfpCI7kx1L8hDG0XonjoEN9Gx4uMuErKGyXmubekyd Qg== 
Received: from prod-mail-ppoint1 (prod-mail-ppoint1.akamai.com [184.51.33.18] (may be forged))
	by m0050096.ppops.net-00190b01. (PPS) with ESMTPS id 3p8jxjfu1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Mar 2023 04:21:12 +0000
Received: from pps.filterd (prod-mail-ppoint1.akamai.com [127.0.0.1])
	by prod-mail-ppoint1.akamai.com (8.17.1.19/8.17.1.19) with ESMTP id 32CN16eE008402;
	Mon, 13 Mar 2023 00:21:11 -0400
Received: from prod-mail-relay10.akamai.com ([172.27.118.251])
	by prod-mail-ppoint1.akamai.com (PPS) with ESMTP id 3p8nv3689v-1;
	Mon, 13 Mar 2023 00:21:11 -0400
Received: from [172.19.47.106] (bos-lpa4700a.bos01.corp.akamai.com [172.19.47.106])
	by prod-mail-relay10.akamai.com (Postfix) with ESMTP id 292F95473B;
	Mon, 13 Mar 2023 04:21:11 +0000 (GMT)
Message-ID: <6f66fbe7-49da-a2ab-cc2c-596a572ea6c2@akamai.com>
Date: Mon, 13 Mar 2023 00:21:10 -0400
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [mcgrof:modules-next 9/9] lib/dynamic_debug.c:857:6: warning: no
 previous prototype for '__dynamic_pr_debug'
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Luis Chamberlain <mcgrof@kernel.org>
References: <202303111333.Rqs7rhRE-lkp@intel.com>
From: Jason Baron <jbaron@akamai.com>
In-Reply-To: <202303111333.Rqs7rhRE-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-12_10,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303130035
X-Proofpoint-GUID: 2GlquSqBA9z-A-aR1RyEc2nV9V_WpZRy
X-Proofpoint-ORIG-GUID: 2GlquSqBA9z-A-aR1RyEc2nV9V_WpZRy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-12_10,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303130035

On 3/11/23 12:01 AM, kernel test robot wrote:
> tree:   https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git__;!!GjvTz_vk!UY-kgys0XdPUeY6rTX_-r8Bq3Jxd2BsmLVXx_TjSIX5be32flJLNsGMrdGCIZ_HvdaXu2a4$  modules-next
> head:   40cf65c2c7dfb5bd2e553e80c20f4693430b6d4d
> commit: 40cf65c2c7dfb5bd2e553e80c20f4693430b6d4d [9/9] dyndbg: cleanup dynamic usage in ib_srp.c
> config: parisc-randconfig-r011-20230310 (https://urldefense.com/v3/__https://download.01.org/0day-ci/archive/20230311/202303111333.Rqs7rhRE-lkp@intel.com/config__;!!GjvTz_vk!UY-kgys0XdPUeY6rTX_-r8Bq3Jxd2BsmLVXx_TjSIX5be32flJLNsGMrdGCIZ_Hv3X0Zx8I$ )
> compiler: hppa-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>          wget https://urldefense.com/v3/__https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross__;!!GjvTz_vk!UY-kgys0XdPUeY6rTX_-r8Bq3Jxd2BsmLVXx_TjSIX5be32flJLNsGMrdGCIZ_HvxXRA7As$  -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=40cf65c2c7dfb5bd2e553e80c20f4693430b6d4d__;!!GjvTz_vk!UY-kgys0XdPUeY6rTX_-r8Bq3Jxd2BsmLVXx_TjSIX5be32flJLNsGMrdGCIZ_Hv3nGWtus$
>          git remote add mcgrof https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git__;!!GjvTz_vk!UY-kgys0XdPUeY6rTX_-r8Bq3Jxd2BsmLVXx_TjSIX5be32flJLNsGMrdGCIZ_HvdaXu2a4$
>          git fetch --no-tags mcgrof modules-next
>          git checkout 40cf65c2c7dfb5bd2e553e80c20f4693430b6d4d
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://urldefense.com/v3/__https://lore.kernel.org/oe-kbuild-all/202303111333.Rqs7rhRE-lkp@intel.com/__;!!GjvTz_vk!UY-kgys0XdPUeY6rTX_-r8Bq3Jxd2BsmLVXx_TjSIX5be32flJLNsGMrdGCIZ_Hv-uYrPWM$
> 
> All warnings (new ones prefixed by >>):
> 
>>> lib/dynamic_debug.c:857:6: warning: no previous prototype for '__dynamic_pr_debug' [-Wmissing-prototypes]
>       857 | void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...)
>           |      ^~~~~~~~~~~~~~~~~~
>>> lib/dynamic_debug.c:877:6: warning: no previous prototype for '__dynamic_dev_dbg' [-Wmissing-prototypes]
>       877 | void __dynamic_dev_dbg(struct _ddebug *descriptor,
>           |      ^~~~~~~~~~~~~~~~~
>>> lib/dynamic_debug.c:908:6: warning: no previous prototype for '__dynamic_netdev_dbg' [-Wmissing-prototypes]
>       908 | void __dynamic_netdev_dbg(struct _ddebug *descriptor,
>           |      ^~~~~~~~~~~~~~~~~~~~
> 

Hi Luis,

More Whack-A-Mole here. I cross-compiled to reproduce this error and 
seems like lots of functions in other files hit this warning. However, 
it's newly introduced with the latest patch added to modules-next, and 
thus I've sent a patch in reply to the thread to address it. Perhaps, it 
can be folded into the previous patch if it makes sense?

Thanks,

-Jason
