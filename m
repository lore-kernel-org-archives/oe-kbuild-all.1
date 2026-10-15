Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDC750C2B4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Oct 2026 09:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057264; cv=none; b=YmLl4aHqo/29dbcq1GB7QLVfWag7pVh1PBn4yyr0tD0ouU2wvNp5A7EJdlvVV7SgL+YLQCkfFZ/2/FkvjwLnCmANkhL82bEuiPGCOoF9BdmhEADyk6GuypZNOlblRKcQXaYduTUlFmWpV2Vcl2c6YIu9GaOIGzeoDORQoKCcbhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057264; c=relaxed/simple;
	bh=qya3pHGw35ik9UP8wd/Leo+I9K3qLx1EmPc93pjqVMg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DhM9UXOM+CyVKnODpvUzf6GRlYnut7U2B4k0gB+sJxQa1HQv0A19s/4euDqWwOFYYsl6nEtBLcy08F6UgftgieW7vGdlDMa4S+HKddc25/fcympvH31BZQP/xnMrl8jyG/9loM9e3tn176vStGg8ryFeBYXCwjDdX1Oy12WUUPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PBjVe0tK; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBjVe0tK"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c5358fc28so158870f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Oct 2026 02:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792057255; x=1792662055; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KNk1SaOvuSYhDSZZfpXurMl+B7lfSorI/vOzw7u0IwY=;
        b=PBjVe0tKVMTW7DRm0kIO3bBl37STavTSuDQCZfC9o344dhdAxXv4Exyvr44VGgFPd5
         ySJq4BKPeCEvEoHan0R3x5hQEEjww8DkAuMwOIOjELKoh9Nkx6UoWkz78Zkm3NVeXWb6
         rFhZuuK29aSpWrH70dsE7GcZsKZY3NHPy/ltweGBtbzV5M0uxovNbttSUQahdpeBWToU
         6obdnM2XoPHgLmrCQjd+AYvI8nWXXb6qpuMewSWI7X/CWneO4xE8vKFmlyAEIUHhnMXs
         O5fzcuyKIsZHTEgP0HW8mQtWfwJpboDQKdQE4OWIR1w1/ZN5PX2ogxGLyxrpLYybyl1l
         0IXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057255; x=1792662055;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KNk1SaOvuSYhDSZZfpXurMl+B7lfSorI/vOzw7u0IwY=;
        b=tDAsoEcsfmydLbs7/8a2ee3sSDUaZF8pbbasYtaF02Gfu4ciTCNxSaBtJkd5Yriv+3
         KTl9K5/Q/KcBkcFBXsMW/ZX7kKEPRP/yl95cVsx0RZNpuAfxfKfRMb99qOdxcnCMokl+
         vFvBrxrtO0STvTJGKgz9YGDlXy8G3klz6Rj6z51KHWvkTvkqpv58KllpFZdEzScKZW1d
         TGw8eySi2BABWreN31iWYkURqFFSg+K68K+qLjYaqJCaB4P6IeTzlSCsvW3Y1EgdMyIA
         DefgvJEcFd7V9iD6R8QFnjrmGMFwQ/b3EqyQ1w17D2tHnF6nx8Eu8LfLcvMUaRC3QKPF
         AVhg==
X-Forwarded-Encrypted: i=1; AKwUvBzu8UB5unlseutO8guUuYBTkIM4th9GnEO3YNMnoNthWiuU2X7IuaO/mWoSYwWyXHXeerUMo7MD1vfTA+UJ@lists.linux.dev
X-Gm-Message-State: AFq9FYLTZj2JW5r3PQKftvUMqVClqV93luJ13nkVTv7t0gkh5BHPGmgk
	JspvD70PwRISXhwGdmyLJ58jtyiSj2+Erknh7tX4A7ICyqP+M+xet5vb
X-Gm-Gg: AYBFou22fKUYanMskOvpTk+eO5sinMcgfnTh3NumoH6CVa6W+piMuQ2D18dr/fX7kuj
	bdqhYCO/hLeurRL9Wl3Z7WLXDMw1nSc1WZ3FHmB6qY7S1R4MtU/pby0glUNHb1zL7WvwGiYf1O7
	+Ear7zs4llY3WPKZdIJR8otKylX0Ihu4PX7BgosnJyUOTIzyh1zUSIwnwLqqHLqfREflNkym++n
	3vlrHn7LRmb4/b0Y/VU/Hq0ttVan/wmkFdsmQJzq0u7Tj4/6SJkBj0CituZh06QFlpRBq47KMNX
	jhziHZN4/t8frgiy+K2Rvdye3N1rh1n2H2r9WvG2YvxkNB/x3JNr94u2ssatB8SmltDiV2mfEPm
	hN+WQPsSyarPsz7TQUlOZ1lPGd9y78wzcZQCUvobQQEjlxKsuJN+Ph1Tj7sXQeZJ2UPnLv5/tnU
	ANtg+OMRQbfcguecbaSq7uJxhjzJYw1yrILRIuADxY6MwVFRLPnKfXok+TT2PSKPNvFzY=
X-Received: by 2002:a5d:6402:0:b0:48c:7f18:c85e with SMTP id ffacd0b85a97d-48dbace9c60mr26369312f8f.45.1792057254369;
        Thu, 15 Oct 2026 02:40:54 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac5265sm18513411f8f.41.2026.10.15.02.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:40:53 -0700 (PDT)
Date: Thu, 15 Oct 2026 12:40:49 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Johannes Berg <johannes.berg@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath-next 6/34] net/wireless/nl80211.c:20114 nl80211_pre_doit()
 error: 'wdev' dereferencing possible ERR_PTR()
Message-ID: <202610140243.w1Zrwq4k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
head:   cd026e68fdbf88b9cc522b76c7a9d92c9a41f709
commit: 13c20e8be3278e54f4758941998a3ee746644d8d [6/34] wifi: nl80211: prepare for unlocked wdev-only ops
config: sparc-randconfig-r2200-20261013 (https://download.01.org/0day-ci/archive/20261014/202610140243.w1Zrwq4k-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610140243.w1Zrwq4k-lkp@intel.com/

New smatch warnings:
net/wireless/nl80211.c:20114 nl80211_pre_doit() error: 'wdev' dereferencing possible ERR_PTR()

vim +/wdev +20114 net/wireless/nl80211.c

20b0b53aca436a Jakub Kicinski       2022-11-04  19962  static int nl80211_pre_doit(const struct genl_split_ops *ops,
20b0b53aca436a Jakub Kicinski       2022-11-04  19963  			    struct sk_buff *skb,
4c476991062a0a Johannes Berg        2010-10-04  19964  			    struct genl_info *info)
4c476991062a0a Johannes Berg        2010-10-04  19965  {
a05829a7222e9d Johannes Berg        2021-01-22  19966  	struct cfg80211_registered_device *rdev = NULL;
8e3d9039d280c6 Johannes Berg        2026-10-06  19967  	struct net *netns = genl_info_net(info);
7b0a0e3c3a8826 Johannes Berg        2022-04-14  19968  	struct wireless_dev *wdev = NULL;
7b0a0e3c3a8826 Johannes Berg        2022-04-14  19969  	struct net_device *dev = NULL;
13c20e8be3278e Johannes Berg        2026-10-09  19970  	bool need_rtnl, wdev_ref, locked = false;
8e3d9039d280c6 Johannes Berg        2026-10-06  19971  	u32 internal_flags, wdev_id = 0;
7b0a0e3c3a8826 Johannes Berg        2022-04-14  19972  	int err;
2182db91e0016c Johannes Berg        2022-04-14  19973  
2182db91e0016c Johannes Berg        2022-04-14  19974  	if (WARN_ON(ops->internal_flags >= ARRAY_SIZE(nl80211_internal_flags)))
2182db91e0016c Johannes Berg        2022-04-14  19975  		return -EINVAL;
2182db91e0016c Johannes Berg        2022-04-14  19976  
2182db91e0016c Johannes Berg        2022-04-14  19977  	internal_flags = nl80211_internal_flags[ops->internal_flags];
8e3d9039d280c6 Johannes Berg        2026-10-06  19978  	need_rtnl = internal_flags & NL80211_FLAG_NEED_RTNL;
13c20e8be3278e Johannes Berg        2026-10-09  19979  	wdev_ref = nl80211_need_wdev_ref(internal_flags);
4c476991062a0a Johannes Berg        2010-10-04  19980  
8e3d9039d280c6 Johannes Berg        2026-10-06  19981  	if (need_rtnl)
4c476991062a0a Johannes Berg        2010-10-04  19982  		rtnl_lock();
8e3d9039d280c6 Johannes Berg        2026-10-06  19983  	else
8e3d9039d280c6 Johannes Berg        2026-10-06  19984  		rcu_read_lock();
8e3d9039d280c6 Johannes Berg        2026-10-06  19985  
2182db91e0016c Johannes Berg        2022-04-14  19986  	if (internal_flags & NL80211_FLAG_NEED_WIPHY) {
8e3d9039d280c6 Johannes Berg        2026-10-06  19987  		rdev = cfg80211_get_dev_from_info(netns, info);
4c476991062a0a Johannes Berg        2010-10-04  19988  		if (IS_ERR(rdev)) {
7b0a0e3c3a8826 Johannes Berg        2022-04-14  19989  			err = PTR_ERR(rdev);
8e3d9039d280c6 Johannes Berg        2026-10-06  19990  			goto out_lookup;
4c476991062a0a Johannes Berg        2010-10-04  19991  		}
2182db91e0016c Johannes Berg        2022-04-14  19992  	} else if (internal_flags & NL80211_FLAG_NEED_NETDEV ||
2182db91e0016c Johannes Berg        2022-04-14  19993  		   internal_flags & NL80211_FLAG_NEED_WDEV) {
8e3d9039d280c6 Johannes Berg        2026-10-06  19994  		wdev = __cfg80211_wdev_from_attrs(NULL, netns, info->attrs);
89a54e48b9cbb4 Johannes Berg        2012-06-15  19995  		if (IS_ERR(wdev)) {
7b0a0e3c3a8826 Johannes Berg        2022-04-14  19996  			err = PTR_ERR(wdev);
8e3d9039d280c6 Johannes Berg        2026-10-06  19997  			goto out_lookup;
4c476991062a0a Johannes Berg        2010-10-04  19998  		}
89a54e48b9cbb4 Johannes Berg        2012-06-15  19999  
1bf614ef794643 Johannes Berg        2012-06-15  20000  		dev = wdev->netdev;
13c20e8be3278e Johannes Berg        2026-10-09  20001  		/*
13c20e8be3278e Johannes Berg        2026-10-09  20002  		 * Take the wdev ref only if we need it (wdev_ref is true when
13c20e8be3278e Johannes Berg        2026-10-09  20003  		 * the op is unlocked), we must not try to acquire this with
13c20e8be3278e Johannes Berg        2026-10-09  20004  		 * a wdev pointer protected by locking, it'd deadlock against
13c20e8be3278e Johannes Berg        2026-10-09  20005  		 * unregistration.
13c20e8be3278e Johannes Berg        2026-10-09  20006  		 */
13c20e8be3278e Johannes Berg        2026-10-09  20007  		if (wdev_ref)
13c20e8be3278e Johannes Berg        2026-10-09  20008  			wdev_hold(wdev);
13c20e8be3278e Johannes Berg        2026-10-09  20009  		else
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20010  			dev_hold(dev);
f26cbf401be935 Zhao, Gang           2014-04-21  20011  		rdev = wiphy_to_rdev(wdev->wiphy);
8e3d9039d280c6 Johannes Berg        2026-10-06  20012  	}
8e3d9039d280c6 Johannes Berg        2026-10-06  20013  
8e3d9039d280c6 Johannes Berg        2026-10-06  20014  	if (!need_rtnl) {
8e3d9039d280c6 Johannes Berg        2026-10-06  20015  		if (rdev)
8e3d9039d280c6 Johannes Berg        2026-10-06  20016  			get_device(&rdev->wiphy.dev);
8e3d9039d280c6 Johannes Berg        2026-10-06  20017  		if (wdev)
8e3d9039d280c6 Johannes Berg        2026-10-06  20018  			wdev_id = wdev->identifier;
8e3d9039d280c6 Johannes Berg        2026-10-06  20019  		rcu_read_unlock();
8e3d9039d280c6 Johannes Berg        2026-10-06  20020  
8e3d9039d280c6 Johannes Berg        2026-10-06  20021  		/* RTM_NEWLINK is sent before NETDEV_UP, wait for dev_open() */
8e3d9039d280c6 Johannes Berg        2026-10-06  20022  		if (internal_flags & NL80211_FLAG_CHECK_NETDEV_UP && dev &&
8e3d9039d280c6 Johannes Berg        2026-10-06  20023  		    !READ_ONCE(wdev->is_running) && netif_running(dev)) {
8e3d9039d280c6 Johannes Berg        2026-10-06  20024  			rtnl_lock();
8e3d9039d280c6 Johannes Berg        2026-10-06  20025  			rtnl_unlock();
8e3d9039d280c6 Johannes Berg        2026-10-06  20026  		}
8e3d9039d280c6 Johannes Berg        2026-10-06  20027  	}
1bf614ef794643 Johannes Berg        2012-06-15  20028  
8e3d9039d280c6 Johannes Berg        2026-10-06  20029  	if (rdev && !(internal_flags & NL80211_FLAG_NO_WIPHY_MTX)) {
8e3d9039d280c6 Johannes Berg        2026-10-06  20030  		if (need_rtnl) {
8e3d9039d280c6 Johannes Berg        2026-10-06  20031  			wiphy_lock(&rdev->wiphy);
8e3d9039d280c6 Johannes Berg        2026-10-06  20032  		} else {
8e3d9039d280c6 Johannes Berg        2026-10-06  20033  			/* without rtnl, things may have changed since lookup */
8e3d9039d280c6 Johannes Berg        2026-10-06  20034  			wdev = nl80211_lock_and_recheck(rdev, netns, wdev_id);
8e3d9039d280c6 Johannes Berg        2026-10-06  20035  			if (IS_ERR(wdev)) {
8e3d9039d280c6 Johannes Berg        2026-10-06  20036  				err = PTR_ERR(wdev);
8e3d9039d280c6 Johannes Berg        2026-10-06  20037  				goto out;

Smatch is worried about this goto.

8e3d9039d280c6 Johannes Berg        2026-10-06  20038  			}
8e3d9039d280c6 Johannes Berg        2026-10-06  20039  		}
8e3d9039d280c6 Johannes Berg        2026-10-06  20040  		locked = true;
8e3d9039d280c6 Johannes Berg        2026-10-06  20041  	} else if (rdev && !need_rtnl) {
8e3d9039d280c6 Johannes Berg        2026-10-06  20042  		/*
13c20e8be3278e Johannes Berg        2026-10-09  20043  		 * Without any mutex need a wdev reference to keep it alive,
13c20e8be3278e Johannes Berg        2026-10-09  20044  		 * see also the note about selectors - the WARN can't happen
8e3d9039d280c6 Johannes Berg        2026-10-06  20045  		 * without wrong selectors and those don't exist.
8e3d9039d280c6 Johannes Berg        2026-10-06  20046  		 */
8e3d9039d280c6 Johannes Berg        2026-10-06  20047  		put_device(&rdev->wiphy.dev);
13c20e8be3278e Johannes Berg        2026-10-09  20048  		if (WARN_ON(!wdev)) {
8e3d9039d280c6 Johannes Berg        2026-10-06  20049  			err = -EINVAL;
8e3d9039d280c6 Johannes Berg        2026-10-06  20050  			goto out;
8e3d9039d280c6 Johannes Berg        2026-10-06  20051  		}
8e3d9039d280c6 Johannes Berg        2026-10-06  20052  	}
8e3d9039d280c6 Johannes Berg        2026-10-06  20053  
8e3d9039d280c6 Johannes Berg        2026-10-06  20054  	if (wdev) {
2182db91e0016c Johannes Berg        2022-04-14  20055  		if (internal_flags & NL80211_FLAG_NEED_NETDEV) {
1bf614ef794643 Johannes Berg        2012-06-15  20056  			if (!dev) {
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20057  				err = -EINVAL;
8e3d9039d280c6 Johannes Berg        2026-10-06  20058  				goto out;
89a54e48b9cbb4 Johannes Berg        2012-06-15  20059  			}
89a54e48b9cbb4 Johannes Berg        2012-06-15  20060  
1bf614ef794643 Johannes Berg        2012-06-15  20061  			info->user_ptr[1] = dev;
1bf614ef794643 Johannes Berg        2012-06-15  20062  		} else {
1bf614ef794643 Johannes Berg        2012-06-15  20063  			info->user_ptr[1] = wdev;
4c476991062a0a Johannes Berg        2010-10-04  20064  		}
89a54e48b9cbb4 Johannes Berg        2012-06-15  20065  
2182db91e0016c Johannes Berg        2022-04-14  20066  		if (internal_flags & NL80211_FLAG_CHECK_NETDEV_UP &&
73c7da3dae1e7c Arend Van Spriel     2016-10-20  20067  		    !wdev_running(wdev)) {
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20068  			err = -ENETDOWN;
8e3d9039d280c6 Johannes Berg        2026-10-06  20069  			goto out;
41265714810e20 Johannes Berg        2010-10-04  20070  		}
4c476991062a0a Johannes Berg        2010-10-04  20071  	}
4c476991062a0a Johannes Berg        2010-10-04  20072  
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20073  	if (internal_flags & NL80211_FLAG_MLO_VALID_LINK_ID) {
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20074  		struct nlattr *link_id = info->attrs[NL80211_ATTR_MLO_LINK_ID];
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20075  
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20076  		if (!wdev) {
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20077  			err = -EINVAL;
8e3d9039d280c6 Johannes Berg        2026-10-06  20078  			goto out;
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20079  		}
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20080  
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20081  		/* MLO -> require valid link ID */
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20082  		if (wdev->valid_links &&
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20083  		    (!link_id ||
ff3821bc355275 Veerendranath Jakkam 2022-07-11  20084  		     !(wdev->valid_links & BIT(nla_get_u8(link_id))))) {
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20085  			err = -EINVAL;
8e3d9039d280c6 Johannes Berg        2026-10-06  20086  			goto out;
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20087  		}
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20088  
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20089  		/* non-MLO -> no link ID attribute accepted */
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20090  		if (!wdev->valid_links && link_id) {
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20091  			err = -EINVAL;
8e3d9039d280c6 Johannes Berg        2026-10-06  20092  			goto out;
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20093  		}
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20094  	}
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20095  
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20096  	if (internal_flags & NL80211_FLAG_MLO_UNSUPPORTED) {
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20097  		if (info->attrs[NL80211_ATTR_MLO_LINK_ID] ||
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20098  		    (wdev && wdev->valid_links)) {
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20099  			err = -EINVAL;
8e3d9039d280c6 Johannes Berg        2026-10-06  20100  			goto out;
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20101  		}
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20102  	}
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20103  
8e3d9039d280c6 Johannes Berg        2026-10-06  20104  	info->user_ptr[0] = rdev;
a05829a7222e9d Johannes Berg        2021-01-22  20105  	/* we keep the mutex locked until post_doit */
8e3d9039d280c6 Johannes Berg        2026-10-06  20106  	if (locked)
a05829a7222e9d Johannes Berg        2021-01-22  20107  		__release(&rdev->wiphy.mtx);
a05829a7222e9d Johannes Berg        2021-01-22  20108  
4c476991062a0a Johannes Berg        2010-10-04  20109  	return 0;
8e3d9039d280c6 Johannes Berg        2026-10-06  20110  out:
8e3d9039d280c6 Johannes Berg        2026-10-06  20111  	if (locked)
8e3d9039d280c6 Johannes Berg        2026-10-06  20112  		wiphy_unlock(&rdev->wiphy);
13c20e8be3278e Johannes Berg        2026-10-09  20113  	if (wdev_ref && wdev)
13c20e8be3278e Johannes Berg        2026-10-09 @20114  		wdev_put(wdev);
                                                                         ^^^^

13c20e8be3278e Johannes Berg        2026-10-09  20115  	else
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20116  		dev_put(dev);
8e3d9039d280c6 Johannes Berg        2026-10-06  20117  	if (need_rtnl)
8e3d9039d280c6 Johannes Berg        2026-10-06  20118  		rtnl_unlock();
8e3d9039d280c6 Johannes Berg        2026-10-06  20119  	return err;
8e3d9039d280c6 Johannes Berg        2026-10-06  20120  out_lookup:
8e3d9039d280c6 Johannes Berg        2026-10-06  20121  	if (need_rtnl)
8e3d9039d280c6 Johannes Berg        2026-10-06  20122  		rtnl_unlock();
8e3d9039d280c6 Johannes Berg        2026-10-06  20123  	else
8e3d9039d280c6 Johannes Berg        2026-10-06  20124  		rcu_read_unlock();
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20125  	return err;
4c476991062a0a Johannes Berg        2010-10-04  20126  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

