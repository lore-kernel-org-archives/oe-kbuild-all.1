Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C1578F2A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 11:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736163506; cv=none; b=dKWc5Hb9DTMwofXCubUq43BpsPff9LXqOUr+MUmB9qVvWEp8/NLLTS6yBzt0eH9dWfC1hkkL30LPiC9hLu5RQ9OK+b9OH3Ykc1bqnWKoYyR6LX8FaDIjMnZvWdLvY1fL24PrEn46dG/fbLUpoNQEWPGZC68CgLVuc4phR+l7P/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736163506; c=relaxed/simple;
	bh=5xssnJCg88wVBmrNfPsNH+OkyEWsP226D05U4l6Mu0s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=g7GRd6RkDoX3O7y1zVnsxTOKrGpySikjBJx4de7P8dALAjNK9AxHsqK4W47zfQihx5Ij3b73z5rBi43BU4vxsQ3xmNjp5om0uMZNFIp3P/tJIDzMSoc/OatvH8Mp/lSJHqEpWx3ivk05EZ5DleIhdjo1Zxe2ZHLwifS838My7UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sMTf5WFU; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sMTf5WFU"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-436341f575fso147547605e9.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 06 Jan 2025 03:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736163503; x=1736768303; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dUop8DfpD4p1SQmq5+Q6zmdSiDGVjAic33D6A/4tNAk=;
        b=sMTf5WFU+PeLzFsMejeXUrEZ8kEdaNKCAatVwlvNub/9TwL/VCIre2a7uQv1MHOtrF
         5XCCJb3b4cQXesZMOqgzwzjuk+/3L3SKOOsog/wLzIeK0LefbPewjttexnPIRJl1ee9K
         ROOJ5+AB/ULHtJSlgb+tc58qzPR8sh4jFvYBYX/pV8Ug8WOiL/MTf+UmpvmEOZFKYcOE
         8TYMo23fItF6aia6NIPq/JH37iVwr2eT6liVbfIdlRj4tJjpeuz9B8jae3b0+zmSuW6S
         KNI2HF7tm6Y7cmIVXqHoyL+Nn+wPotMZ/qaGkVOkDPWbpx9dNjH9gFAS4+EAyCXIVb33
         P7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736163503; x=1736768303;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dUop8DfpD4p1SQmq5+Q6zmdSiDGVjAic33D6A/4tNAk=;
        b=ghhOqbBljr1IB/dPhU+u31WWF1Xr1PWGesYrpYjhhysiBoVOcvf9R7JSlFmqColMS/
         4vbAtPI/vGSQhlvxsXWbqepX99ri1FHNKGpqgPhU6A0EpktpWpyW9LwXLlrJmO5KYrrJ
         waehQGFfCzz9tkAsswCbYNkZWaEqJ2ZxTkepaBYEjnEzM0HRDQ/c6ufYiAjulL/W64Yu
         xYjrs33gEh/kLYhQvCyNVhHKccWhIbAcboyGyLsOqurxl+Y7J8Ke5E/ZDVJobyvbX35m
         AX4Jg/r91CtQrMiuasdmqDCR/gXagWyXrWdzGJcCLO6BGRTWJk/2xQDgbaAOAK8QJsMB
         eh1w==
X-Forwarded-Encrypted: i=1; AJvYcCUGM2qhfaLdSiDpR/SVdOiOKwv1QOS4ORCanoYtYvalqEQ18c+gtgFf3qCD+IQOgHUWouAx4B2BLkPyy2VM@lists.linux.dev
X-Gm-Message-State: AOJu0YyCDQDG3N4laOKb7QFn/24pV6h1NYcLXorNQtD/MRhg8gndnlnX
	NdKmDONSflK+t4F/Xom5PbJcVd+ucAADiSLeZp7Mfj0rpzrH5VqZAkNTwRFPNqo=
X-Gm-Gg: ASbGnctRlhkVuXrn1ePObl30/m1Fpn+6+HBfw9QXdoM4I3JZs0qBUPniUGvTTGpH5FU
	qIvX0HLdmr1v0kpG+SqbkPUkUi23SCCv5YmCAb2k+FiwBgYMqU1AiD9sqLvn2TpDyKnQPebvZUf
	3CfcRo9os0XBJFyJm+ndOT1jSk5dtBtbm2I62rS0mYN782XbErXhTIPYaMsa/xzyxuiaJDVPbHq
	BQyNNgzT6oO8A3602vcHX5P8oMQN+uLoYn2Na4CcYHE7zQvLV/ELmb1oyJVsA==
X-Google-Smtp-Source: AGHT+IE3uyPTe8/NlP3SSeVzlNKmSenBA3eXhrWyLWb2rEnUtsrKKt9sXjVRLN4HNMOuwQCMcD5bzA==
X-Received: by 2002:adf:a3d3:0:b0:38a:5122:5a03 with SMTP id ffacd0b85a97d-38a51225ae4mr17959494f8f.41.1736163503265;
        Mon, 06 Jan 2025 03:38:23 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b295sm608853545e9.33.2025.01.06.03.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 03:38:22 -0800 (PST)
Date: Mon, 6 Jan 2025 14:38:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Anand Jain <anand.jain@oracle.com>,
	linux-btrfs@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, dsterba@suse.com,
	Naohiro.Aota@wdc.com, wqu@suse.com, hrx@bupt.moe,
	waxhead@dirtcellar.net
Subject: Re: [PATCH v5 05/10] btrfs: add read count tracking for filesystem
 stats
Message-ID: <f7198ea9-e6f3-4857-af35-0f119e2b88e6@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4010cee5398e35a695def3ad97d4de6f136ae2c.1735748715.git.anand.jain@oracle.com>

Hi Anand,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anand-Jain/btrfs-initialize-fs_devices-fs_info-earlier/20250102-021904
base:   v6.13-rc5
patch link:    https://lore.kernel.org/r/c4010cee5398e35a695def3ad97d4de6f136ae2c.1735748715.git.anand.jain%40oracle.com
patch subject: [PATCH v5 05/10] btrfs: add read count tracking for filesystem stats
config: i386-randconfig-r072-20250103 (https://download.01.org/0day-ci/archive/20250104/202501040304.Ju24l8yd-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202501040304.Ju24l8yd-lkp@intel.com/

New smatch warnings:
fs/btrfs/volumes.c:7691 btrfs_init_dev_stats() warn: inconsistent returns '&fs_devices->device_list_mutex'.

vim +7691 fs/btrfs/volumes.c

124604eb50f88e Josef Bacik    2020-09-18  7663  int btrfs_init_dev_stats(struct btrfs_fs_info *fs_info)
124604eb50f88e Josef Bacik    2020-09-18  7664  {
124604eb50f88e Josef Bacik    2020-09-18  7665  	struct btrfs_fs_devices *fs_devices = fs_info->fs_devices, *seed_devs;
124604eb50f88e Josef Bacik    2020-09-18  7666  	struct btrfs_device *device;
124604eb50f88e Josef Bacik    2020-09-18  7667  	struct btrfs_path *path = NULL;
92e26df43b1a97 Josef Bacik    2020-09-18  7668  	int ret = 0;
124604eb50f88e Josef Bacik    2020-09-18  7669  
124604eb50f88e Josef Bacik    2020-09-18  7670  	path = btrfs_alloc_path();
124604eb50f88e Josef Bacik    2020-09-18  7671  	if (!path)
124604eb50f88e Josef Bacik    2020-09-18  7672  		return -ENOMEM;
124604eb50f88e Josef Bacik    2020-09-18  7673  
124604eb50f88e Josef Bacik    2020-09-18  7674  	mutex_lock(&fs_devices->device_list_mutex);
92e26df43b1a97 Josef Bacik    2020-09-18  7675  	list_for_each_entry(device, &fs_devices->devices, dev_list) {
92e26df43b1a97 Josef Bacik    2020-09-18  7676  		ret = btrfs_device_init_dev_stats(device, path);
92e26df43b1a97 Josef Bacik    2020-09-18  7677  		if (ret)
ec90aa75ef29fb Anand Jain     2025-01-02  7678  			return ret;

mutex_unlock(&fs_devices->device_list_mutex);

92e26df43b1a97 Josef Bacik    2020-09-18  7679  	}
124604eb50f88e Josef Bacik    2020-09-18  7680  	list_for_each_entry(seed_devs, &fs_devices->seed_list, seed_list) {
92e26df43b1a97 Josef Bacik    2020-09-18  7681  		list_for_each_entry(device, &seed_devs->devices, dev_list) {
92e26df43b1a97 Josef Bacik    2020-09-18  7682  			ret = btrfs_device_init_dev_stats(device, path);
92e26df43b1a97 Josef Bacik    2020-09-18  7683  			if (ret)
92e26df43b1a97 Josef Bacik    2020-09-18  7684  				goto out;
124604eb50f88e Josef Bacik    2020-09-18  7685  		}
92e26df43b1a97 Josef Bacik    2020-09-18  7686  	}
92e26df43b1a97 Josef Bacik    2020-09-18  7687  out:
733f4fbbc1083a Stefan Behrens 2012-05-25  7688  	mutex_unlock(&fs_devices->device_list_mutex);
733f4fbbc1083a Stefan Behrens 2012-05-25  7689  
733f4fbbc1083a Stefan Behrens 2012-05-25  7690  	btrfs_free_path(path);
92e26df43b1a97 Josef Bacik    2020-09-18 @7691  	return ret;
733f4fbbc1083a Stefan Behrens 2012-05-25  7692  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

