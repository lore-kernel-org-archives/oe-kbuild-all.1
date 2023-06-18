Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C601102
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jun 2023 06:15:47 +0000 (UTC)
Received: from mail02.huawei.com (unknown [172.30.67.153])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4QkMfF0dyDz4f3rYv
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jun 2023 13:59:01 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
	by APP4 (Coremail) with SMTP id gCh0CgCXaK8lnY5kd+bcLw--.30297S3;
	Sun, 18 Jun 2023 13:59:02 +0800 (CST)
Subject: Re: [PATCH -next] block: fix wrong mode for blkdev_get_by_dev() from
 disk_scan_partitions()
To: kernel test robot <lkp@intel.com>, Yu Kuai <yukuai1@huaweicloud.com>,
 hch@lst.de, axboe@kernel.dk, brauner@kernel.org, hare@suse.de,
 dsterba@suse.com, jinpu.wang@ionos.com
Cc: oe-kbuild-all@lists.linux.dev, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com,
 "yukuai (C)" <yukuai3@huawei.com>
References: <20230617103813.3708374-1-yukuai1@huaweicloud.com>
 <202306172040.1dllc8rx-lkp@intel.com>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <1df1d531-cd16-5db5-6f36-744896aa945e@huaweicloud.com>
Date: Sun, 18 Jun 2023 13:59:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202306172040.1dllc8rx-lkp@intel.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgCXaK8lnY5kd+bcLw--.30297S3
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYg7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2js
	IEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE
	5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeV
	CFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxG
	xcIEc7CjxVA2Y2ka0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
	x2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected

Hi,

ÔÚ 2023/06/17 20:25, kernel test robot Ð´µÀ:
> 
>     block/genhd.c: In function 'disk_scan_partitions':
>>> block/genhd.c:369:59: error: 'FMODE_EXCL' undeclared (first use in this function); did you mean 'FMODE_EXEC'?
>       369 |         bdev = blkdev_get_by_dev(disk_devt(disk), mode & ~FMODE_EXCL, NULL,
>           |                                                           ^~~~~~~~~~
>           |                                                           FMODE_EXEC

Sorry about this typo, I'll send a new version.

Thanks,
Kuai

