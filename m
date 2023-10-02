Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FC118E11
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Oct 2023 13:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696253278; x=1727789278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tOrXLzVc7gwch/xSYTkejRuAwrJunHFmbQM4N5mMsWY=;
  b=LvIE+GjaGNbE3gk1WK3WxBbdiXBsKdOUpizsb8J/URDSjl+MzkMlWFq2
   uX/HNpzOv3zFIuhHti1gA/3O3Flzc5BXibRZ0FWtqVbTjVXCktGOShsXp
   VCT+27mDcwmt0iXtwJnpmKlLFyxQ4yb++k/kQOa6YtiP7QD8HguDOTbnQ
   FB/WNWk+4IRUrFnrSCZmWSrd6YaSO6YjHvnDFBDp1wlDgIjTgY/iXMoSQ
   SxZtBXcm7nd3eyRRcuNWUV1TbxGt0eKgLuTCu9hL7QBL3vtOcalijr3LQ
   zhMB4RL/Ojpowop6uzAnt+5UQYffUqBbrQ1pWtocP77obOHGvN3upI3N0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="449132354"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="449132354"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 06:27:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="744109749"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="744109749"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 02 Oct 2023 06:27:56 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnIxm-00065N-0f;
	Mon, 02 Oct 2023 13:27:54 +0000
Date: Mon, 2 Oct 2023 21:26:57 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-lib 29/34] include/trace/events/netfs.h:382:23:
 warning: format '%zx' expects argument of type 'size_t', but argument 5 has
 type 'long unsigned int'
Message-ID: <202310022102.7C9Wie4q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-lib
head:   8b08a7e2d3217f7054808246fc559c867f54a524
commit: c0d0c0e1e9adab1d4d2ca4396d1add91f0cd68ea [29/34] netfs: Implement buffered writes through netfs_file_write_iter()
config: powerpc-randconfig-002-20231002 (https://download.01.org/0day-ci/archive/20231002/202310022102.7C9Wie4q-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231002/202310022102.7C9Wie4q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310022102.7C9Wie4q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from include/trace/events/netfs.h:476,
                    from fs/netfs/main.c:14:
   include/trace/events/netfs.h: In function 'trace_raw_output_netfs_folio_dirty':
>> include/trace/events/netfs.h:382:23: warning: format '%zx' expects argument of type 'size_t', but argument 5 has type 'long unsigned int' [-Wformat=]
     382 |             TP_printk("i=%05lx ix=%05lx-%05zx %s",
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
      45 |                              PARAMS(print));                   \
         |                              ^~~~~~
   include/trace/events/netfs.h:363:1: note: in expansion of macro 'TRACE_EVENT'
     363 | TRACE_EVENT(netfs_folio_dirty,
         | ^~~~~~~~~~~
   include/trace/events/netfs.h:382:13: note: in expansion of macro 'TP_printk'
     382 |             TP_printk("i=%05lx ix=%05lx-%05zx %s",
         |             ^~~~~~~~~
   In file included from include/trace/trace_events.h:237:
   include/trace/events/netfs.h:382:45: note: format string is defined here
     382 |             TP_printk("i=%05lx ix=%05lx-%05zx %s",
         |                                         ~~~~^
         |                                             |
         |                                             unsigned int
         |                                         %05lx

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ADB_CUDA
   Depends on [n]: MACINTOSH_DRIVERS [=n] && (ADB [=n] || PPC_PMAC [=y]) && !PPC_PMAC64 [=n]
   Selected by [y]:
   - PPC_PMAC [=y] && PPC_BOOK3S [=y] && CPU_BIG_ENDIAN [=y] && POWER_RESET [=y] && PPC32 [=y]


vim +382 include/trace/events/netfs.h

   172	
   173	TRACE_EVENT(netfs_read,
   174		    TP_PROTO(struct netfs_io_request *rreq,
   175			     loff_t start, size_t len,
   176			     enum netfs_read_trace what),
   177	
   178		    TP_ARGS(rreq, start, len, what),
   179	
   180		    TP_STRUCT__entry(
   181			    __field(unsigned int,		rreq		)
   182			    __field(unsigned int,		cookie		)
   183			    __field(loff_t,			start		)
   184			    __field(size_t,			len		)
   185			    __field(enum netfs_read_trace,	what		)
   186			    __field(unsigned int,		netfs_inode	)
   187				     ),
   188	
   189		    TP_fast_assign(
   190			    __entry->rreq	= rreq->debug_id;
   191			    __entry->cookie	= rreq->cache_resources.debug_id;
   192			    __entry->start	= start;
   193			    __entry->len	= len;
   194			    __entry->what	= what;
   195			    __entry->netfs_inode = rreq->inode->i_ino;
   196				   ),
   197	
   198		    TP_printk("R=%08x %s c=%08x ni=%x s=%llx %zx",
   199			      __entry->rreq,
   200			      __print_symbolic(__entry->what, netfs_read_traces),
   201			      __entry->cookie,
   202			      __entry->netfs_inode,
   203			      __entry->start, __entry->len)
   204		    );
   205	
   206	TRACE_EVENT(netfs_rreq,
   207		    TP_PROTO(struct netfs_io_request *rreq,
   208			     enum netfs_rreq_trace what),
   209	
   210		    TP_ARGS(rreq, what),
   211	
   212		    TP_STRUCT__entry(
   213			    __field(unsigned int,		rreq		)
   214			    __field(unsigned int,		flags		)
   215			    __field(enum netfs_io_origin,	origin		)
   216			    __field(enum netfs_rreq_trace,	what		)
   217				     ),
   218	
   219		    TP_fast_assign(
   220			    __entry->rreq	= rreq->debug_id;
   221			    __entry->flags	= rreq->flags;
   222			    __entry->origin	= rreq->origin;
   223			    __entry->what	= what;
   224				   ),
   225	
   226		    TP_printk("R=%08x %s %s f=%02x",
   227			      __entry->rreq,
   228			      __print_symbolic(__entry->origin, netfs_rreq_origins),
   229			      __print_symbolic(__entry->what, netfs_rreq_traces),
   230			      __entry->flags)
   231		    );
   232	
   233	TRACE_EVENT(netfs_sreq,
   234		    TP_PROTO(struct netfs_io_subrequest *sreq,
   235			     enum netfs_sreq_trace what),
   236	
   237		    TP_ARGS(sreq, what),
   238	
   239		    TP_STRUCT__entry(
   240			    __field(unsigned int,		rreq		)
   241			    __field(unsigned short,		index		)
   242			    __field(short,			error		)
   243			    __field(unsigned short,		flags		)
   244			    __field(enum netfs_io_source,	source		)
   245			    __field(enum netfs_sreq_trace,	what		)
   246			    __field(size_t,			len		)
   247			    __field(size_t,			transferred	)
   248			    __field(loff_t,			start		)
   249				     ),
   250	
   251		    TP_fast_assign(
   252			    __entry->rreq	= sreq->rreq->debug_id;
   253			    __entry->index	= sreq->debug_index;
   254			    __entry->error	= sreq->error;
   255			    __entry->flags	= sreq->flags;
   256			    __entry->source	= sreq->source;
   257			    __entry->what	= what;
   258			    __entry->len	= sreq->len;
   259			    __entry->transferred = sreq->transferred;
   260			    __entry->start	= sreq->start;
   261				   ),
   262	
   263		    TP_printk("R=%08x[%u] %s %s f=%02x s=%llx %zx/%zx e=%d",
   264			      __entry->rreq, __entry->index,
   265			      __print_symbolic(__entry->source, netfs_sreq_sources),
   266			      __print_symbolic(__entry->what, netfs_sreq_traces),
   267			      __entry->flags,
   268			      __entry->start, __entry->transferred, __entry->len,
   269			      __entry->error)
   270		    );
   271	
   272	TRACE_EVENT(netfs_failure,
   273		    TP_PROTO(struct netfs_io_request *rreq,
   274			     struct netfs_io_subrequest *sreq,
   275			     int error, enum netfs_failure what),
   276	
   277		    TP_ARGS(rreq, sreq, error, what),
   278	
   279		    TP_STRUCT__entry(
   280			    __field(unsigned int,		rreq		)
   281			    __field(short,			index		)
   282			    __field(short,			error		)
   283			    __field(unsigned short,		flags		)
   284			    __field(enum netfs_io_source,	source		)
   285			    __field(enum netfs_failure,		what		)
   286			    __field(size_t,			len		)
   287			    __field(size_t,			transferred	)
   288			    __field(loff_t,			start		)
   289				     ),
   290	
   291		    TP_fast_assign(
   292			    __entry->rreq	= rreq->debug_id;
   293			    __entry->index	= sreq ? sreq->debug_index : -1;
   294			    __entry->error	= error;
   295			    __entry->flags	= sreq ? sreq->flags : 0;
   296			    __entry->source	= sreq ? sreq->source : NETFS_INVALID_READ;
   297			    __entry->what	= what;
   298			    __entry->len	= sreq ? sreq->len : rreq->len;
   299			    __entry->transferred = sreq ? sreq->transferred : 0;
   300			    __entry->start	= sreq ? sreq->start : 0;
   301				   ),
   302	
   303		    TP_printk("R=%08x[%d] %s f=%02x s=%llx %zx/%zx %s e=%d",
   304			      __entry->rreq, __entry->index,
   305			      __print_symbolic(__entry->source, netfs_sreq_sources),
   306			      __entry->flags,
   307			      __entry->start, __entry->transferred, __entry->len,
   308			      __print_symbolic(__entry->what, netfs_failures),
   309			      __entry->error)
   310		    );
   311	
   312	TRACE_EVENT(netfs_rreq_ref,
   313		    TP_PROTO(unsigned int rreq_debug_id, int ref,
   314			     enum netfs_rreq_ref_trace what),
   315	
   316		    TP_ARGS(rreq_debug_id, ref, what),
   317	
   318		    TP_STRUCT__entry(
   319			    __field(unsigned int,		rreq		)
   320			    __field(int,			ref		)
   321			    __field(enum netfs_rreq_ref_trace,	what		)
   322				     ),
   323	
   324		    TP_fast_assign(
   325			    __entry->rreq	= rreq_debug_id;
   326			    __entry->ref	= ref;
   327			    __entry->what	= what;
   328				   ),
   329	
   330		    TP_printk("R=%08x %s r=%u",
   331			      __entry->rreq,
   332			      __print_symbolic(__entry->what, netfs_rreq_ref_traces),
   333			      __entry->ref)
   334		    );
   335	
   336	TRACE_EVENT(netfs_sreq_ref,
   337		    TP_PROTO(unsigned int rreq_debug_id, unsigned int subreq_debug_index,
   338			     int ref, enum netfs_sreq_ref_trace what),
   339	
   340		    TP_ARGS(rreq_debug_id, subreq_debug_index, ref, what),
   341	
   342		    TP_STRUCT__entry(
   343			    __field(unsigned int,		rreq		)
   344			    __field(unsigned int,		subreq		)
   345			    __field(int,			ref		)
   346			    __field(enum netfs_sreq_ref_trace,	what		)
   347				     ),
   348	
   349		    TP_fast_assign(
   350			    __entry->rreq	= rreq_debug_id;
   351			    __entry->subreq	= subreq_debug_index;
   352			    __entry->ref	= ref;
   353			    __entry->what	= what;
   354				   ),
   355	
   356		    TP_printk("R=%08x[%x] %s r=%u",
   357			      __entry->rreq,
   358			      __entry->subreq,
   359			      __print_symbolic(__entry->what, netfs_sreq_ref_traces),
   360			      __entry->ref)
   361		    );
   362	
   363	TRACE_EVENT(netfs_folio_dirty,
   364		    TP_PROTO(struct folio *folio, enum netfs_dirty_trace why),
   365	
   366		    TP_ARGS(folio, why),
   367	
   368		    TP_STRUCT__entry(
   369			    __field(ino_t,			ino)
   370			    __field(pgoff_t,			index)
   371			    __field(unsigned int,		nr)
   372			    __field(enum netfs_dirty_trace,	why)
   373				     ),
   374	
   375		    TP_fast_assign(
   376			    __entry->ino = folio->mapping->host->i_ino;
   377			    __entry->why = why;
   378			    __entry->index = folio_index(folio);
   379			    __entry->nr = folio_nr_pages(folio);
   380				   ),
   381	
 > 382		    TP_printk("i=%05lx ix=%05lx-%05zx %s",
   383			      __entry->ino, __entry->index, __entry->index + __entry->nr - 1,
   384			      __print_symbolic(__entry->why, netfs_dirty_traces))
   385		    );
   386	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
