Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5AC263C75
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Feb 2025 10:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740477750; cv=none; b=a1qwgXfFDOeillrL1Q5/b/wFL7Nw+NHOC0EUAlU/GJ5kMujl5TWm8wvccbCceYGHxVch//w3+5EE8CRtb4FtNONzf9Jz9ocnxDolNa447Ez58ItC8OEzwQHiTLsuuUblWJNK8qUgHJ3WRgDDkeasvoXmkDMc1LxMVjaYRzcsjCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740477750; c=relaxed/simple;
	bh=VdECs7pAQ6IeAPof7xAQ7PXwep0JBiBn269twn0dF5M=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LB6S+SQVq4z6rqlCgdqAaZMdhWHm/KTQK8sKCFHStXIVvBj0NNblCmck6LwANspYnduinONQV4AU2D+PrB7cmBfITpfor9Imb6PbnGA/kmqVqkbZEtYDKIxNG1zvkkU+M5W2TrZAUjz2nEpsiDggFBMF5+9g8hCfHrm0JXjqE5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nQtwomEt; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nQtwomEt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740477749; x=1772013749;
  h=date:from:cc:subject:message-id:mime-version;
  bh=VdECs7pAQ6IeAPof7xAQ7PXwep0JBiBn269twn0dF5M=;
  b=nQtwomEtDza+cAWMqR7LykRlmVTEDtpUingohmBv6hmgC4Q+kd+5QBkU
   gX+2six28IRoJ8m2c5yKOrLirGLBEA8d5jUlubYQpHD/KV6dy6rDaAD2k
   u6M2zD0z8839eB3/KdWiu8g3ahMvVfJ06z3h0YKJQVInMNUF8Q1LIgq0y
   Glij/MHILBLBjffj6VckTELYmTNwVmsMM2dhT8NBm7UIqzEmjmNLEpFFF
   v3rCcQNumEPQwronZaUiRPt7cOZIvn84h2VRvpElojzzEmnLQFqO51nPZ
   g6Qgtx6lpMC+VqoGdbTBAD0D0i6Ko2LUY22SiU3TsB07XxGiwh2lSsQtZ
   Q==;
X-CSE-ConnectionGUID: PHUOpDkxQQGXyuAer39eIw==
X-CSE-MsgGUID: 1FBaYdXOTbiKuaXr0TWc3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="45060251"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="45060251"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 02:02:28 -0800
X-CSE-ConnectionGUID: jjIT6/AeQOyPhR2JSUHpLQ==
X-CSE-MsgGUID: EL92iP3vRdmJMKbdlcx7GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="116967367"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 25 Feb 2025 02:02:27 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmrlb-000A5S-09
	for oe-kbuild-all@lists.linux.dev;
	Tue, 25 Feb 2025 10:02:20 +0000
Date: Tue, 25 Feb 2025 18:02:03 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/59 1/1] drivers/scsi/libiscsi.c:1703:7: warning: this
 statement may fall through
Message-ID: <202502251709.Y3JcwQhp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rafael,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/59
head:   19ae9bc73680fd6c1c95edb5b7e2aaa790e7f011
commit: 3807b6fec674e88d9cc653427728581263311141 [1/1] scsi: libiscsi: Allow sd_shutdown on bad transport
config: xtensa-randconfig-002-20250218 (https://download.01.org/0day-ci/archive/20250225/202502251709.Y3JcwQhp-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502251709.Y3JcwQhp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502251709.Y3JcwQhp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:10:0,
                    from include/linux/kfifo.h:53,
                    from drivers/scsi/libiscsi.c:25:
   include/linux/dma-mapping.h: In function 'dma_map_resource':
   arch/xtensa/include/asm/page.h:185:9: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
     ((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
            ^
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   include/linux/dma-mapping.h:327:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
     ^~~~~~
   include/linux/dma-mapping.h:327:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   drivers/scsi/libiscsi.c: In function 'iscsi_queuecommand':
>> drivers/scsi/libiscsi.c:1703:7: warning: this statement may fall through [-Wimplicit-fallthrough=]
       if (unlikely(system_state != SYSTEM_RUNNING)) {
          ^
   drivers/scsi/libiscsi.c:1708:3: note: here
      case ISCSI_STATE_IN_RECOVERY:
      ^~~~


vim +1703 drivers/scsi/libiscsi.c

  1665	
  1666	int iscsi_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *sc)
  1667	{
  1668		struct iscsi_cls_session *cls_session;
  1669		struct iscsi_host *ihost;
  1670		int reason = 0;
  1671		struct iscsi_session *session;
  1672		struct iscsi_conn *conn;
  1673		struct iscsi_task *task = NULL;
  1674	
  1675		sc->result = 0;
  1676		sc->SCp.ptr = NULL;
  1677	
  1678		ihost = shost_priv(host);
  1679	
  1680		cls_session = starget_to_session(scsi_target(sc->device));
  1681		session = cls_session->dd_data;
  1682		spin_lock_bh(&session->frwd_lock);
  1683	
  1684		reason = iscsi_session_chkready(cls_session);
  1685		if (reason) {
  1686			sc->result = reason;
  1687			goto fault;
  1688		}
  1689	
  1690		if (session->state != ISCSI_STATE_LOGGED_IN) {
  1691			/*
  1692			 * to handle the race between when we set the recovery state
  1693			 * and block the session we requeue here (commands could
  1694			 * be entering our queuecommand while a block is starting
  1695			 * up because the block code is not locked)
  1696			 */
  1697			switch (session->state) {
  1698			case ISCSI_STATE_FAILED:
  1699				/*
  1700				 * cmds should fail during shutdown, if the session
  1701				 * state is bad, allowing completion to happen
  1702				 */
> 1703				if (unlikely(system_state != SYSTEM_RUNNING)) {
  1704					reason = FAILURE_SESSION_FAILED;
  1705					sc->result = DID_NO_CONNECT << 16;
  1706					break;
  1707				}
  1708			case ISCSI_STATE_IN_RECOVERY:
  1709				reason = FAILURE_SESSION_IN_RECOVERY;
  1710				sc->result = DID_IMM_RETRY << 16;
  1711				break;
  1712			case ISCSI_STATE_LOGGING_OUT:
  1713				reason = FAILURE_SESSION_LOGGING_OUT;
  1714				sc->result = DID_IMM_RETRY << 16;
  1715				break;
  1716			case ISCSI_STATE_RECOVERY_FAILED:
  1717				reason = FAILURE_SESSION_RECOVERY_TIMEOUT;
  1718				sc->result = DID_TRANSPORT_FAILFAST << 16;
  1719				break;
  1720			case ISCSI_STATE_TERMINATE:
  1721				reason = FAILURE_SESSION_TERMINATE;
  1722				sc->result = DID_NO_CONNECT << 16;
  1723				break;
  1724			default:
  1725				reason = FAILURE_SESSION_FREED;
  1726				sc->result = DID_NO_CONNECT << 16;
  1727			}
  1728			goto fault;
  1729		}
  1730	
  1731		conn = session->leadconn;
  1732		if (!conn) {
  1733			reason = FAILURE_SESSION_FREED;
  1734			sc->result = DID_NO_CONNECT << 16;
  1735			goto fault;
  1736		}
  1737	
  1738		if (test_bit(ISCSI_SUSPEND_BIT, &conn->suspend_tx)) {
  1739			reason = FAILURE_SESSION_IN_RECOVERY;
  1740			sc->result = DID_REQUEUE << 16;
  1741			goto fault;
  1742		}
  1743	
  1744		if (iscsi_check_cmdsn_window_closed(conn)) {
  1745			reason = FAILURE_WINDOW_CLOSED;
  1746			goto reject;
  1747		}
  1748	
  1749		task = iscsi_alloc_task(conn, sc);
  1750		if (!task) {
  1751			reason = FAILURE_OOM;
  1752			goto reject;
  1753		}
  1754	
  1755		if (!ihost->workq) {
  1756			reason = iscsi_prep_scsi_cmd_pdu(task);
  1757			if (reason) {
  1758				if (reason == -ENOMEM ||  reason == -EACCES) {
  1759					reason = FAILURE_OOM;
  1760					goto prepd_reject;
  1761				} else {
  1762					sc->result = DID_ABORT << 16;
  1763					goto prepd_fault;
  1764				}
  1765			}
  1766			if (session->tt->xmit_task(task)) {
  1767				session->cmdsn--;
  1768				reason = FAILURE_SESSION_NOT_READY;
  1769				goto prepd_reject;
  1770			}
  1771		} else {
  1772			spin_lock_bh(&conn->taskqueuelock);
  1773			list_add_tail(&task->running, &conn->cmdqueue);
  1774			spin_unlock_bh(&conn->taskqueuelock);
  1775			iscsi_conn_queue_work(conn);
  1776		}
  1777	
  1778		session->queued_cmdsn++;
  1779		spin_unlock_bh(&session->frwd_lock);
  1780		return 0;
  1781	
  1782	prepd_reject:
  1783		iscsi_complete_task(task, ISCSI_TASK_REQUEUE_SCSIQ);
  1784	reject:
  1785		spin_unlock_bh(&session->frwd_lock);
  1786		ISCSI_DBG_SESSION(session, "cmd 0x%x rejected (%d)\n",
  1787				  sc->cmnd[0], reason);
  1788		return SCSI_MLQUEUE_TARGET_BUSY;
  1789	
  1790	prepd_fault:
  1791		iscsi_complete_task(task, ISCSI_TASK_REQUEUE_SCSIQ);
  1792	fault:
  1793		spin_unlock_bh(&session->frwd_lock);
  1794		ISCSI_DBG_SESSION(session, "iscsi: cmd 0x%x is not queued (%d)\n",
  1795				  sc->cmnd[0], reason);
  1796		if (!scsi_bidi_cmnd(sc))
  1797			scsi_set_resid(sc, scsi_bufflen(sc));
  1798		else {
  1799			scsi_out(sc)->resid = scsi_out(sc)->length;
  1800			scsi_in(sc)->resid = scsi_in(sc)->length;
  1801		}
  1802		sc->scsi_done(sc);
  1803		return 0;
  1804	}
  1805	EXPORT_SYMBOL_GPL(iscsi_queuecommand);
  1806	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
