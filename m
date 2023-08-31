Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182409470
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 15:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693495739; x=1725031739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pS6V+rWF3cJ9vPX2U2vEj+bLsdtOAbg1EtjUBOcbsLs=;
  b=b8+mITVbvyukeAlrj3O08EeKusfdUCU5Hyi3BaggmfVytS8DVKI9gaJw
   ZQyUoBOjxLrzmPeqhUlNplR9cOTnPvGna4HZGv/ywaKkCCCPuaB+W12rb
   BwIp+sIHv3lgrXOj2WxXtp4OtMqm/UQUtRWZ2m4kcUOYYDMe00N5t0ADq
   QHrHj+otO8cUA+FKW668JfLfyBcMxEL3GOSev3n9WMdtlv9dl6FuuI/Ad
   NYXeUArhEWOmNbKIfAJehP59JVRQfraO0VDKT6pMaQdWTzPO8tCjJSRcK
   d+ECpBbiAbfcBqllR53YUGFditFb3d6fUgXauBv473aFRF0wGujALP2xX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="355473387"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="355473387"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 08:28:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="742754608"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="742754608"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 31 Aug 2023 08:28:55 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbjbI-0000IJ-26;
	Thu, 31 Aug 2023 15:28:52 +0000
Date: Thu, 31 Aug 2023 23:27:55 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:xen/host 6/6] drivers/xen/privcmd.c:1367:13: warning:
 variable 'ret' set but not used
Message-ID: <202308312325.tItBBWys-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git xen/host
head:   52b07a3861a34fb0deb6251bae8bd885815c6944
commit: 52b07a3861a34fb0deb6251bae8bd885815c6944 [6/6] xen: privcmd: Add support for ioeventfd
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230831/202308312325.tItBBWys-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308312325.tItBBWys-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308312325.tItBBWys-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/xen/privcmd.c: In function 'privcmd_ioeventfd_deassign':
>> drivers/xen/privcmd.c:1367:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1367 |         int ret = 0;
         |             ^~~


vim +/ret +1367 drivers/xen/privcmd.c

  1362	
  1363	static int privcmd_ioeventfd_deassign(struct privcmd_ioeventfd *ioeventfd)
  1364	{
  1365		struct privcmd_kernel_ioreq *kioreq, *tkioreq;
  1366		struct eventfd_ctx *eventfd;
> 1367		int ret = 0;
  1368	
  1369		eventfd = eventfd_ctx_fdget(ioeventfd->event_fd);
  1370		if (IS_ERR(eventfd))
  1371			return PTR_ERR(eventfd);
  1372	
  1373		mutex_lock(&ioreq_lock);
  1374		list_for_each_entry_safe(kioreq, tkioreq, &ioreq_list, list) {
  1375			struct privcmd_kernel_ioeventfd *kioeventfd, *tmp;
  1376			/*
  1377			 * kioreq fields can be accessed here without a lock as they are
  1378			 * never updated after being added to the ioreq_list.
  1379			 */
  1380			if (kioreq->dom != ioeventfd->dom ||
  1381			    kioreq->uioreq != ioeventfd->ioreq ||
  1382			    kioreq->vcpus != ioeventfd->vcpus)
  1383				continue;
  1384	
  1385			mutex_lock(&kioreq->lock);
  1386			list_for_each_entry_safe(kioeventfd, tmp, &kioreq->ioeventfds, list) {
  1387				if (eventfd == kioeventfd->eventfd) {
  1388					ioeventfd_free(kioeventfd);
  1389					mutex_unlock(&kioreq->lock);
  1390	
  1391					ioreq_free(kioreq);
  1392					goto unlock;
  1393				}
  1394			}
  1395			mutex_unlock(&kioreq->lock);
  1396			break;
  1397		}
  1398	
  1399		pr_err("Ioeventfd isn't already assigned, dom: %u, addr: %llu\n",
  1400				ioeventfd->dom, ioeventfd->addr);
  1401		ret = -ENODEV;
  1402	
  1403	unlock:
  1404		mutex_unlock(&ioreq_lock);
  1405		eventfd_ctx_put(eventfd);
  1406	
  1407		return 0;
  1408	}
  1409	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
