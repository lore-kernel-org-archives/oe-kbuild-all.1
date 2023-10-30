Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3E6EA3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Oct 2023 02:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4SJbxB2dZJzrTmB;
	Mon, 30 Oct 2023 09:57:02 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 30 Oct 2023 10:00:00 +0800
Subject: Re: [rw-ubifs:next 1/18] fs/ubifs/file.c:1385: warning: Excess
 function parameter 'time' description in 'ubifs_update_time'
To: kernel test robot <lkp@intel.com>, Yang Li <yang.lee@linux.alibaba.com>
CC: <oe-kbuild-all@lists.linux.dev>, Richard Weinberger <richard@nod.at>
References: <202310290749.EkmBAiIQ-lkp@intel.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <4412bdb3-c9c8-f975-0712-d5141cc4e58e@huawei.com>
Date: Mon, 30 Oct 2023 10:00:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202310290749.EkmBAiIQ-lkp@intel.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected

ÔÚ 2023/10/29 7:29, kernel test robot Ð´µÀ:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git next
> head:   75690493591fe283e4c92a3ba7c4420e9858abdb
> commit: 48ec6328de6c153a64474d9e5b6ec95f20f4142b [1/18] ubifs: Fix some kernel-doc comments
> config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231029/202310290749.EkmBAiIQ-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231029/202310290749.EkmBAiIQ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310290749.EkmBAiIQ-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>>> fs/ubifs/file.c:1385: warning: Excess function parameter 'time' description in 'ubifs_update_time'
>
> vim +1385 fs/ubifs/file.c
>
> 1e51764a3c2ac0 Artem Bityutskiy  2008-07-14  1374
> 8c1c5f263833ec Dongsheng Yang    2015-11-07  1375  /**
> 8c1c5f263833ec Dongsheng Yang    2015-11-07  1376   * ubifs_update_time - update time of inode.
> 8c1c5f263833ec Dongsheng Yang    2015-11-07  1377   * @inode: inode to update
> 48ec6328de6c15 Yang Li           2023-07-12  1378   * @time:  timespec structure to hold the current time value
> 48ec6328de6c15 Yang Li           2023-07-12  1379   * @flags: time updating control flag determines updating
> 48ec6328de6c15 Yang Li           2023-07-12  1380   *	    which time fields of @inode
> 8c1c5f263833ec Dongsheng Yang    2015-11-07  1381   *
> 8c1c5f263833ec Dongsheng Yang    2015-11-07  1382   * This function updates time of the inode.
> 8c1c5f263833ec Dongsheng Yang    2015-11-07  1383   */
> 913e99287b98fd Jeff Layton       2023-08-07  1384  int ubifs_update_time(struct inode *inode, int flags)
> 8c1c5f263833ec Dongsheng Yang    2015-11-07 @1385  {
> 8c1c5f263833ec Dongsheng Yang    2015-11-07  1386  	struct ubifs_inode *ui = ubifs_inode(inode);
> 8c1c5f263833ec Dongsheng Yang    2015-11-07  1387  	struct ubifs_info *c = inode->i_sb->s_fs_info;
> 8c1c5f263833ec Dongsheng Yang    2015-11-07  1388  	struct ubifs_budget_req req = { .dirtied_ino = 1,
> 8c1c5f263833ec Dongsheng Yang    2015-11-07  1389  			.dirtied_ino_d = ALIGN(ui->data_len, 8) };
> 8c1c5f263833ec Dongsheng Yang    2015-11-07  1390  	int err, release;
> 8c1c5f263833ec Dongsheng Yang    2015-11-07  1391
> 541d4c798a5988 Jeff Layton       2023-08-07  1392  	if (!IS_ENABLED(CONFIG_UBIFS_ATIME_SUPPORT)) {
> 541d4c798a5988 Jeff Layton       2023-08-07  1393  		generic_update_time(inode, flags);
> 541d4c798a5988 Jeff Layton       2023-08-07  1394  		return 0;
> 541d4c798a5988 Jeff Layton       2023-08-07  1395  	}
> e3d73dead4988f Sascha Hauer      2019-03-26  1396
> 8c1c5f263833ec Dongsheng Yang    2015-11-07  1397  	err = ubifs_budget_space(c, &req);
> 8c1c5f263833ec Dongsheng Yang    2015-11-07  1398  	if (err)
> 8c1c5f263833ec Dongsheng Yang    2015-11-07  1399  		return err;
> 8c1c5f263833ec Dongsheng Yang    2015-11-07  1400
> 8c1c5f263833ec Dongsheng Yang    2015-11-07  1401  	mutex_lock(&ui->ui_mutex);
> 97ebfdb7ad089d Jeff Layton       2023-08-07  1402  	inode_update_timestamps(inode, flags);
> 8c1c5f263833ec Dongsheng Yang    2015-11-07  1403  	release = ui->dirty;
> ecf84096a526f2 Christoph Hellwig 2020-04-09  1404  	__mark_inode_dirty(inode, I_DIRTY_SYNC);
> 8c1c5f263833ec Dongsheng Yang    2015-11-07  1405  	mutex_unlock(&ui->ui_mutex);
> 8c1c5f263833ec Dongsheng Yang    2015-11-07  1406  	if (release)
> 8c1c5f263833ec Dongsheng Yang    2015-11-07  1407  		ubifs_release_budget(c, &req);
> 8c1c5f263833ec Dongsheng Yang    2015-11-07  1408  	return 0;
> 8c1c5f263833ec Dongsheng Yang    2015-11-07  1409  }
> 8c1c5f263833ec Dongsheng Yang    2015-11-07  1410
>
> :::::: The code at line 1385 was first introduced by commit
> :::::: 8c1c5f263833ec2dc8fd716cf4281265c485d7ad ubifs: introduce UBIFS_ATIME_SUPPORT to ubifs
>
> :::::: TO: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> :::::: CC: Richard Weinberger <richard@nod.at>
>
I think the patch [1] should be modified, argument 'time' has been 
removed in 913e99287b98fd0("fs: drop the timespec64 argument from 
update_time"). Timeline shown as follow:

2023/07/12: [1] was sent out.

2023/08/11: 913e99287b98fd0 is applied into linux-next.

2023/10/29: [1] is applied into ubifs.git next.

[1] 
https://patchwork.ozlabs.org/project/linux-mtd/patch/20230712074637.129248-1-yang.lee@linux.alibaba.com/

