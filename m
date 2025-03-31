Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82E91D516F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Mar 2025 09:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743414242; cv=none; b=ke2d5zUzNMmlfQeSQyYM11uKZU/Ttbn1T0JaCKuweqEohyQhqkt/nAhmpqe8vUvrseWmKY3lzd6crAY5p70zsIzk+J5hYPH0t/SU3eWt+jwpOCIcA6SahlmOzCXZypbsK8Q3xjJ1ueTzpH6iprixsITBeAYsq+2hLGu0hQZt6fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743414242; c=relaxed/simple;
	bh=uUjD/JplIhUXWecod63ucSrmW7jQiOn8s98ndmFloPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FN2tf10HR4kpKRWeAQgP6n7Xe1rtV8mBMIV5EhDbMz8VK0ny2Q4YVEUEJMjPjHVXrw9i5ON3xfrIjaIMRg3CYut0MgSi+m4eL8+WpYso5bUGEcf/IumBSOfpaW95Fgho7n3LHpt9JJ2wE3p1RY7LR4Gm6qdUFSDi2ZtnPj9vOPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TWKsCN4j; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TWKsCN4j"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3913d129c1aso3113461f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Mar 2025 02:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743414238; x=1744019038; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/GLv/TlK6NwyIX5eMw+b9bXsE/bqtOYXg8Tuj7RGPR8=;
        b=TWKsCN4j/ElBWAkjJKGXWnOb05J9tuLmSF9a0hqO6U53aFikIWYMxGaK11cEqTsihP
         5JPLghkpXcdbzwo9tD7uRwb3diwo1FCQIQGyTOhtIFsFjO9m046QFdVQ89VqDjuQA2sa
         GDDxRAl9QdMrxJvlYQ++Q93xCWInh5nNJ2mUHfOjbNRt1fri3jB8wQfdu61LLVqqfEwa
         ZBy7IlX3Cxd8DtBIgH5nnhgC+++v/USI22/QXZFO/4lxYEdUxgfRQe/NtCq8Wrxouu4Z
         uqHOIrp9QGH+WNQaYOyOcuP9kNm8jPlWNzRDtO/D+s2vKtqgE3OmHLr/6EzOWF22jsrF
         lmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743414238; x=1744019038;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/GLv/TlK6NwyIX5eMw+b9bXsE/bqtOYXg8Tuj7RGPR8=;
        b=c/XWc8qmpyQrKYjpdeYWSoZTqWcm5A+MFS5xtojgHrzsTxZUvEbkK3y3u1k74EI/rM
         m36S1tXuALnT33fHfsckny4+sNXLuLTl7DtAjT4zcVLKoC6BYlYvGj7SiWTg132etBLY
         vA/NOtm89j1RSpv+BkuGu2ds8rcDDgWBqWAC8oEGHYqWuKio5X5f6Yg63NJpIfxKj5dt
         fGD/7rTvsheSnId1OFuF8qjNHI2afh4kg2txE2iFVcVk6DQCv+faChJJDSzJ8E/aIGN3
         QBXeTM6mOSorAnxEpsMfFZ8ylEsxHvhwGUfxnhKfz/fL4cQHW7FHd+DMZNlYFSJRL8yz
         /J3g==
X-Forwarded-Encrypted: i=1; AJvYcCW1uzL3eTaarRem6fEj+ZSAiKcWV83UiaDl3f+pkKpnpNEFwzQNoAdM9LdeVFvmtnNm+V7+QtEgJknRI/X7@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+hU4fD6FhGoiJJUWPjkEzlWGrL3g2jQIlxacJUioYDC38ClFX
	N7chI+o8Xnddq73lr1onzbP9mVn08A2ymohMz8ZnLs0gi5M3ZO4PzoIXDCRFMqU=
X-Gm-Gg: ASbGncsNi8UGoeGxWQyypndDvCY0GOyB+zvgNW0bb9LZ6fgH0tYFz9Ibo7YMqn6UfsL
	VpGAfLWI8JMo5a9q0/cyg4547hAYU276N+rdC9hzuOX/PbQask05LIK6rAxn1cRXIHb2tLYEmoT
	yb+TDcEZtq1/cRqt45farv3iX0fEqNyIRkYYiBmVjQkZjJX8llV2AogMP8wivX8DqrdAWydbLcj
	45eJ58U9MlMoGUae+ImvnrNR9dMCjlXo7C4tqiq2eKSH9y2Y8dU62cys6ucLjVh7VofQhPgM/wO
	NlZycHC3WeC/R/r3NX0Cz2ezM0czGfPYaw3iTsh+Vfmc2qdt5w==
X-Google-Smtp-Source: AGHT+IGs/AIKyAlURq/RRfCeu90iBXK3gpoSTRjgemLZoshu9Cg+ZXrGip1/5AfFeNfBa9hppYpv6A==
X-Received: by 2002:a05:6000:2a8:b0:391:3156:6be with SMTP id ffacd0b85a97d-39c11b7dae8mr6990133f8f.7.1743414237995;
        Mon, 31 Mar 2025 02:43:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c0b79e0afsm10922362f8f.65.2025.03.31.02.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 02:43:57 -0700 (PDT)
Date: Mon, 31 Mar 2025 12:43:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Gabriele Monaco <gmonaco@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: kernel/trace/rv/rv.c:838 rv_register_monitor() warn: inconsistent
 returns 'global &rv_interface_lock'.
Message-ID: <bc1fe7c1-a042-42b2-8d40-7621ef0087b9@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7f2ff7b6261742ed52aa973ccdf99151b7cc3a50
commit: cb85c660fcd4b3a03ed993affa0b2d1a8af2f06b rv: Add option for nested monitors and include sched
config: parisc-randconfig-r073-20250331 (https://download.01.org/0day-ci/archive/20250331/202503310539.7BDDOPxq-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503310539.7BDDOPxq-lkp@intel.com/

smatch warnings:
kernel/trace/rv/rv.c:838 rv_register_monitor() warn: inconsistent returns 'global &rv_interface_lock'.

vim +838 kernel/trace/rv/rv.c

cb85c660fcd4b3a Gabriele Monaco            2025-03-05  779  int rv_register_monitor(struct rv_monitor *monitor, struct rv_monitor *parent)
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  780  {
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  781  	struct rv_monitor_def *r, *p = NULL;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  782  	int retval = 0;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  783  
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  784  	if (strlen(monitor->name) >= MAX_RV_MONITOR_NAME_SIZE) {
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  785  		pr_info("Monitor %s has a name longer than %d\n", monitor->name,
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  786  			MAX_RV_MONITOR_NAME_SIZE);
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  787  		return -EINVAL;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  788  	}
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  789  
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  790  	mutex_lock(&rv_interface_lock);
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  791  
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  792  	list_for_each_entry(r, &rv_monitors_list, list) {
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  793  		if (strcmp(monitor->name, r->monitor->name) == 0) {
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  794  			pr_info("Monitor %s is already registered\n", monitor->name);
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  795  			retval = -EEXIST;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  796  			goto out_unlock;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  797  		}
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  798  	}
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  799  
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  800  	if (parent) {
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  801  		list_for_each_entry(r, &rv_monitors_list, list) {
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  802  			if (strcmp(parent->name, r->monitor->name) == 0) {
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  803  				p = r;
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  804  				break;
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  805  			}
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  806  		}
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  807  	}
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  808  
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  809  	if (p && rv_is_nested_monitor(p)) {
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  810  		pr_info("Parent monitor %s is already nested, cannot nest further\n",
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  811  			parent->name);
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  812  		return -EINVAL;

mutex_unlock(&rv_interface_lock);

cb85c660fcd4b3a Gabriele Monaco            2025-03-05  813  	}
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  814  
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  815  	r = kzalloc(sizeof(struct rv_monitor_def), GFP_KERNEL);
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  816  	if (!r) {
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  817  		retval = -ENOMEM;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  818  		goto out_unlock;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  819  	}
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  820  
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  821  	r->monitor = monitor;
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  822  	r->parent = parent;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  823  
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  824  	retval = create_monitor_dir(r, p);
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  825  	if (retval) {
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  826  		kfree(r);
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  827  		goto out_unlock;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  828  	}
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  829  
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  830  	/* keep children close to the parent for easier visualisation */
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  831  	if (p)
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  832  		list_add(&r->list, &p->list);
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  833  	else
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  834  		list_add_tail(&r->list, &rv_monitors_list);
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  835  
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  836  out_unlock:
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  837  	mutex_unlock(&rv_interface_lock);
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29 @838  	return retval;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  839  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

