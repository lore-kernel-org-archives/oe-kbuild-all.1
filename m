Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104DE1E51D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 02:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729562794; cv=none; b=CFW34O4BMRFcuNb72I2NmpjX7vQTaSmio2AtaB9xh/PmKaQBA9565F+fJIirPQOhnjg9vPPl/Td6ZFoTA5eXOv6Rbr7UG1vk0u4wcPqKh85jFqw1hfuv2wqBCPwXn4FNvZGLih0hifwLqpUnu6fusxfbQZZGoR7i1j7jXNeJnsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729562794; c=relaxed/simple;
	bh=PNIltwnlCrNlvx/cqCtQf8MS/w9dn8TLt4AhGxXbJYY=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cMwT+2ColwbMYS2eP6eygB2v26gYuQcNmKu5RPhOitreyY1MVBWNw+fDqqJWRq1tCoDHAfXQGYQ7q8jI1mFoP8FEkgz78zW4HNnmdyAROR9lZ0SiqqbXmKIH4O1bL74jz95XN2QntlcZnZ4yKRWX7YWv21CORdoneAzjUfjlYFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F1ItRPl3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F1ItRPl3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C190CC4CEC3;
	Tue, 22 Oct 2024 02:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729562793;
	bh=PNIltwnlCrNlvx/cqCtQf8MS/w9dn8TLt4AhGxXbJYY=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=F1ItRPl3ez0J24oFE11BCD24do3du9vJ23Ilia1451tpS7gnl28gdjIHuaB8Xjuz1
	 3HBnJy9AVvAHGtm2+cSu3M6jlvsnrMOXBcQ/Bqp1b0yaUPKKimi5v4RV+CDK6WHWqm
	 UONJstIrtRvO4pJHau+042VAIYTtC8bbguOq6mZLiV7QElrT/uJB4tQ7Ra42nJ7pa5
	 Qov5AS/qbXGX0kfxcyHXPlKibMAyWVXms1CEBG1WyWY+fcL9HQR07ai6Sly+6qP65R
	 ZBE/kdfUb5QB9DPUX1wflS665K6xzsOEzbnGsJI0aUOnMR+2FfsxBICJiCGIYuM70E
	 R2z+CeQ67DpAQ==
Message-ID: <b44fe738-bc30-4828-8ea8-5fa19e5c7d18@kernel.org>
Date: Tue, 22 Oct 2024 10:06:30 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Chao Yu <chao@kernel.org>, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7] f2fs: zone: don't block IO if there is remained open
 zone
To: kernel test robot <lkp@intel.com>
References: <20241017081421.2213743-1-chao@kernel.org>
 <202410181756.J4ldjRr4-lkp@intel.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <202410181756.J4ldjRr4-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Thanks for the report, I rebased this patch on top of
https://lore.kernel.org/linux-f2fs-devel/20241017012932.1570038-1-chao@kernel.org,
so there will be dependency in between these two patch.

Thanks,

On 2024/10/18 17:55, kernel test robot wrote:
> Hi Chao,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on jaegeuk-f2fs/dev-test]
> [also build test WARNING on jaegeuk-f2fs/dev linus/master v6.12-rc3 next-20241018]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Chao-Yu/f2fs-zone-don-t-block-IO-if-there-is-remained-open-zone/20241017-162658
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
> patch link:    https://lore.kernel.org/r/20241017081421.2213743-1-chao%40kernel.org
> patch subject: [PATCH v7] f2fs: zone: don't block IO if there is remained open zone
> config: x86_64-buildonly-randconfig-004-20241018 (https://download.01.org/0day-ci/archive/20241018/202410181756.J4ldjRr4-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410181756.J4ldjRr4-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410181756.J4ldjRr4-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>     fs/f2fs/data.c: In function 'f2fs_blkzoned_submit_merged_write':
>>> fs/f2fs/data.c:666:69: warning: passing argument 1 of 'f2fs_get_segment_temp' makes integer from pointer without a cast [-Wint-conversion]
>       666 |         io = sbi->write_io[PAGE_TYPE(type)] + f2fs_get_segment_temp(sbi, type);
>           |                                                                     ^~~
>           |                                                                     |
>           |                                                                     struct f2fs_sb_info *
>     In file included from fs/f2fs/data.c:24:
>     fs/f2fs/f2fs.h:3762:31: note: expected 'int' but argument is of type 'struct f2fs_sb_info *'
>      3762 | int f2fs_get_segment_temp(int seg_type);
>           |                           ~~~~^~~~~~~~
>     fs/f2fs/data.c:666:47: error: too many arguments to function 'f2fs_get_segment_temp'
>       666 |         io = sbi->write_io[PAGE_TYPE(type)] + f2fs_get_segment_temp(sbi, type);
>           |                                               ^~~~~~~~~~~~~~~~~~~~~
>     fs/f2fs/f2fs.h:3762:5: note: declared here
>      3762 | int f2fs_get_segment_temp(int seg_type);
>           |     ^~~~~~~~~~~~~~~~~~~~~
> --
>     fs/f2fs/segment.c: In function 'restore_curseg_summaries':
>>> fs/f2fs/segment.c:4324:54: warning: passing argument 1 of 'f2fs_get_segment_temp' makes integer from pointer without a cast [-Wint-conversion]
>      4324 |                         temp = f2fs_get_segment_temp(sbi, type);
>           |                                                      ^~~
>           |                                                      |
>           |                                                      struct f2fs_sb_info *
>     fs/f2fs/segment.c:3610:31: note: expected 'int' but argument is of type 'struct f2fs_sb_info *'
>      3610 | int f2fs_get_segment_temp(int seg_type)
>           |                           ~~~~^~~~~~~~
>     fs/f2fs/segment.c:4324:32: error: too many arguments to function 'f2fs_get_segment_temp'
>      4324 |                         temp = f2fs_get_segment_temp(sbi, type);
>           |                                ^~~~~~~~~~~~~~~~~~~~~
>     fs/f2fs/segment.c:3610:5: note: declared here
>      3610 | int f2fs_get_segment_temp(int seg_type)
>           |     ^~~~~~~~~~~~~~~~~~~~~
>     fs/f2fs/segment.c: In function 'destroy_curseg':
>     fs/f2fs/segment.c:5666:69: warning: passing argument 1 of 'f2fs_get_segment_temp' makes integer from pointer without a cast [-Wint-conversion]
>      5666 |                         enum temp_type temp = f2fs_get_segment_temp(sbi, i);
>           |                                                                     ^~~
>           |                                                                     |
>           |                                                                     struct f2fs_sb_info *
>     fs/f2fs/segment.c:3610:31: note: expected 'int' but argument is of type 'struct f2fs_sb_info *'
>      3610 | int f2fs_get_segment_temp(int seg_type)
>           |                           ~~~~^~~~~~~~
>     fs/f2fs/segment.c:5666:47: error: too many arguments to function 'f2fs_get_segment_temp'
>      5666 |                         enum temp_type temp = f2fs_get_segment_temp(sbi, i);
>           |                                               ^~~~~~~~~~~~~~~~~~~~~
>     fs/f2fs/segment.c:3610:5: note: declared here
>      3610 | int f2fs_get_segment_temp(int seg_type)
>           |     ^~~~~~~~~~~~~~~~~~~~~
> 
> 
> vim +/f2fs_get_segment_temp +666 fs/f2fs/data.c
> 
>     657	
>     658	void f2fs_blkzoned_submit_merged_write(struct f2fs_sb_info *sbi, int type)
>     659	{
>     660	#ifdef CONFIG_BLK_DEV_ZONED
>     661		struct f2fs_bio_info *io;
>     662	
>     663		if (!f2fs_sb_has_blkzoned(sbi))
>     664			return;
>     665	
>   > 666		io = sbi->write_io[PAGE_TYPE(type)] + f2fs_get_segment_temp(sbi, type);
>     667	
>     668		f2fs_down_write(&io->io_rwsem);
>     669		if (io->zone_opened) {
>     670			if (io->bio) {
>     671				io->close_zone = true;
>     672				__submit_merged_bio(io);
>     673			} else {
>     674				up(&sbi->available_open_zones);
>     675				io->zone_opened = false;
>     676			}
>     677		}
>     678		f2fs_up_write(&io->io_rwsem);
>     679	#endif
>     680	
> 

