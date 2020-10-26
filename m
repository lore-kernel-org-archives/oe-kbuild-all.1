Content-Type: multipart/mixed; boundary="===============4790198021170626209=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [vfs:work.epoll 17/27] fs/eventpoll.c:1629:3: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing
Date: Mon, 26 Oct 2020 10:09:47 +0800
Message-ID: <202010261043.dPTrCpUD-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4790198021170626209==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.e=
poll
head:   319c15174757aaedacc89a6e55c965416f130e64
commit: ff07952aeda8563d5080da3a0754db83ed0650f6 [17/27] ep_send_events_pro=
c(): fold into the caller
compiler: h8300-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"cppcheck warnings: (new ones prefixed by >>)"
>> fs/eventpoll.c:1629:3: warning: Assignment of function parameter has no =
effect outside the function. Did you forget dereferencing it? [uselessAssig=
nmentPtrArg]
     events++;
     ^

vim +1629 fs/eventpoll.c

  1565	=

  1566	static int ep_send_events(struct eventpoll *ep,
  1567				  struct epoll_event __user *events, int maxevents)
  1568	{
  1569		struct epitem *epi, *tmp;
  1570		LIST_HEAD(txlist);
  1571		poll_table pt;
  1572		int res =3D 0;
  1573	=

  1574		init_poll_funcptr(&pt, NULL);
  1575	=

  1576		ep_start_scan(ep, 0, false, &txlist);
  1577	=

  1578		/*
  1579		 * We can loop without lock because we are passed a task private li=
st.
  1580		 * Items cannot vanish during the loop because ep_scan_ready_list()=
 is
  1581		 * holding "mtx" during this call.
  1582		 */
  1583		lockdep_assert_held(&ep->mtx);
  1584	=

  1585		list_for_each_entry_safe(epi, tmp, &txlist, rdllink) {
  1586			struct wakeup_source *ws;
  1587			__poll_t revents;
  1588	=

  1589			if (res >=3D maxevents)
  1590				break;
  1591	=

  1592			/*
  1593			 * Activate ep->ws before deactivating epi->ws to prevent
  1594			 * triggering auto-suspend here (in case we reactive epi->ws
  1595			 * below).
  1596			 *
  1597			 * This could be rearranged to delay the deactivation of epi->ws
  1598			 * instead, but then epi->ws would temporarily be out of sync
  1599			 * with ep_is_linked().
  1600			 */
  1601			ws =3D ep_wakeup_source(epi);
  1602			if (ws) {
  1603				if (ws->active)
  1604					__pm_stay_awake(ep->ws);
  1605				__pm_relax(ws);
  1606			}
  1607	=

  1608			list_del_init(&epi->rdllink);
  1609	=

  1610			/*
  1611			 * If the event mask intersect the caller-requested one,
  1612			 * deliver the event to userspace. Again, ep_scan_ready_list()
  1613			 * is holding ep->mtx, so no operations coming from userspace
  1614			 * can change the item.
  1615			 */
  1616			revents =3D ep_item_poll(epi, &pt, 1);
  1617			if (!revents)
  1618				continue;
  1619	=

  1620			if (__put_user(revents, &events->events) ||
  1621			    __put_user(epi->event.data, &events->data)) {
  1622				list_add(&epi->rdllink, &txlist);
  1623				ep_pm_stay_awake(epi);
  1624				if (!res)
  1625					res =3D -EFAULT;
  1626				break;
  1627			}
  1628			res++;
> 1629			events++;
  1630			if (epi->event.events & EPOLLONESHOT)
  1631				epi->event.events &=3D EP_PRIVATE_BITS;
  1632			else if (!(epi->event.events & EPOLLET)) {
  1633				/*
  1634				 * If this file has been added with Level
  1635				 * Trigger mode, we need to insert back inside
  1636				 * the ready list, so that the next call to
  1637				 * epoll_wait() will check again the events
  1638				 * availability. At this point, no one can insert
  1639				 * into ep->rdllist besides us. The epoll_ctl()
  1640				 * callers are locked out by
  1641				 * ep_scan_ready_list() holding "mtx" and the
  1642				 * poll callback will queue them in ep->ovflist.
  1643				 */
  1644				list_add_tail(&epi->rdllink, &ep->rdllist);
  1645				ep_pm_stay_awake(epi);
  1646			}
  1647		}
  1648		ep_done_scan(ep, 0, false, &txlist);
  1649	=

  1650		return res;
  1651	}
  1652	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4790198021170626209==--

