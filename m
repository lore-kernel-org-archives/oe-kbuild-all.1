Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E01D3659F9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 04:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789012824; cv=none; b=XhEL6VR/Q7NR3AyY7Nge8phzLcortfOo5LeAUPxCRMS8LGEDOCXB9zRu5wpMKkKBYleZQ6bQZXT4HfOoQJ8WXflKVKSBzEcjDioHg/Omlf6IRoCq8BQTmzB2oG8yP/zJb5GToCMxihh0wzbqLysPQZK02xI5CXGQCmArR4sHZbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789012824; c=relaxed/simple;
	bh=2mz+yQlECs6WGGC4TRMDWJJ8uEGU7LSDVDCs0t5iKNo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GoxUc3OmmsISZJe+osq5IxiiwT3FemXt+oRpAc3tU4RITiirQUSei/Qpyf04SUZLiibLdMEG4D+YUEavj1L+YPVh9RAz8QdF0ySC1wY9iiNGQREMJwfHRZ+l9eNpc6gTK0t3+QskGaqVthHPZoZMSKWzeXlwvEejz0gAJalGe3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IQftoBjt; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IQftoBjt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789012823; x=1820548823;
  h=date:from:to:cc:subject:message-id;
  bh=2mz+yQlECs6WGGC4TRMDWJJ8uEGU7LSDVDCs0t5iKNo=;
  b=IQftoBjtidxgEU5Z4LliT9CCCaiMAFbhPeH0oPYZ1DR51cZDMZVpvbO+
   LbEzmnCeNiG7K2vvESyI9Q2gt2zA4CwfrTRsiXQJVsCRJiaqyXKz16wdL
   ZuQdEy+f8obwUhtTKMgm6C4fup74A2oaOhz+4sH1qL/kYRXSpUlOeQU8q
   CGUMV/8PcZaz8N5yFgdCpow2eaeyIlIa4CL6Dkv0XXIpgJKnJiIOolxTq
   OCwGPkY34TORluDRoa7pIVQmzc2K5puDxKqI9j6UYPG9qojb+gJA4IXh0
   0tN3QVniGOvFBij/JitDIOFCsF4ukBPiK0jFoBYSmGpMvSTm3rw+QFl8O
   Q==;
X-CSE-ConnectionGUID: Msgh0g88Thy8FD1ZochCDw==
X-CSE-MsgGUID: PyACNhK0QQOjfyUKbdMnkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89493202"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="89493202"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 21:00:23 -0700
X-CSE-ConnectionGUID: 8nNWSizIQGOMjuh7BI4GvQ==
X-CSE-MsgGUID: ChdKIU0EQDiP+aj3I5V+nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="265303573"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Sep 2026 21:00:21 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4VxS-000000001M4-20zY;
	Thu, 10 Sep 2026 04:00:18 +0000
Date: Thu, 10 Sep 2026 11:59:39 +0800
From: kernel test robot <lkp@intel.com>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev, Niklas Cassel <cassel@kernel.org>
Subject: [libata:for-next 7/7]
 drivers/ata/pata_parport/pata_parport.c:621:17: error: implicit declaration
 of function 'pi_remove_one'
Message-ID: <202609101150.Kg7ukDda-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/libata/linux.git for-next
head:   d82c5cf658c306979c786a6702487cf9fbc2b5de
commit: d82c5cf658c306979c786a6702487cf9fbc2b5de [7/7] ata: pata_parport: unregister devices on protocol unregister
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260910/202609101150.Kg7ukDda-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609101150.Kg7ukDda-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609101150.Kg7ukDda-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/ata/pata_parport/pata_parport.c: In function 'pi_remove_by_proto':
>> drivers/ata/pata_parport/pata_parport.c:621:17: error: implicit declaration of function 'pi_remove_one' [-Wimplicit-function-declaration]
     621 |                 pi_remove_one(dev);
         |                 ^~~~~~~~~~~~~
   drivers/ata/pata_parport/pata_parport.c: At top level:
   drivers/ata/pata_parport/pata_parport.c:707:13: warning: conflicting types for 'pi_remove_one'; have 'void(struct device *)'
     707 | static void pi_remove_one(struct device *dev)
         |             ^~~~~~~~~~~~~
>> drivers/ata/pata_parport/pata_parport.c:707:13: error: static declaration of 'pi_remove_one' follows non-static declaration
   drivers/ata/pata_parport/pata_parport.c:621:17: note: previous implicit declaration of 'pi_remove_one' with type 'void(struct device *)'
     621 |                 pi_remove_one(dev);
         |                 ^~~~~~~~~~~~~


vim +/pi_remove_one +621 drivers/ata/pata_parport/pata_parport.c

   613	
   614	static int pi_remove_by_proto(struct device *dev, void *data)
   615	{
   616		struct pi_protocol *pr = data;
   617		struct ata_host *host = dev_get_drvdata(dev);
   618		struct pi_adapter *pi = host->private_data;
   619	
   620		if (pi->proto == pr)
 > 621			pi_remove_one(dev);
   622	
   623		return 0;
   624	}
   625	
   626	void pata_parport_unregister_driver(struct pi_protocol *pr)
   627	{
   628		struct pi_protocol *pr_iter;
   629		int id = -1;
   630	
   631		mutex_lock(&pi_mutex);
   632		idr_for_each_entry(&protocols, pr_iter, id) {
   633			if (pr_iter == pr)
   634				break;
   635		}
   636		idr_remove(&protocols, id);
   637		/* remove adapters using this protocol while the module is still alive */
   638		bus_for_each_dev(&pata_parport_bus_type, NULL, pr, pi_remove_by_proto);
   639		driver_unregister(&pr->driver);
   640		mutex_unlock(&pi_mutex);
   641	
   642	}
   643	EXPORT_SYMBOL_GPL(pata_parport_unregister_driver);
   644	
   645	static ssize_t new_device_store(const struct bus_type *bus, const char *buf, size_t count)
   646	{
   647		char port[12] = "auto";
   648		char protocol[8] = "auto";
   649		int mode = -1, unit = -1, delay = -1;
   650		struct pi_protocol *pr, *pr_wanted;
   651		struct device_driver *drv;
   652		struct parport *parport;
   653		int port_num, port_wanted, pr_num;
   654		bool ok = false;
   655	
   656		if (sscanf(buf, "%11s %7s %d %d %d",
   657				port, protocol, &mode, &unit, &delay) < 1)
   658			return -EINVAL;
   659	
   660		if (sscanf(port, "parport%u", &port_wanted) < 1) {
   661			if (strcmp(port, "auto")) {
   662				pr_err("invalid port name %s\n", port);
   663				return -EINVAL;
   664			}
   665			port_wanted = -1;
   666		}
   667	
   668		mutex_lock(&pi_mutex);
   669		drv = driver_find(protocol, &pata_parport_bus_type);
   670		if (!drv) {
   671			if (strcmp(protocol, "auto")) {
   672				pr_err("protocol %s not found\n", protocol);
   673				mutex_unlock(&pi_mutex);
   674				return -EINVAL;
   675			}
   676			pr_wanted = NULL;
   677		} else {
   678			pr_wanted = container_of(drv, struct pi_protocol, driver);
   679		}
   680		/* walk all parports */
   681		idr_for_each_entry(&parport_list, parport, port_num) {
   682			if (port_num == port_wanted || port_wanted == -1) {
   683				parport = parport_find_number(port_num);
   684				if (!parport) {
   685					pr_err("no such port %s\n", port);
   686					mutex_unlock(&pi_mutex);
   687					return -ENODEV;
   688				}
   689				/* walk all protocols */
   690				idr_for_each_entry(&protocols, pr, pr_num) {
   691					if (pr == pr_wanted || !pr_wanted)
   692						if (pi_init_one(parport, pr, mode, unit,
   693								delay))
   694							ok = true;
   695				}
   696				parport_put_port(parport);
   697			}
   698		}
   699		mutex_unlock(&pi_mutex);
   700		if (!ok)
   701			return -ENODEV;
   702	
   703		return count;
   704	}
   705	static BUS_ATTR_WO(new_device);
   706	
 > 707	static void pi_remove_one(struct device *dev)
   708	{
   709		struct ata_host *host = dev_get_drvdata(dev);
   710		struct pi_adapter *pi = host->private_data;
   711	
   712		ata_host_detach(host);
   713		pi_disconnect(pi);
   714		pi_release(pi);
   715		device_unregister(dev);
   716		/* pata_parport_dev_release will do ida_free(dev->id) and kfree(pi) */
   717	}
   718	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
